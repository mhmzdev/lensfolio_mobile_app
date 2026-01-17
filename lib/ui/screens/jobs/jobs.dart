import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:provider/provider.dart';

import 'package:lensfolio_mobile_app/utils/html_parser.dart';

import 'package:lensfolio_mobile_app/blocs/jobs/cubit.dart';
import 'package:lensfolio_mobile_app/configs/configs.dart';
import 'package:lensfolio_mobile_app/helpers/launcher.dart';
import 'package:lensfolio_mobile_app/models/job/job.dart';
import 'package:lensfolio_mobile_app/ui/widgets/core/button/button.dart';
import 'package:lensfolio_mobile_app/ui/widgets/core/screen/screen.dart';
import 'package:lensfolio_mobile_app/ui/widgets/design/full_screen_loader/floating_loader.dart';
import 'package:lensfolio_mobile_app/ui/widgets/design/skeleton/skeleton.dart';
import 'package:lensfolio_mobile_app/ui/widgets/forms/forms.dart';
import 'package:lensfolio_mobile_app/ui/widgets/headless/app_touch.dart';
import 'package:lensfolio_mobile_app/utils/flash.dart';

part '_state.dart';

part 'listeners/_fetch.dart';

part 'widgets/card/_job_card.dart';
part 'widgets/card/_expandable_desc.dart';

part 'widgets/_filters.dart';
part 'widgets/_placeholder.dart';
part 'widgets/_search_header.dart';

class JobsScreen extends StatefulWidget {
  const JobsScreen({super.key});

  @override
  State<JobsScreen> createState() => _JobsScreenState();
}

class _JobsScreenState extends State<JobsScreen> {
  @override
  void initState() {
    super.initState();
    JobsCubit.c(context).fetch();
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
    final jobsCubit = JobsCubit.c(context, true);
    final jobsState = jobsCubit.state;
    final jobs = jobsCubit.state.jobs;
    final list = jobs?.jobs ?? [];

    return Screen(
      keyboardHandler: true,
      bottomBarHeightChanged: (height) {
        setState(() {
          bottomBarHeight = height;
        });
      },
      belowBuilders: const [_FetchListener()],
      overlayBuilders: [
        if (list.isNotEmpty && jobsState.fetch.isLoading)
          FloatingLoader(
            message: 'Fetching jobs for you...',
            bottom: bottomBarHeight + 16.sp(),
          ),
      ],
      child: SafeArea(
        child: SingleChildScrollView(
          child: jobsState.fetch.isLoading && jobs == null
              ? const _Placeholder()
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const _SearchHeader(),
                    Space.y.t08,
                    const _Filters(),
                    Space.y.t16,
                    if (!jobsState.fetch.isFailed && list.isEmpty) ...[
                      Space.y.t16,
                      Text(
                        'No jobs found',
                        style: AppText.l1,
                      ),
                    ] else
                      ...list.map(
                        (j) => _JobCard(job: j),
                      ),
                    SizedBox(height: bottomBarHeight),
                  ],
                ),
        ),
      ),
    );
  }
}
