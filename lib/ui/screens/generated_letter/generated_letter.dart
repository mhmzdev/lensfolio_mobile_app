import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:provider/provider.dart';

import 'package:lensfolio_mobile_app/blocs/cover_letter/cubit.dart';
import 'package:lensfolio_mobile_app/configs/configs.dart';
import 'package:lensfolio_mobile_app/models/cover_letter/letter_prompt_response.dart';
import 'package:lensfolio_mobile_app/router/routes.dart';
import 'package:lensfolio_mobile_app/ui/widgets/core/button/button.dart';
import 'package:lensfolio_mobile_app/ui/widgets/core/header/core_header.dart';
import 'package:lensfolio_mobile_app/ui/widgets/core/screen/screen.dart';
import 'package:lensfolio_mobile_app/utils/flash.dart';

part '_state.dart';
part 'listeners/_save.dart';
part 'static/_form_data.dart';
part 'static/_form_keys.dart';
part 'widgets/_alert.dart';
part 'widgets/_header.dart';

class GeneratedLetterScreen extends StatelessWidget {
  const GeneratedLetterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);

    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(args['letterPromptResponse']),
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
      initialFormValue: _FormData.initialValues(
        screenState.letterPromptResponse.letterBody ?? '',
      ),
      belowBuilders: const [_SaveListener()],
      keyboardHandler: true,
      resizeToAvoidBottomInset: true,
      child: SafeArea(
        child: Padding(
          padding: Space.a.t16,
          child: Column(
            crossAxisAlignment: .stretch,
            children: [
              const _Header(),
              Row(
                children: [
                  Expanded(
                    child: AppButton(
                      onTap: () => screenState.onCopy(context),
                      label: 'Copy',
                      icon: LucideIcons.copy,
                      size: .small,
                      mainAxisSize: .max,
                      style: .primaryBorder,
                    ),
                  ),
                  Space.x.t12,
                  Expanded(
                    child: BlocBuilder<CoverLetterCubit, CoverLetterState>(
                      buildWhen: (a, b) => a.save != b.save,
                      builder: (context, state) {
                        final loading = state.save.isLoading;
                        return AppButton(
                          onTap: () => screenState.onSave(context),
                          label: 'Save',
                          icon: LucideIcons.save,
                          size: .small,
                          state: loading ? .disabled : .def,
                          mainAxisSize: .max,
                        );
                      },
                    ),
                  ),
                ],
              ),
              Space.y.t16,
              Expanded(
                child: FormBuilderTextField(
                  name: _FormKeys.letterBody,
                  decoration: const InputDecoration.collapsed(
                    hintText: 'Cover Letter Body',
                  ),
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  style: AppText.b1 + FontWeight.w500,
                  maxLines: null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
