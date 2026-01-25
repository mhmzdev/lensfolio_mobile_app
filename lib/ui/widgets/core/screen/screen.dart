import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:lensfolio_mobile_app/blocs/cover_letter/cubit.dart';
import 'package:lensfolio_mobile_app/configs/configs.dart';
import 'package:lensfolio_mobile_app/router/routes.dart';
import 'package:lensfolio_mobile_app/ui/widgets/core/bottom_bar/bottom_bar.dart';
import 'package:lensfolio_mobile_app/ui/widgets/design/full_screen_loader/floating_loader.dart';
import 'package:lensfolio_mobile_app/ui/widgets/headless/focus_handler.dart';

class Screen extends StatefulWidget {
  const Screen({
    super.key,
    required this.child,
    this.padding = EdgeInsets.zero,
    this.keyboardHandler = false,
    this.renderSettings = true,
    this.resizeToAvoidBottomInset = false,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.scaffoldBackgroundColor,
    this.belowBuilders,
    this.overlayBuilders,
    this.initialFormValue,
    this.formKey,
    this.onBackPressed,
    this.canPop,
    this.appBar,
    this.endDrawer,
    this.drawer,
    this.endDrawerEnableOpenDragGesture = true,
    this.drawerEnableOpenDragGesture = true,
    this.bottomBarHeightChanged,
  });

  final Widget child;
  final EdgeInsets padding;
  final bool keyboardHandler;
  final bool renderSettings;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final Color? scaffoldBackgroundColor;
  final List<Widget>? belowBuilders;
  final List<Widget>? overlayBuilders;
  final Map<String, dynamic>? initialFormValue;
  final GlobalKey<FormBuilderState>? formKey;
  final bool resizeToAvoidBottomInset;
  final void Function()? onBackPressed;
  final bool? canPop;
  final PreferredSizeWidget? appBar;
  final Widget? endDrawer;
  final Widget? drawer;
  final bool endDrawerEnableOpenDragGesture;
  final bool drawerEnableOpenDragGesture;

  final void Function(double height)? bottomBarHeightChanged;

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  final bottomBarKey = GlobalKey();

  double get _getBottomBarHeight {
    final renderBox =
        bottomBarKey.currentContext?.findRenderObject() as RenderBox?;
    final height = renderBox?.size.height ?? context.bottomSafe();
    return height;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.bottomBarHeightChanged?.call(_getBottomBarHeight);
    });
  }

  @override
  Widget build(BuildContext context) {
    App.init(context);

    var body = widget.child;
    var onWillPop = widget.onBackPressed;
    var canPopValue = widget.canPop ?? true;

    const bottomBarRoutes = <String>[
      AppRoutes.home,
      AppRoutes.jobs,
      AppRoutes.projects,
      AppRoutes.letters,
    ];
    final currentRoute = context.currentPath;
    final hasBottomBar = bottomBarRoutes.contains(currentRoute);

    if (widget.formKey != null) {
      body = FormBuilder(
        key: widget.formKey,
        initialValue: widget.initialFormValue ?? {},
        child: body,
      );
    }

    if (widget.keyboardHandler) {
      body = FocusHandler(child: body);
    }

    if (onWillPop == null && bottomBarRoutes.contains(currentRoute)) {
      onWillPop = () {
        const homeRoute = AppRoutes.home;
        homeRoute.pushReplace(context);
      };
      canPopValue = false;
    }

    if (onWillPop != null || !canPopValue) {
      body = PopScope(
        canPop: canPopValue,
        onPopInvokedWithResult: (didPop, result) {
          if (!didPop && onWillPop != null) {
            onWillPop();
          }
        },
        child: body,
      );
    }

    body = Padding(padding: widget.padding, child: body);

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark.copyWith(
        statusBarBrightness: Brightness.light, // for IOS
        statusBarIconBrightness: Brightness.dark, // for Android
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
        backgroundColor: widget.scaffoldBackgroundColor,
        floatingActionButton: widget.floatingActionButton,
        floatingActionButtonLocation: widget.floatingActionButtonLocation,
        endDrawerEnableOpenDragGesture: widget.endDrawerEnableOpenDragGesture,
        drawerEnableOpenDragGesture: widget.drawerEnableOpenDragGesture,
        endDrawer: widget.endDrawer,
        drawer: widget.drawer,
        appBar: widget.appBar,
        body: DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: .topRight,
              end: .center,
              colors: [
                AppTheme.c.primary.addOpacity(.5),
                Colors.transparent,
              ],
            ),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              if (widget.belowBuilders != null) ...widget.belowBuilders!,
              Positioned.fill(child: body),
              if (hasBottomBar)
                Positioned(
                  key: bottomBarKey,
                  left: 0,
                  right: 0,
                  bottom: 0,
                  child: const BottomBar(),
                ),

              if (widget.overlayBuilders != null) ...widget.overlayBuilders!,

              BlocBuilder<CoverLetterCubit, CoverLetterState>(
                buildWhen: (a, b) => a.generate != b.generate,
                builder: (context, state) {
                  if (state.generate.isLoading) {
                    return FloatingLoader(
                      message: 'Generating cover letter...',
                      bottom: context.bottomSafe() + 90.sp(),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
