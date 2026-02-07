import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lensfolio_mobile_app/blocs/user/cubit.dart';
import 'package:lensfolio_mobile_app/configs/configs.dart';
import 'package:lensfolio_mobile_app/helpers/validators.dart';
import 'package:lensfolio_mobile_app/models/user/generated_profile.dart';
import 'package:lensfolio_mobile_app/models/user/user_data.dart';
import 'package:lensfolio_mobile_app/models/user/user_education.dart';
import 'package:lensfolio_mobile_app/models/user/user_experience.dart';
import 'package:lensfolio_mobile_app/models/user/user_tech_stack.dart';
import 'package:lensfolio_mobile_app/services/app_log.dart';
import 'package:lensfolio_mobile_app/ui/widgets/core/button/button.dart';
import 'package:lensfolio_mobile_app/ui/widgets/core/design/complex_text/complex_text.dart';
import 'package:lensfolio_mobile_app/ui/widgets/design/full_screen_loader/full_screen_loader.dart';
import 'package:lensfolio_mobile_app/ui/widgets/design/modal/app_modal.dart';
import 'package:lensfolio_mobile_app/ui/widgets/forms/forms.dart';
import 'package:lensfolio_mobile_app/ui/widgets/headless/keep_alive_page_view.dart';
import 'package:lensfolio_mobile_app/ui/widgets/headless/scroll_column_expandable.dart';
import 'package:lensfolio_mobile_app/utils/flash.dart';

import 'package:provider/provider.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:lensfolio_mobile_app/ui/widgets/core/screen/screen.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

part 'static/_form_data.dart';
part 'static/_form_keys.dart';

part 'listeners/_generate_profile.dart';
part 'listeners/_update.dart';

part 'pages/_basics.dart';
part 'widgets/_contact_details.dart';
part 'pages/_education.dart';
part 'pages/_experience.dart';
part 'pages/_skills.dart';
part 'widgets/_tech_stack.dart';
part 'widgets/_preferred_roles.dart';
part 'widgets/_generate_modal.dart';

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
      belowBuilders: const [
        _UpdateListener(),
      ],
      overlayBuilders: const [
        _GenerateProfileListener(),
      ],
      floatingActionButton: KeyboardVisibilityBuilder(
        builder: (context, isVisible) {
          if (isVisible) return const SizedBox.shrink();
          return BlocBuilder<UserCubit, UserState>(
            buildWhen: (a, b) =>
                a.update != b.update || a.generateProfile != b.generateProfile,
            builder: (context, state) {
              final loading =
                  state.update.isLoading || state.generateProfile.isLoading;
              return AppButton(
                padding: Space.a.t16,
                icon: LucideIcons.check_check,
                label: 'Save',
                onTap: () => screenState.onSave(context),
                state: loading ? .disabled : .def,
              );
            },
          );
        },
      ),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: Space.h.t16 + Space.t.t16,
              child: Row(
                children: [
                  AppButton(
                    style: .primaryBorder,
                    size: .small,
                    padding: Space.a.t08,
                    icon: LucideIcons.arrow_left,
                    onTap: () => ''.pop(context),
                  ),
                  Space.x.t08,
                  Expanded(child: Text('Edit Profile', style: AppText.h1b)),
                  Space.x.t08,
                  if (currentUserData.inCompleteProfile)
                    AppButton(
                      style: .secondary,
                      size: .medium,
                      label: 'Generate',
                      padding: Space.a.t08,
                      icon: LucideIcons.sparkles,
                      onTap: () => showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        routeSettings: const RouteSettings(
                          name: '/modal/generate-profile',
                        ),
                        backgroundColor: Colors.transparent,
                        builder: (_) => ListenableProvider.value(
                          value: screenState,
                          child: const _GenerateModal(),
                        ),
                      ),
                    ),
                ],
              ),
            ),
            Space.y.t12,
            Padding(
              padding: Space.h.t16,
              child: ComplexText(
                string:
                    'Please ensure that you fill out all the fields below to mark your profile as {\'Completed\'}.',
                style: AppText.b1,
                specialStyle: AppText.b1b,
              ),
            ),
            Space.y.t12,
            const _Tabs(),
            Expanded(
              child: PageView(
                controller: screenState.pageController,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  KeepAlivePageView(
                    child: ScrollColumnExpandable(
                      padding: Space.a.t16,
                      children: const [
                        _Basics(),
                        _ContactDetails(),
                      ],
                    ),
                  ),
                  KeepAlivePageView(
                    child: ScrollColumnExpandable(
                      padding: Space.a.t16,
                      children: const [
                        _Education(),
                      ],
                    ),
                  ),
                  KeepAlivePageView(
                    child: ScrollColumnExpandable(
                      padding: Space.a.t16,
                      children: const [
                        _Experience(),
                      ],
                    ),
                  ),
                  KeepAlivePageView(
                    child: ScrollColumnExpandable(
                      padding: Space.a.t16,
                      children: const [
                        _Skills(),
                        _TechStack(),
                        _PreferredRoles(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Tabs extends StatelessWidget {
  const _Tabs();

  @override
  Widget build(BuildContext context) {
    final state = _ScreenState.s(context, true);

    return Padding(
      padding: Space.h.t12,
      child: Row(
        children:
            [
              'Basics',
              'Education',
              'Experience',
              'Skills',
            ].asMap().entries.map(
              (page) {
                final label = page.value;
                final index = page.key;
                final active = state.currentTab == index;

                return Expanded(
                  child: AppButton(
                    margin: Space.h.t04,
                    label: label,
                    style: active ? .primary : .primaryBorder,
                    size: .small,
                    onTap: () => state.setTab(index),
                  ),
                );
              },
            ).toList(),
      ),
    );
  }
}
