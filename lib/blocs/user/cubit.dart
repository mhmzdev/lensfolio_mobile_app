import 'dart:async';

import 'package:lensfolio_mobile_app/configs/configs.dart';
import 'package:lensfolio_mobile_app/models/user/user_data.dart';
import 'package:lensfolio_mobile_app/repos/user/user_repo.dart';
import 'package:lensfolio_mobile_app/services/cache/app_cache.dart';
import 'package:lensfolio_mobile_app/services/fault/faults.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'state.dart';

class UserCubit extends Cubit<UserState> {
  static UserCubit c(BuildContext context, [bool listen = false]) =>
      BlocProvider.of<UserCubit>(context, listen: listen);

  UserCubit() : super(UserState.def());

  Future<void> udpate(Map<String, dynamic> payload) async {
    emit(
      state.copyWith(
        udpate: state.udpate.toLoading(),
      ),
    );
    try {
      final values = {
        'userId': state.userData!.id,
        ...payload,
      };
      final data = await UserRepo.ins.udpate(values)
        ..toCache();

      emit(
        state.copyWith(
          udpate: state.udpate.toSuccess(data: data),
          userData: data,
        ),
      );
    } on Fault catch (e) {
      emit(
        state.copyWith(
          udpate: state.udpate.toFailed(fault: e),
        ),
      );
    }
  }

  Future<void> fetch(int id) async {
    emit(
      state.copyWith(
        fetch: state.fetch.toLoading(),
      ),
    );
    try {
      final data = await UserRepo.ins.fetch(id)
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
    emit(
      state.copyWith(
        init: state.init.toLoading(),
      ),
    );
    try {
      final cachedUser = AppCache.ins.user;
      if (cachedUser != null) {
        final data = await UserRepo.ins.fetch(cachedUser.id)
          ..toCache();
        emit(
          state.copyWith(
            init: state.init.toSuccess(data: data),
            userData: data,
          ),
        );
      } else {
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
    }
  }

  Future<void> register() async {
    emit(
      state.copyWith(
        register: state.register.toLoading(),
      ),
    );
    try {
      final data = await UserRepo.ins.register()
        ..toCache();

      emit(
        state.copyWith(
          register: state.register.toSuccess(data: data),
          userData: data,
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
    emit(
      state.copyWith(
        login: state.login.toLoading(),
      ),
    );
    try {
      final data = await UserRepo.ins.login(values)
        ..toCache();

      emit(
        state.copyWith(
          login: state.login.toSuccess(data: data),
          userData: data,
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
      await AppCache.ins.reset();

      /// TODO: Add when actual DB
      // await AppSupabase.supabase.auth.signOut();

      emit(
        state.copyWith(
          logout: state.logout.toSuccess(),
        ),
      );
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
