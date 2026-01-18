import 'dart:async';

import 'package:lensfolio_mobile_app/configs/configs.dart';
import 'package:lensfolio_mobile_app/models/project/project.dart';
import 'package:lensfolio_mobile_app/repos/projects/projects_repo.dart';
import 'package:lensfolio_mobile_app/services/fault/faults.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'state.dart';

class ProjectsCubit extends Cubit<ProjectsState> {
  static ProjectsCubit c(BuildContext context, [bool listen = false]) =>
      BlocProvider.of<ProjectsCubit>(context, listen: listen);

  ProjectsCubit() : super(ProjectsState.def());

  Future<void> delete(int id) async {
    emit(
      state.copyWith(
        delete: state.delete.toLoading(),
      ),
    );
    try {
      final data = await ProjectsRepo.ins.delete(id);
      emit(
        state.copyWith(
          delete: state.delete.toSuccess(data: data),
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

  Future<void> update(int id, Map<String, dynamic> values) async {
    emit(
      state.copyWith(
        update: state.update.toLoading(),
      ),
    );
    try {
      final data = await ProjectsRepo.ins.update(id, values);
      emit(
        state.copyWith(
          update: state.update.toSuccess(data: data),
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

  Future<void> fetchAll(int uid) async {
    emit(
      state.copyWith(
        fetchAll: state.fetchAll.toLoading(),
      ),
    );
    try {
      final data = await ProjectsRepo.ins.fetchAll(uid);
      emit(
        state.copyWith(
          fetchAll: state.fetchAll.toSuccess(data: data),
          projects: data,
        ),
      );
    } on Fault catch (e) {
      emit(
        state.copyWith(
          fetchAll: state.fetchAll.toFailed(fault: e),
        ),
      );
    }
  }

  Future<void> fetchById(int id) async {
    emit(
      state.copyWith(
        fetchById: state.fetchById.toLoading(),
      ),
    );
    try {
      final data = await ProjectsRepo.ins.fetchById(id);
      emit(
        state.copyWith(
          fetchById: state.fetchById.toSuccess(data: data),
        ),
      );
    } on Fault catch (e) {
      emit(
        state.copyWith(
          fetchById: state.fetchById.toFailed(fault: e),
        ),
      );
    }
  }

  Future<void> create(int uid, Map<String, dynamic> payload) async {
    emit(
      state.copyWith(
        create: state.create.toLoading(),
      ),
    );
    try {
      final data = await ProjectsRepo.ins.create(uid, payload);
      emit(
        state.copyWith(
          create: state.create.toSuccess(data: data),
        ),
      );
    } on Fault catch (e) {
      emit(
        state.copyWith(
          create: state.create.toFailed(fault: e),
        ),
      );
    }
  }

  void reset() => emit(ProjectsState.def());
}
