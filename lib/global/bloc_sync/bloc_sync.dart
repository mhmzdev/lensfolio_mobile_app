import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lensfolio_mobile_app/blocs/cover_letter/cubit.dart';
import 'package:lensfolio_mobile_app/configs/configs.dart';
import 'package:lensfolio_mobile_app/router/router.dart';
import 'package:lensfolio_mobile_app/router/routes.dart';

part 'sync/_letter_sync.dart';

class BlocSync extends StatelessWidget {
  const BlocSync({
    super.key,
    required this.body,
  });

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: const [
        _LetterSync(),
        // _UserSync(),
        // _AIGenerated(),
      ],
      child: body,
    );
  }
}
