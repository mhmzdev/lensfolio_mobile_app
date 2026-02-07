part of '../forms.dart';

class AppFormDateInput extends StatelessWidget {
  const AppFormDateInput({
    super.key,
    required this.name,
    this.initialValue,
    this.onChanged,
    this.heading,
    this.subHeading,
    this.placeholder,
    this.sideInput = false,
    this.state = AppFormState.def,
    this.margin,
    this.firstDate,
    this.lastDate,
    this.suffixIcon = LucideIcons.calendar,
  });

  final String name;
  final DateTime? initialValue;
  final void Function(DateTime?)? onChanged;
  final String? heading;
  final String? subHeading;
  final String? placeholder;
  final bool sideInput;
  final AppFormState state;
  final EdgeInsets? margin;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final IconData? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<DateTime?>(
      name: name,
      initialValue: initialValue,
      onChanged: onChanged,
      builder: (field) {
        return AppFormDateInputContent(
          heading: heading,
          subHeading: subHeading,
          placeholder: placeholder,
          sideInput: sideInput,
          state: state,
          margin: margin,
          firstDate: firstDate,
          lastDate: lastDate,
          suffixIcon: suffixIcon,
          initialValue: field.value,
          onChanged: field.didChange,
          fieldState: field,
        );
      },
    );
  }
}

class AppFormDateInputContent extends StatefulWidget {
  const AppFormDateInputContent({
    super.key,
    this.initialValue,
    this.onChanged,
    this.heading,
    this.subHeading,
    this.placeholder,
    this.sideInput = false,
    this.state = AppFormState.def,
    this.margin,
    this.firstDate,
    this.lastDate,
    this.suffixIcon = LucideIcons.calendar,
    this.fieldState,
  });

  final DateTime? initialValue;
  final void Function(DateTime?)? onChanged;
  final String? heading;
  final String? subHeading;
  final String? placeholder;
  final bool sideInput;
  final AppFormState state;
  final EdgeInsets? margin;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final IconData? suffixIcon;
  final FormFieldState<DateTime?>? fieldState;

  @override
  State<AppFormDateInputContent> createState() =>
      _AppFormDateInputContentState();
}

class _AppFormDateInputContentState extends State<AppFormDateInputContent> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _updateControllerValue(widget.initialValue);
  }

  @override
  void didUpdateWidget(covariant AppFormDateInputContent oldWidget) {
    if (oldWidget.initialValue != widget.initialValue) {
      _updateControllerValue(widget.initialValue);
    }
    super.didUpdateWidget(oldWidget);
  }

  void _updateControllerValue(DateTime? date) {
    if (date != null) {
      _controller.text = DateFormat('MMM yyyy').format(date);
    } else {
      _controller.clear();
    }
  }

  Future<void> _handleTap() async {
    final now = DateTime.now();
    final firstDate = widget.firstDate ?? DateTime(now.year - 50);
    final lastDate = widget.lastDate ?? DateTime(now.year + 50);

    final result = await showDatePicker(
      context: context,
      initialDate: widget.initialValue ?? now,
      firstDate: firstDate,
      lastDate: lastDate,
      builder: _themeBuilder,
    );

    if (result != null) {
      _updateControllerValue(result);
      if (widget.onChanged != null) {
        widget.onChanged!(result);
      }
    }
  }

  Widget _themeBuilder(BuildContext context, Widget? child) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: isDark
            ? ColorScheme.dark(
                primary: AppTheme.c.primary,
                onPrimary: AppTheme.c.text,
                surface: AppTheme.c.background,
                onSurface: AppTheme.c.text,
              )
            : ColorScheme.light(
                primary: AppTheme.c.primary,
                onPrimary: AppTheme.c.background,
                surface: AppTheme.c.background,
                onSurface: AppTheme.c.text,
              ),
      ),
      child: child!,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin ?? EdgeInsets.zero,
      child: AppFormTextInputContent<DateTime?>(
        onTap: _handleTap,
        readOnly: true,
        controller: _controller,
        state: widget.state,
        fieldState: widget.fieldState,
        placeholder: widget.placeholder,
        heading: widget.heading,
        subHeading: widget.subHeading,
        sideInput: widget.sideInput,
        suffixIcon: widget.suffixIcon,
      ),
    );
  }
}
