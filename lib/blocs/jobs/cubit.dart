import 'dart:async';

import 'package:lensfolio_mobile_app/configs/configs.dart';
import 'package:lensfolio_mobile_app/models/job/job_fetch_respnose.dart';
import 'package:lensfolio_mobile_app/repos/jobs/jobs_repo.dart';
import 'package:lensfolio_mobile_app/services/fault/faults.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'state.dart';

class JobsCubit extends Cubit<JobsState> {
  static JobsCubit c(BuildContext context, [bool listen = false]) =>
      BlocProvider.of<JobsCubit>(context, listen: listen);

  JobsCubit() : super(JobsState.def());

  Future<void> fetch({
    String? search,
    String? category,
    int? limit,
  }) async {
    emit(
      state.copyWith(
        fetch: state.fetch.toLoading(),
      ),
    );
    try {
      final data = await JobsRepo.ins.fetch(search, category, limit);
      emit(
        state.copyWith(
          fetch: state.fetch.toSuccess(data: data),
          jobs: data,
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

  void reset() => emit(JobsState.def());
}
