import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:lensfolio_mobile_app/router/routes.dart';
import 'package:lensfolio_mobile_app/ui/animations/animations/scale_animation.dart';
import 'package:lensfolio_mobile_app/ui/widgets/design/full_screen_loader/full_screen_loader.dart';
import 'package:provider/provider.dart';

import 'package:lensfolio_mobile_app/blocs/user/cubit.dart';
import 'package:lensfolio_mobile_app/configs/configs.dart';
import 'package:lensfolio_mobile_app/ui/widgets/core/button/button.dart';
import 'package:lensfolio_mobile_app/ui/widgets/core/screen/screen.dart';
import 'package:lensfolio_mobile_app/ui/widgets/design/avatar/avatar.dart';
import 'package:lensfolio_mobile_app/ui/widgets/design/skeleton/skeleton.dart';
import 'package:lensfolio_mobile_app/ui/widgets/headless/app_touch.dart';
import 'package:lensfolio_mobile_app/utils/flash.dart';

part '_state.dart';

part 'listeners/_logout.dart';

part 'widgets/_about.dart';
part 'widgets/_contact.dart';
part 'widgets/_placeholder.dart';
part 'widgets/_preferred_roles.dart';
part 'widgets/_profile_card.dart';
part 'widgets/_skills.dart';
part 'widgets/_tech_stack.dart';

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
    final userCubit = UserCubit.c(context, true);
    final isFetching =
        userCubit.state.fetch.isLoading || userCubit.state.udpate.isLoading;
    final userData = userCubit.state.userData;

    if (userData == null) return const SizedBox.shrink();

    return Screen(
      keyboardHandler: true,
      overlayBuilders: const [_LogoutListener()],
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
                            child: AppButton(
                              icon: LucideIcons.upload,
                              label: 'Upload Resume',
                              onTap: () {},
                            ),
                          ),
                          Space.x.t08,
                          Expanded(
                            child: AppButton(
                              style: .blackBorder,
                              icon: LucideIcons.download,
                              label: 'Download CV',
                              onTap: () {},
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
