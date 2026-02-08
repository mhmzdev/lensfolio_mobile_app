import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lensfolio_mobile_app/helpers/validators.dart';
import 'package:lensfolio_mobile_app/models/project/project.dart';
import 'package:provider/provider.dart';

import 'package:lensfolio_mobile_app/blocs/projects/cubit.dart';
import 'package:lensfolio_mobile_app/blocs/user/cubit.dart';
import 'package:lensfolio_mobile_app/configs/configs.dart';
import 'package:lensfolio_mobile_app/services/app_log.dart';
import 'package:lensfolio_mobile_app/ui/widgets/core/button/button.dart';
import 'package:lensfolio_mobile_app/ui/widgets/core/screen/screen.dart';
import 'package:lensfolio_mobile_app/ui/widgets/forms/forms.dart';
import 'package:lensfolio_mobile_app/ui/widgets/headless/scroll_column_expandable.dart';
import 'package:lensfolio_mobile_app/utils/flash.dart';

part '_state.dart';
part 'static/_form_keys.dart';
part 'static/_form_data.dart';
part 'widgets/_cover_image.dart';
part 'listeners/_create.dart';
part 'listeners/_update.dart';

class AddProjectScreen extends StatelessWidget {
  const AddProjectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);

    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>?;

    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(project: args?['project']),
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
    final isEditMode = screenState.isEditMode;

    return Screen(
      formKey: screenState.formKey,
      initialFormValue: _FormData.initialValues(screenState.project),
      keyboardHandler: true,
      resizeToAvoidBottomInset: true,
      belowBuilders: const [
        _CreateListener(),
        _UpdateListener(),
      ],
      floatingActionButton: KeyboardVisibilityBuilder(
        builder: (context, isVisible) {
          if (isVisible) return const SizedBox.shrink();
          return BlocBuilder<ProjectsCubit, ProjectsState>(
            buildWhen: (a, b) =>
                a.create != b.create || a.update != b.update,
            builder: (context, state) {
              final loading = isEditMode
                  ? state.update.isLoading
                  : state.create.isLoading;
              return AppButton(
                padding: Space.a.t16,
                icon: isEditMode ? LucideIcons.check_check : LucideIcons.plus,
                label: isEditMode ? 'Update Project' : 'Add Project',
                onTap: () => screenState.onSubmit(context),
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
                  Expanded(
                    child: Text(
                      isEditMode ? 'Edit Project' : 'Add Project',
                      style: AppText.h1b,
                    ),
                  ),
                ],
              ),
            ),
            Space.y.t12,
            Expanded(
              child: ScrollColumnExpandable(
                padding: Space.a.t16,
                children: const [
                  _CoverImage(),
                  _FormFields(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FormFields extends StatelessWidget {
  const _FormFields();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .stretch,
      children: [
        Space.y.t16,
        AppFormTextInput(
          name: _FormKeys.title,
          heading: 'Project Title',
          placeholder: 'Enter project title',
          prefixIcon: LucideIcons.folder,
          textInputAction: TextInputAction.next,
          validators: FormBuilderValidators.compose([
            FormBuilderValidators.required(
              errorText: 'Project title is required.',
            ),
            FormBuilderValidators.minLength(
              3,
              errorText: 'Title must be at least 3 characters.',
            ),
          ]),
        ),
        Space.y.t16,
        AppFormTextInput(
          name: _FormKeys.description,
          heading: 'Description',
          placeholder: 'Describe your project...',
          maxLines: 4,
          textInputAction: TextInputAction.newline,
          keyboardType: TextInputType.multiline,
          validators: FormBuilderValidators.compose([
            FormBuilderValidators.required(
              errorText: 'Project description is required.',
            ),
            FormBuilderValidators.minLength(
              10,
              errorText: 'Description must be at least 10 characters.',
            ),
          ]),
        ),
        Space.y.t16,
        AppFormChipsInput<String>(
          name: _FormKeys.technologies,
          heading: 'Technologies',
          subHeading: 'Press \'enter\' to add each technology',
          placeholder: 'e.g., Flutter, Dart, Firebase...',
          inputTransformer: (input) => input.trim(),
          displayTransformer: (val) => val,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Add at least one technology.';
            }
            return null;
          },
        ),
        Space.y.t16,
        AppFormTextInput(
          name: _FormKeys.githubUrl,
          heading: 'GitHub URL (Optional)',
          placeholder: 'https://github.com/...',
          prefixIcon: LucideIcons.github,
          keyboardType: TextInputType.url,
          textInputAction: TextInputAction.next,
          validators: Validators.url(),
        ),
        Space.y.t16,
        AppFormTextInput(
          name: _FormKeys.liveUrl,
          heading: 'Live URL (Optional)',
          placeholder: 'https://...',
          prefixIcon: LucideIcons.globe,
          keyboardType: TextInputType.url,
          textInputAction: TextInputAction.done,
          validators: Validators.url(),
        ),
        Space.y.t100,
      ],
    );
  }
}
