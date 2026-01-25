import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lensfolio_mobile_app/blocs/user/cubit.dart';
import 'package:lensfolio_mobile_app/configs/configs.dart';
import 'package:lensfolio_mobile_app/gen/assets/assets.gen.dart';
import 'package:lensfolio_mobile_app/helpers/validators.dart';
import 'package:lensfolio_mobile_app/router/routes.dart';
import 'package:lensfolio_mobile_app/ui/widgets/core/button/button.dart';
import 'package:lensfolio_mobile_app/ui/widgets/core/screen/screen.dart';
import 'package:lensfolio_mobile_app/ui/widgets/forms/forms.dart';
import 'package:lensfolio_mobile_app/ui/widgets/headless/app_touch.dart';
import 'package:lensfolio_mobile_app/ui/widgets/headless/scroll_column_expandable.dart';
import 'package:lensfolio_mobile_app/utils/flash.dart';
import 'package:lensfolio_mobile_app/utils/setup_cubit.dart';

import 'package:provider/provider.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'listeners/_login.dart';
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
      belowBuilders: const [_LoginListener()],
      child: SafeArea(
        child: ScrollColumnExpandable(
          padding: Space.a.t20,
          crossAxisAlignment: .stretch,
          children: [
            Hero(
              tag: 'APP_ICON',
              child: Assets.app.icon.image(
                height: 100,
              ),
            ),
            Space.y.t24,
            Text(
              'Login',
              style: AppText.h1b,
            ),
            Space.y.t04,
            Text(
              'Welcome back to Lensfolio. Please enter your email and password to continue.',
              style: AppText.b1,
            ),
            Space.y.t32,
            AppFormTextInput(
              name: _FormKeys.email,
              validators: Validators.email(),
              heading: 'Email',
              placeholder: 'john.doe@example.com',
              keyboardType: TextInputType.emailAddress,
            ),
            Space.y.t20,
            AppFormTextInput(
              name: _FormKeys.password,
              heading: 'Password',
              placeholder: 'Enter your password',
              validators: FormBuilderValidators.required(
                errorText: 'Password is required',
              ),
              obscureText: true,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Forgot Password?',
                  style:
                      AppText.b1b.cl(AppTheme.c.primary) +
                      TextDecoration.underline,
                ),
              ),
            ),
            Space.y.t12,
            BlocBuilder<UserCubit, UserState>(
              buildWhen: (a, b) => a.login != b.login,
              builder: (context, state) {
                final loading = state.login.isLoading;
                return AppButton(
                  label: 'Login',
                  onTap: () => screenState.onSubmit(context),
                  state: loading ? .disabled : .def,
                );
              },
            ),
            Space.y.t16,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have an account? ',
                  style: AppText.b2,
                ),
                AppTouch(
                  onTap: () {},
                  child: Text(
                    'Register now',
                    style: AppText.b2b.cl(AppTheme.c.primary),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
