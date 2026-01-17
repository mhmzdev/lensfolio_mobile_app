import 'package:flutter/material.dart';
import 'package:lensfolio_mobile_app/blocs/jobs/cubit.dart';
import 'package:lensfolio_mobile_app/configs/configs.dart';
import 'package:provider/provider.dart';

import 'package:lensfolio_mobile_app/ui/widgets/core/screen/screen.dart';

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

    return Screen(
      keyboardHandler: true,
      bottomBarHeightChanged: (height) {
        setState(() {
          bottomBarHeight = height;
        });
      },
      child: SafeArea(
        child: SingleChildScrollView(
          padding: Space.a.t16,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // const _Placeholder(),
              SizedBox(height: bottomBarHeight),
            ],
          ),
        ),
      ),
    );
  }
}
