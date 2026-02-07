import 'dart:async';
import 'dart:io';

import 'package:lensfolio_mobile_app/configs/configs.dart';
import 'package:lensfolio_mobile_app/models/user/generated_profile.dart';
import 'package:lensfolio_mobile_app/models/user/user_data.dart';
import 'package:lensfolio_mobile_app/repos/user/user_repo.dart';
import 'package:lensfolio_mobile_app/services/app_log.dart';
import 'package:lensfolio_mobile_app/services/cache/app_cache.dart';
import 'package:lensfolio_mobile_app/services/fault/faults.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:lensfolio_mobile_app/services/supabase/supabase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'state.dart';

class UserCubit extends Cubit<UserState> {
  static UserCubit c(BuildContext context, [bool listen = false]) =>
      BlocProvider.of<UserCubit>(context, listen: listen);

  UserCubit() : super(UserState.def());

  Future<void> generateProfile(File file) async {
    emit(
      state.copyWith(
        generateProfile: state.generateProfile.toLoading(),
      ),
    );
    try {
      final data = await UserRepo.ins.generateProfile(file);
      emit(
        state.copyWith(
          generateProfile: state.generateProfile.toSuccess(data: data),
        ),
      );
    } on Fault catch (e) {
      emit(
        state.copyWith(
          generateProfile: state.generateProfile.toFailed(fault: e),
        ),
      );
    }
  }

  Future<void> update(Map<String, dynamic> payload) async {
    emit(
      state.copyWith(
        update: state.update.toLoading(),
      ),
    );
    try {
      final values = {
        'id': state.userData!.id,
        ...payload,
      };
      final data = await UserRepo.ins.update(values)
        ..toCache();

      emit(
        state.copyWith(
          update: state.update.toSuccess(data: data),
          userData: data,
        ),
      );
    } on Fault catch (e) {
      emit(
        state.copyWith(
          update: state.update.toFailed(fault: e),
        ),
      );
    }
  }

  Future<void> fetch() async {
    emit(
      state.copyWith(
        fetch: state.fetch.toLoading(),
      ),
    );
    try {
      final data = await UserRepo.ins.fetch(state.userData!.email)
        ..toCache();
      emit(
        state.copyWith(
          fetch: state.fetch.toSuccess(data: data),
          userData: data,
        ),
      );
    } on Fault catch (e) {
      emit(
        state.copyWith(
          fetch: state.fetch.toFailed(fault: e),
        ),
      );
    }
  }

  Future<void> init() async {
    'Init function was called'.appLog(
      tag: 'USER_CUBIT: init()',
      level: .info,
    );
    emit(
      state.copyWith(
        init: state.init.toLoading(),
      ),
    );
    try {
      final cachedUser = AppCache.ins.user;
      if (cachedUser != null) {
        'User is cached'.appLog(
          tag: 'USER_CUBIT: init()',
          level: .info,
        );
        final data = await UserRepo.ins.fetch(cachedUser.email)
          ..toCache();
        emit(
          state.copyWith(
            init: state.init.toSuccess(data: data),
            userData: data,
          ),
        );
      } else {
        'User is not cached'.appLog(
          tag: 'USER_CUBIT: init()',
          level: .info,
        );
        emit(
          state.copyWith(
            init: state.init.toSuccess(data: null),
            userData: null,
          ),
        );
      }
    } on Fault catch (e) {
      emit(
        state.copyWith(
          init: state.init.toFailed(fault: e),
        ),
      );
      await logout();
    }
  }

  Future<void> register(Map<String, dynamic> values) async {
    'Register function was called'.appLog(
      tag: 'USER_CUBIT: register()',
      level: .info,
    );
    emit(
      state.copyWith(
        register: state.register.toLoading(),
      ),
    );
    try {
      final authResponse = await UserRepo.ins.register(values);
      final user = authResponse.user;
      final userData = await UserRepo.ins.fetch(user!.email!)
        ..toCache();

      'User registered successfully'.appLog(
        tag: 'USER_CUBIT: register()',
        level: .info,
      );

      emit(
        state.copyWith(
          register: state.register.toSuccess(data: userData),
          user: user,
          userData: userData,
          authResponse: authResponse,
        ),
      );
    } on Fault catch (e) {
      emit(
        state.copyWith(
          register: state.register.toFailed(fault: e),
        ),
      );
    }
  }

  Future<void> login(Map<String, dynamic> values) async {
    'Login function was called'.appLog(
      tag: 'USER_CUBIT: login()',
      level: .info,
    );
    emit(
      state.copyWith(
        login: state.login.toLoading(),
      ),
    );
    try {
      final authResponse = await UserRepo.ins.login(values);
      final user = authResponse.user;

      final userData = await UserRepo.ins.fetch(user!.email!)
        ..toCache();

      'User logged in successfully'.appLog(
        tag: 'USER_CUBIT: login()',
        level: .info,
      );

      emit(
        state.copyWith(
          login: state.login.toSuccess(data: userData),
          userData: userData,
          authResponse: authResponse,
          user: user,
        ),
      );
    } on Fault catch (e) {
      emit(
        state.copyWith(
          login: state.login.toFailed(fault: e),
        ),
      );
    }
  }

  Future<void> logout() async {
    emit(
      state.copyWith(
        logout: state.logout.toLoading(),
      ),
    );
    try {
      try {
        await AppCache.ins.reset();
      } catch (e) {
        'Error resetting app cache: $e'.appLog(
          tag: 'USER_CUBIT: logout()',
          level: AppLogLevel.error,
        );
      }
      try {
        await AppSupabase.supabase.auth.signOut();
      } catch (e) {
        'Error signing out user: $e'.appLog(
          tag: 'USER_CUBIT: logout()',
          level: AppLogLevel.error,
        );
      }

      'User logged out successfully'.appLog(
        tag: 'USER_CUBIT: logout()',
        level: .info,
      );

      emit(
        state.copyWith(
          logout: state.logout.toSuccess(),
        ),
      );
      reset();
    } on Fault catch (e) {
      emit(
        state.copyWith(
          logout: state.logout.toFailed(fault: e),
        ),
      );
    }
  }

  void reset() => emit(UserState.def());
}
