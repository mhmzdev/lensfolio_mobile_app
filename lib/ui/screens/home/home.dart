import 'package:flutter/material.dart';
import 'package:lensfolio_mobile_app/configs/configs.dart';
import 'package:lensfolio_mobile_app/ui/widgets/headless/scroll_column_expandable.dart';
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

    final userData = context.userData;

    return Screen(
      keyboardHandler: true,
      child: SafeArea(
        child: ScrollColumnExpandable(
          padding: Space.a.t20,
          crossAxisAlignment: .stretch,
          children: [
            Text(userData!.fullName),
            Text(userData.email),
            Text(userData.designation!),
          ],
        ),
      ),
    );
  }
}
