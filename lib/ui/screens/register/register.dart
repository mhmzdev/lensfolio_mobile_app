import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lensfolio_mobile_app/blocs/user/cubit.dart';
import 'package:lensfolio_mobile_app/configs/configs.dart';
import 'package:lensfolio_mobile_app/gen/assets/assets.gen.dart';
import 'package:lensfolio_mobile_app/helpers/validators.dart';
import 'package:lensfolio_mobile_app/ui/widgets/core/button/button.dart';
import 'package:lensfolio_mobile_app/ui/widgets/core/screen/screen.dart';
import 'package:lensfolio_mobile_app/ui/widgets/forms/forms.dart';
import 'package:lensfolio_mobile_app/ui/widgets/headless/app_touch.dart';
import 'package:lensfolio_mobile_app/ui/widgets/headless/scroll_column_expandable.dart';
import 'package:lensfolio_mobile_app/utils/flash.dart';
import 'package:provider/provider.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

part 'listeners/_register.dart';
part 'static/_form_data.dart';
part 'static/_form_keys.dart';

part '_state.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

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
      belowBuilders: const [_RegisterListener()],
      child: SafeArea(
        child: ScrollColumnExpandable(
          padding: Space.a.t20,
          crossAxisAlignment: .stretch,
          children: [
            Assets.app.icon.image(
              height: 100,
            ),
            Space.y.t24,
            Text(
              'Create Account',
              style: AppText.h1b,
            ),
            Space.y.t04,
            Text(
              'Join Lensfolio to build and showcase your professional portfolio.',
              style: AppText.b1,
            ),
            Space.y.t32,
            AppFormTextInput(
              name: _FormKeys.fullName,
              validators: Validators.name(),
              heading: 'Full Name',
              placeholder: 'John Doe',
              keyboardType: TextInputType.name,
              textCapitalization: TextCapitalization.words,
            ),
            Space.y.t20,
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
              validators: Validators.password(),
              obscureText: true,
            ),
            Space.y.t20,
            AppFormTextInput(
              name: _FormKeys.confirmPassword,
              heading: 'Confirm Password',
              placeholder: 'Re-enter your password',
              validators: FormBuilderValidators.required(
                errorText: 'Please confirm your password',
              ),
              obscureText: true,
            ),
            Space.y.t24,
            BlocBuilder<UserCubit, UserState>(
              buildWhen: (a, b) => a.register != b.register,
              builder: (context, state) {
                final loading = state.register.isLoading;
                return AppButton(
                  label: 'Create Account',
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
                  'Already have an account? ',
                  style: AppText.b2,
                ),
                AppTouch(
                  onTap: () => ''.pop(context),
                  child: Text(
                    'Login',
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
