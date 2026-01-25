import 'package:flutter/material.dart';
import 'package:lensfolio_mobile_app/blocs/cover_letter/cubit.dart';
import 'package:lensfolio_mobile_app/blocs/projects/cubit.dart';

class SetupCubit {
  static void setupCubit(BuildContext context, int uid) {
    CoverLetterCubit.c(context).setupUid(uid);
    ProjectsCubit.c(context).setupUid(uid);
  }

  static void resetCubit(BuildContext context) {
    CoverLetterCubit.c(context).resetUid();
    ProjectsCubit.c(context).resetUid();
  }
}
