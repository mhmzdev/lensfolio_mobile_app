import 'package:flutter/material.dart';
import 'package:lensfolio_mobile_app/configs/configs.dart';
import 'package:provider/provider.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:lensfolio_mobile_app/ui/widgets/core/screen/screen.dart';

part 'static/_form_data.dart';
part 'static/_form_keys.dart';

part '_state.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
    final screenState = _ScreenState.s(context);

    return Screen(
      formKey: screenState.formKey,
      initialFormValue: _FormData.initialValues(),
      keyboardHandler: true,
      child: const SafeArea(
        child: Column(
          crossAxisAlignment: .stretch,
          children: [],
        ),
      ),
    );
  }
}
