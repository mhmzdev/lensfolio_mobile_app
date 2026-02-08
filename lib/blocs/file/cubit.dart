import 'dart:async';
import 'dart:io';

import 'package:lensfolio_mobile_app/configs/configs.dart';
import 'package:lensfolio_mobile_app/repos/file/file_repo.dart';
import 'package:lensfolio_mobile_app/services/fault/faults.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'state.dart';

class FileCubit extends Cubit<FileState> {
  static FileCubit c(BuildContext context, [bool listen = false]) =>
      BlocProvider.of<FileCubit>(context, listen: listen);

  FileCubit() : super(FileState.def());

  Future<void> uploadResume(File file, {bool exists = false}) async {
    emit(
      state.copyWith(
        uploadResume: state.uploadResume.toLoading(),
      ),
    );
    try {
      final data = await FileRepo.ins.uploadResume(file, state.uuid!, exists);
      emit(
        state.copyWith(
          uploadResume: state.uploadResume.toSuccess(data: data),
        ),
      );
    } on Fault catch (e) {
      emit(
        state.copyWith(
          uploadResume: state.uploadResume.toFailed(fault: e),
        ),
      );
    }
  }

  Future<void> downloadResume(String filePath) async {
    emit(
      state.copyWith(
        downloadResume: state.downloadResume.toLoading(),
      ),
    );
    try {
      final data = await FileRepo.ins.downloadResume(filePath);
      emit(
        state.copyWith(
          downloadResume: state.downloadResume.toSuccess(data: data),
        ),
      );
    } on Fault catch (e) {
      emit(
        state.copyWith(
          downloadResume: state.downloadResume.toFailed(fault: e),
        ),
      );
    }
  }

  Future<void> uploadProfilePicture(File file) async {
    emit(
      state.copyWith(
        uploadProfilePicture: state.uploadProfilePicture.toLoading(),
      ),
    );
    try {
      final data = await FileRepo.ins.uploadProfilePicture(file, state.uuid!);
      emit(
        state.copyWith(
          uploadProfilePicture: state.uploadProfilePicture.toSuccess(
            data: data,
          ),
        ),
      );
    } on Fault catch (e) {
      emit(
        state.copyWith(
          uploadProfilePicture: state.uploadProfilePicture.toFailed(fault: e),
        ),
      );
    }
  }

  Future<void> deleteFile(String filePath, {required String bucket}) async {
    emit(
      state.copyWith(
        deleteFile: state.deleteFile.toLoading(),
      ),
    );
    try {
      await FileRepo.ins.deleteFile(filePath, bucket: bucket);
      emit(
        state.copyWith(
          deleteFile: state.deleteFile.toSuccess(),
        ),
      );
    } on Fault catch (e) {
      emit(
        state.copyWith(
          deleteFile: state.deleteFile.toFailed(fault: e),
        ),
      );
    }
  }

  void setupUuid(String uuid) => emit(state.copyWith(uuid: uuid));
  void resetUuid() => emit(state.copyWith(uuid: null));

  void reset() => emit(FileState.def());
}
