import 'dart:async';

import 'package:lensfolio_mobile_app/configs/configs.dart';
import 'package:lensfolio_mobile_app/models/user/user_data.dart';
import 'package:lensfolio_mobile_app/repos/user/user_repo.dart';
import 'package:lensfolio_mobile_app/services/fault/faults.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'state.dart';

class UserCubit extends Cubit<UserState> {
  static UserCubit c(BuildContext context, [bool listen = false]) =>
      BlocProvider.of<UserCubit>(context, listen: listen);

  UserCubit() : super(UserState.def());

  Future<void> register() async {
    emit(
      state.copyWith(
        register: state.register.toLoading(),
      ),
    );
    try {
      final data = await UserRepo.ins.register();
      emit(
        state.copyWith(
          register: state.register.toSuccess(data: data),
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

  Future<void> logout() async {
    emit(
      state.copyWith(
        logout: state.logout.toLoading(),
      ),
    );
    try {
      final data = await UserRepo.ins.logout();
      emit(
        state.copyWith(
          logout: state.logout.toSuccess(data: data),
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

  Future<void> fetch() async {
    emit(
      state.copyWith(
        fetch: state.fetch.toLoading(),
      ),
    );
    try {
      final data = await UserRepo.ins.fetch();
      emit(
        state.copyWith(
          fetch: state.fetch.toSuccess(data: data),
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

  Future<void> login() async {
    emit(
      state.copyWith(
        login: state.login.toLoading(),
      ),
    );
    try {
      final data = await UserRepo.ins.login();
      emit(
        state.copyWith(
          login: state.login.toSuccess(data: data),
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

  void reset() => emit(UserState.def());
}
