import 'dart:async';

import 'package:lensfolio_mobile_app/configs/configs.dart';
import 'package:lensfolio_mobile_app/models/cover_letter/cover_letter.dart';
import 'package:lensfolio_mobile_app/repos/cover_letter/cover_letter_repo.dart';
import 'package:lensfolio_mobile_app/services/fault/faults.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'state.dart';

class CoverLetterCubit extends Cubit<CoverLetterState> {
  static CoverLetterCubit c(BuildContext context, [bool listen = false]) =>
      BlocProvider.of<CoverLetterCubit>(context, listen: listen);

  CoverLetterCubit() : super(CoverLetterState.def());

  Future<void> fetch(int uid) async {
    emit(
      state.copyWith(
        fetch: state.fetch.toLoading(),
      ),
    );
    try {
      final data = await CoverLetterRepo.ins.fetch(uid);
      emit(
        state.copyWith(
          fetch: state.fetch.toSuccess(data: data),
          coverLetters: data,
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

  Future<void> generate(Map<String, dynamic> payload) async {
    emit(
      state.copyWith(
        generate: state.generate.toLoading(),
      ),
    );
    try {
      final data = await CoverLetterRepo.ins.generate(payload);
      emit(
        state.copyWith(
          generate: state.generate.toSuccess(data: data),
        ),
      );
    } on Fault catch (e) {
      emit(
        state.copyWith(
          generate: state.generate.toFailed(fault: e),
        ),
      );
    }
  }

  Future<void> edit(int id, Map<String, dynamic> payload) async {
    emit(
      state.copyWith(
        edit: state.edit.toLoading(),
      ),
    );
    try {
      final data = await CoverLetterRepo.ins.edit(id, payload);
      emit(
        state.copyWith(
          edit: state.edit.toSuccess(data: data),
        ),
      );
    } on Fault catch (e) {
      emit(
        state.copyWith(
          edit: state.edit.toFailed(fault: e),
        ),
      );
    }
  }

  Future<void> delete(int id) async {
    emit(
      state.copyWith(
        delete: state.delete.toLoading(),
      ),
    );
    try {
      await CoverLetterRepo.ins.delete(id);
      emit(
        state.copyWith(
          delete: state.delete.toSuccess(),
        ),
      );
    } on Fault catch (e) {
      emit(
        state.copyWith(
          delete: state.delete.toFailed(fault: e),
        ),
      );
    }
  }

  void reset() => emit(CoverLetterState.def());
}
