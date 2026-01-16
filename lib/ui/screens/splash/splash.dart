import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lensfolio_mobile_app/gen/assets/assets.gen.dart';
import 'package:lensfolio_mobile_app/router/routes.dart';
import 'package:lensfolio_mobile_app/ui/screens/login/login.dart';
import 'package:provider/provider.dart';

import 'package:lensfolio_mobile_app/blocs/user/cubit.dart';
import 'package:lensfolio_mobile_app/configs/configs.dart';
import 'package:lensfolio_mobile_app/ui/widgets/core/screen/screen.dart';
import 'package:lensfolio_mobile_app/utils/flash.dart';

part '_state.dart';
part 'listeners/_init.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    final cubit = UserCubit.c(context);
    Future.delayed(500.milliseconds, () => cubit.init());
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body();

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return Screen(
      belowBuilders: const [_InitListener()],
      child: SafeArea(
        child: Center(
          child: Hero(
            tag: 'APP_ICON',
            child: Assets.app.icon.image(
              height: 150,
            ),
          ),
        ),
      ),
    );
  }
}
