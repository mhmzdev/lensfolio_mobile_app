import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:lensfolio_mobile_app/blocs/cover_letter/cubit.dart';
import 'package:lensfolio_mobile_app/blocs/user/cubit.dart';
import 'package:lensfolio_mobile_app/configs/configs.dart';
import 'package:lensfolio_mobile_app/gen/assets/assets.gen.dart';
import 'package:lensfolio_mobile_app/models/cover_letter/cover_letter.dart';
import 'package:lensfolio_mobile_app/ui/widgets/core/button/button.dart';
import 'package:lensfolio_mobile_app/ui/widgets/design/full_screen_loader/floating_loader.dart';
import 'package:lensfolio_mobile_app/ui/widgets/design/skeleton/skeleton.dart';
import 'package:lensfolio_mobile_app/ui/widgets/forms/forms.dart';
import 'package:lensfolio_mobile_app/utils/flash.dart';
import 'package:provider/provider.dart';

import 'package:flutter/foundation.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'package:lensfolio_mobile_app/ui/widgets/core/screen/screen.dart';

part 'static/_form_data.dart';
part 'static/_form_keys.dart';

part '_state.dart';

part 'widgets/_generator.dart';
part 'widgets/_placeholder.dart';
part 'widgets/_letter_card.dart';

part 'listeners/_fetch.dart';

class LettersScreen extends StatefulWidget {
  const LettersScreen({super.key});

  @override
  State<LettersScreen> createState() => _LettersScreenState();
}

class _LettersScreenState extends State<LettersScreen> {
  @override
  void initState() {
    super.initState();
    final cubit = UserCubit.c(context);
    final user = cubit.state.userData!;
    CoverLetterCubit.c(context).fetch(user.id);
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<_ScreenState>(
      create: (_) => _ScreenState(),
      child: const _Body(),
    );
  }
}

class _Body extends StatefulWidget {
  const _Body();

  @override
  State<_Body> createState() => _BodyState();
}

class _BodyState extends State<_Body> {
  double bottomBarHeight = 80.sp();

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final screenState = _ScreenState.s(context);
    final coverLetterCubit = CoverLetterCubit.c(context, true);
    final coverLetterState = coverLetterCubit.state;
    final letters = coverLetterState.coverLetters;

    return Screen(
      formKey: screenState.formKey,
      initialFormValue: _FormData.initialValues(),
      keyboardHandler: true,
      bottomBarHeightChanged: (height) {
        setState(() {
          bottomBarHeight = height;
        });
      },
      belowBuilders: const [_FetchListener()],
      overlayBuilders: [
        if (letters.isNotEmpty && coverLetterState.fetch.isLoading)
          FloatingLoader(
            message: 'Refreshing letters...',
            bottom: bottomBarHeight + 16.sp(),
          ),
      ],
      child: SafeArea(
        child: SingleChildScrollView(
          child: coverLetterState.fetch.isLoading && letters.isEmpty
              ? const _Placeholder()
              : Column(
                  crossAxisAlignment: .stretch,
                  children: [
                    // Header
                    Padding(
                      padding: Space.a.t16,
                      child: Column(
                        crossAxisAlignment: .stretch,
                        children: [
                          Text(
                            'Cover Letters',
                            style: AppText.h1b,
                          ),
                          Space.y.t04,
                          Text(
                            'Generate and manage your cover letters with ease.',
                            style: AppText.b1 + AppTheme.c.subText,
                          ),
                        ],
                      ),
                    ),
                    Space.y.t16,
                    // Generator
                    Padding(
                      padding: Space.h.t16,
                      child: const _LetterGenerator(),
                    ),
                    Space.y.t20,
                    // Saved Letters Section
                    Padding(
                      padding: Space.h.t16,
                      child: Text(
                        'Saved Letters (${letters.length})',
                        style: AppText.h2b,
                      ),
                    ),
                    Space.y.t12,
                    // Empty state
                    if (!coverLetterState.fetch.isFailed &&
                        letters.isEmpty) ...[
                      Column(
                        children: [
                          Space.y.t60,
                          Assets.images.noResults.image(
                            height: 200,
                          ),
                          Space.y.t16,
                          Text(
                            'No cover letters yet.\nGenerate your first one above!',
                            style: AppText.b1b,
                            textAlign: .center,
                          ),
                        ],
                      ),
                    ] else
                      ...letters.map(
                        (letter) => _LetterCard(letter: letter),
                      ),
                    SizedBox(height: bottomBarHeight),
                  ],
                ),
        ),
      ),
    );
  }
}
