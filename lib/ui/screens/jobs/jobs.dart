import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:lensfolio_mobile_app/blocs/jobs/cubit.dart';
import 'package:lensfolio_mobile_app/configs/configs.dart';
import 'package:lensfolio_mobile_app/models/job/job.dart';
import 'package:lensfolio_mobile_app/ui/widgets/core/button/button.dart';
import 'package:lensfolio_mobile_app/ui/widgets/design/skeleton/skeleton.dart';
import 'package:lensfolio_mobile_app/ui/widgets/forms/forms.dart';
import 'package:lensfolio_mobile_app/ui/widgets/headless/app_touch.dart';
import 'package:provider/provider.dart';

import 'package:lensfolio_mobile_app/ui/widgets/core/screen/screen.dart';

part 'widgets/_search_header.dart';
part 'widgets/_filters.dart';
part 'widgets/_job_card.dart';
part 'widgets/_placeholder.dart';

part '_state.dart';

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

    return Screen(
      keyboardHandler: true,
      bottomBarHeightChanged: (height) {
        setState(() {
          bottomBarHeight = height;
        });
      },
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
                    ...jobs?.jobs
                            .map(
                              (j) => _JobCard(job: j),
                            )
                            .toList() ??
                        [],
                    SizedBox(height: bottomBarHeight),
                  ],
                ),
        ),
      ),
    );
  }
}
