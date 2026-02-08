import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:provider/provider.dart';

import 'package:lensfolio_mobile_app/blocs/projects/cubit.dart';
import 'package:lensfolio_mobile_app/configs/configs.dart';
import 'package:lensfolio_mobile_app/gen/assets/assets.gen.dart';
import 'package:lensfolio_mobile_app/helpers/launcher.dart';
import 'package:lensfolio_mobile_app/router/routes.dart';
import 'package:lensfolio_mobile_app/models/project/project.dart';
import 'package:lensfolio_mobile_app/ui/animations/animations/bottom_animation.dart';
import 'package:lensfolio_mobile_app/ui/widgets/core/button/button.dart';
import 'package:lensfolio_mobile_app/ui/widgets/core/screen/screen.dart';
import 'package:lensfolio_mobile_app/ui/widgets/design/full_screen_loader/floating_loader.dart';
import 'package:lensfolio_mobile_app/ui/widgets/design/skeleton/skeleton.dart';
import 'package:lensfolio_mobile_app/utils/flash.dart';

part '_state.dart';

part 'widgets/_placeholder.dart';
part 'widgets/_project_card.dart';
part 'widgets/_delete_dialog.dart';

part 'listeners/_fetch.dart';
part 'listeners/_delete.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen> {
  @override
  void initState() {
    super.initState();
    ProjectsCubit.c(context).fetchAll();
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
    final projectsCubit = ProjectsCubit.c(context, true);
    final projectsState = projectsCubit.state;
    final projects = projectsState.projects;

    return Screen(
      keyboardHandler: true,
      bottomBarHeightChanged: (height) {
        setState(() {
          bottomBarHeight = height;
        });
      },
      belowBuilders: const [
        _FetchListener(),
        _DeleteListener(),
      ],
      overlayBuilders: [
        Positioned(
          bottom: bottomBarHeight + 20.sp(),
          right: SpaceToken.t16,
          child: FloatingActionButton(
            onPressed: () => AppRoutes.addProject.push(context),
            backgroundColor: AppTheme.c.primary,
            shape: RoundedRectangleBorder(
              borderRadius: 12.radius(),
            ),
            child: const Icon(LucideIcons.plus),
          ),
        ),
        if (projects != null &&
            projects.isNotEmpty &&
            projectsState.fetchAll.isLoading)
          FloatingLoader(
            message: 'Refreshing projects...',
            bottom: bottomBarHeight + 16.sp(),
          ),
      ],
      child: SafeArea(
        child: SingleChildScrollView(
          child: projectsState.fetchAll.isLoading && projects == null
              ? const _Placeholder()
              : Column(
                  crossAxisAlignment: .stretch,
                  children: [
                    // Header
                    Padding(
                      padding: Space.a.t16,
                      child: Text(
                        'My Projects',
                        style: AppText.h1b,
                      ),
                    ),
                    Space.y.t08,
                    // Empty state
                    if (!projectsState.fetchAll.isFailed &&
                        (projects == null || projects.isEmpty)) ...[
                      Column(
                        children: [
                          Space.y.t100,
                          Assets.images.noResults.image(
                            height: 250,
                          ),
                          Space.y.t16,
                          Text(
                            'No projects yet.\nStart showcasing your work!',
                            style: AppText.b1b,
                            textAlign: .center,
                          ),
                        ],
                      ),
                    ] else if (projects != null)
                      ...projects.map(
                        (p) => _ProjectCard(project: p),
                      ),
                    SizedBox(height: bottomBarHeight),
                  ],
                ),
        ),
      ),
    );
  }
}
