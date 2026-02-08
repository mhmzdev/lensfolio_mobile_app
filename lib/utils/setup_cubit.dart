import 'package:flutter/material.dart';
import 'package:lensfolio_mobile_app/blocs/cover_letter/cubit.dart';
import 'package:lensfolio_mobile_app/blocs/file/cubit.dart';
import 'package:lensfolio_mobile_app/blocs/projects/cubit.dart';
import 'package:lensfolio_mobile_app/configs/configs.dart';

class SetupCubit {
  static void setupCubit(
    BuildContext context,
    int uid, {
    String? uuid,
  }) {
    CoverLetterCubit.c(context).setupUid(uid);

    ProjectsCubit.c(context).setupUid(uid);
    ProjectsCubit.c(context).fetchAll();

    if (uuid.available) FileCubit.c(context).setupUuid(uuid!);
  }

  static void resetCubit(BuildContext context) {
    CoverLetterCubit.c(context).resetUid();
    ProjectsCubit.c(context).resetUid();
    FileCubit.c(context).resetUuid();
  }
}
