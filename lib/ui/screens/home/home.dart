import 'package:flutter/material.dart';
import 'package:lensfolio_mobile_app/configs/configs.dart';
import 'package:provider/provider.dart';

import 'package:lensfolio_mobile_app/ui/widgets/core/screen/screen.dart';

part '_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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

    return const Screen(
      keyboardHandler: true,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: .stretch,
          children: [],
        ),
      ),
    );
  }
}
