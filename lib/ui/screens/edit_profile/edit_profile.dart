import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lensfolio_mobile_app/configs/configs.dart';
import 'package:lensfolio_mobile_app/helpers/validators.dart';
import 'package:lensfolio_mobile_app/models/user/user_data.dart';
import 'package:lensfolio_mobile_app/ui/widgets/core/design/complex_text/complex_text.dart';
import 'package:lensfolio_mobile_app/ui/widgets/forms/forms.dart';
import 'package:lensfolio_mobile_app/ui/widgets/headless/scroll_column_expandable.dart';
import 'package:provider/provider.dart';

import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:lensfolio_mobile_app/ui/widgets/core/screen/screen.dart';

part 'static/_form_data.dart';
part 'static/_form_keys.dart';

part 'widgets/_basics.dart';
part 'widgets/_contact_details.dart';
part 'widgets/_skills.dart';
part 'widgets/_tech_stack.dart';
part 'widgets/_preferred_roles.dart';

part '_state.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);

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
    final currentUserData = context.userData!;

    return Screen(
      formKey: screenState.formKey,
      initialFormValue: _FormData.initialValues(currentUserData),
      keyboardHandler: true,
      resizeToAvoidBottomInset: true,
      child: SafeArea(
        child: ScrollColumnExpandable(
          padding: Space.a.t16,
          crossAxisAlignment: .stretch,
          children: [
            Text('Edit Profile', style: AppText.h1b),
            ComplexText(
              string:
                  'Please ensure that you fill out all the fields below to mark your profile as {\'Completed\'}.',
              style: AppText.b1,
              specialStyle: AppText.b1b,
            ),
            Divider(
              height: SpaceToken.t24,
            ),
            const _Basics(),
            const _ContactDetails(),
            const _Skills(),
            const _TechStack(),
            const _PreferredRoles(),
          ],
        ),
      ),
    );
  }
}
