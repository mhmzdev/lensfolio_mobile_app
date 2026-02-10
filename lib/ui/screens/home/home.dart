import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:image_picker/image_picker.dart';
import 'package:lensfolio_mobile_app/ui/widgets/design/modal/app_modal.dart';
import 'package:share_plus/share_plus.dart';
import 'package:lensfolio_mobile_app/blocs/file/cubit.dart';
import 'package:lensfolio_mobile_app/router/routes.dart';
import 'package:lensfolio_mobile_app/services/app_log.dart';
import 'package:lensfolio_mobile_app/ui/animations/animations/scale_animation.dart';
import 'package:lensfolio_mobile_app/ui/widgets/design/full_screen_loader/full_screen_loader.dart';
import 'package:lensfolio_mobile_app/utils/setup_cubit.dart';
import 'package:provider/provider.dart';

import 'package:lensfolio_mobile_app/blocs/user/cubit.dart';
import 'package:lensfolio_mobile_app/configs/configs.dart';
import 'package:lensfolio_mobile_app/ui/widgets/core/button/button.dart';
import 'package:lensfolio_mobile_app/ui/widgets/core/screen/screen.dart';
import 'package:lensfolio_mobile_app/ui/widgets/design/avatar/avatar.dart';
import 'package:lensfolio_mobile_app/ui/widgets/design/skeleton/skeleton.dart';
import 'package:lensfolio_mobile_app/utils/flash.dart';

part '_state.dart';

part 'listeners/_logout.dart';
part 'listeners/_delete.dart';
part 'listeners/_upload_profile_picture.dart';
part 'listeners/_download_resume.dart';
part 'listeners/_upload_resume.dart';

part 'widgets/_about.dart';
part 'widgets/_contact.dart';
part 'widgets/_placeholder.dart';
part 'widgets/_preferred_roles.dart';
part 'widgets/_profile_card.dart';
part 'widgets/_skills.dart';
part 'widgets/_tech_stack.dart';

part 'widgets/_settings.dart';
part 'widgets/_delete_account_modal.dart';

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
    final screenState = _ScreenState.s(context, true);
    final userCubit = UserCubit.c(context, true);
    final isFetching =
        userCubit.state.fetch.isLoading || userCubit.state.update.isLoading;
    final userData = userCubit.state.userData;

    if (userData == null) return const SizedBox.shrink();

    return Screen(
      keyboardHandler: true,
      overlayBuilders: const [
        _LogoutListener(),
        _UploadProfilePictureListener(),
        _UploadResumeListener(),
        _DownloadResumeListener(),
        _DeleteListener(),
      ],
      bottomBarHeightChanged: (height) {
        setState(() {
          bottomBarHeight = height;
        });
      },
      child: SafeArea(
        child: SingleChildScrollView(
          padding: Space.a.t16,
          child: isFetching
              ? const _Placeholder()
              : Column(
                  crossAxisAlignment: .stretch,
                  children: [
                    const _ProfileCard(),
                    if (userData.inCompleteProfile) ...[
                      Space.y.t12,
                      AppButton(
                        style: .primaryBorder,
                        icon: LucideIcons.circle_alert,
                        label: 'Complete Profile',
                        onTap: () => AppRoutes.editProfile.push(context),
                      ),
                    ] else ...[
                      Row(
                        children: [
                          Expanded(
                            child: BlocBuilder<FileCubit, FileState>(
                              buildWhen: (a, b) =>
                                  a.uploadResume != b.uploadResume,
                              builder: (context, state) {
                                final loading = state.uploadResume.isLoading;
                                return Consumer<_ScreenState>(
                                  builder: (context, state, child) => AppButton(
                                    icon: LucideIcons.upload,
                                    label: userData.resumePath.available
                                        ? 'Replace Resume'
                                        : 'Upload Resume',
                                    state: loading || state.pickingFile
                                        ? .disabled
                                        : .def,
                                    onTap: () =>
                                        screenState.pickResumeFile(context),
                                  ),
                                );
                              },
                            ),
                          ),
                          Space.x.t08,
                          Expanded(
                            child: BlocBuilder<FileCubit, FileState>(
                              buildWhen: (a, b) =>
                                  a.downloadResume != b.downloadResume,
                              builder: (context, state) {
                                final loading = state.downloadResume.isLoading;
                                return AppButton(
                                  style: .blackBorder,
                                  icon: LucideIcons.download,
                                  label: 'Download Resume',
                                  state: loading ? .disabled : .def,
                                  onTap: () =>
                                      screenState.downloadResume(context),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                    Space.y.t16,
                    const _AboutCard(),
                    Space.y.t16,
                    const _ContactCard(),
                    Space.y.t16,
                    const _SkillsCard(),
                    Space.y.t16,
                    const _TechStackCard(),
                    Space.y.t16,
                    const _PreferredRolesCard(),
                    SizedBox(height: bottomBarHeight),
                  ],
                ),
        ),
      ),
    );
  }
}
