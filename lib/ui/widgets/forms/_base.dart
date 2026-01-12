part of 'forms.dart';

class AppFormBase extends StatefulWidget {
  const AppFormBase({
    super.key,
    required this.child,
    required this.state,
    // required this.fieldState,
    required this.selectInput,
    this.readOnly = false,
    this.heading,
    this.subHeading,
    this.helper,
    this.padding,
    this.error,
    this.prefixIcon,
    this.suffixIcon,
    this.onObscureTap,
    this.obscureText,
    this.isOnTapAvailable = false,
  });

  final AppFormState state;
  final Widget child;

  final String? heading;
  final String? subHeading;
  final bool selectInput;
  final bool readOnly;
  final String? helper;
  final EdgeInsets? padding;
  final String? error;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool? obscureText;
  final void Function()? onObscureTap;

  final bool isOnTapAvailable;

  @override
  State<AppFormBase> createState() => _AppFormBaseState();
}

class _AppFormBaseState extends State<AppFormBase> {
  bool obscureText = false;

  @override
  void initState() {
    obscureText = widget.obscureText ?? false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final defState = _mapPropsToData()[AppFormState.def]!;
    final data =
        _mapPropsToData()[(widget.readOnly && !widget.isOnTapAvailable)
            ? AppFormState.disabled
            : widget.state] ??
        defState;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (widget.heading != null)
          Text(
            widget.heading!,
            style: AppText.b1b
                .cl(widget.error != null ? data.errorText : data.label)
                .sfPro,
          ),
        if (widget.subHeading != null)
          Text(
            widget.subHeading!,
            style: AppText.b2
                .cl(widget.error != null ? data.errorText : data.label)
                .sfPro,
          ),
        if (widget.heading != null || widget.subHeading != null) Space.y.t04,
        AnimatedContainer(
          duration: 100.milliseconds,
          decoration: BoxDecoration(
            color: data.surface,
            borderRadius: 12.radius(),
            border: Border.all(
              width: 1,
              color: widget.error != null ? data.error : data.border,
            ),
          ),
          child: Stack(
            children: [
              Padding(
                padding: widget.padding ?? Space.a.t12,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Stack(
                      children: [
                        Row(
                          children: [
                            if (widget.prefixIcon != null)
                              Padding(
                                padding: Space.h.t04,
                                child: Icon(
                                  widget.prefixIcon,
                                  color: data.border,
                                ),
                              ),
                            Expanded(child: widget.child),
                            if (widget.suffixIcon != null &&
                                widget.obscureText == false)
                              Padding(
                                padding: Space.h.t04,
                                child: Icon(
                                  widget.suffixIcon,
                                  color: data.border,
                                ),
                              ),
                            if (widget.onObscureTap != null &&
                                widget.obscureText == true)
                              Padding(
                                padding: Space.h.t04,
                                child: GestureDetector(
                                  onTap: () {
                                    widget.onObscureTap!();
                                    obscureText = !obscureText;
                                    setState(() {});
                                  },
                                  child: Icon(
                                    obscureText
                                        ? LucideIcons.eye_off
                                        : LucideIcons.eye,
                                    color: data.border,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              if (widget.selectInput)
                Positioned(
                  top: SpaceToken.t04,
                  bottom: SpaceToken.t04,
                  right: SpaceToken.t12,
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: data.border,
                  ),
                ),
            ],
          ),
        ),
        if (widget.error != null)
          Align(
            alignment: Alignment.centerLeft,
            child: AnimatedSwitcher(
              duration: AppProps.medium,
              child: Padding(
                padding: Space.t.t08,
                child: Row(
                  children: [
                    Icon(
                      LucideIcons.x,
                      color: AppTheme.c.dangerBase,
                      size: SpaceToken.t16,
                    ),
                    Space.x.t04,
                    Flexible(
                      child: Text(
                        widget.error!,
                        style: AppText.b2.cl(data.errorText).sfPro,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        else if (widget.helper != null) ...[
          Space.y.t12,
          Row(
            children: [
              Icon(
                Icons.info_outline_rounded,
                color: data.helper,
                size: 18,
              ),
              Space.x.t04,
              Expanded(
                child: Text(
                  widget.helper!,
                  style: AppText.b2.cl(data.helper).sfPro,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}
