part of '../forms.dart';

class AppChipsInput<T> extends StatefulWidget {
  final List<T> values;
  final ValueChanged<List<T>> onChanged;
  final T Function(String) inputTransformer;
  final String Function(T) displayTransformer;
  final String? placeholder;
  final AppFormState state;
  final String? error;

  const AppChipsInput({
    super.key,
    required this.values,
    required this.onChanged,
    required this.inputTransformer,
    required this.displayTransformer,
    this.placeholder,
    this.state = AppFormState.def,
    this.error,
  });

  @override
  State<AppChipsInput<T>> createState() => _AppChipsInputState<T>();
}

class _AppChipsInputState<T> extends State<AppChipsInput<T>> {
  final _controller = TextEditingController();
  final _focusNode = FocusNode();
  late AppFormState _state;

  @override
  void initState() {
    super.initState();
    _state = widget.state;
    _focusNode.addListener(_onFocusChange);
  }

  void _onFocusChange() {
    setState(() {
      _state = _focusNode.hasFocus ? AppFormState.pressed : AppFormState.def;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _focusNode.removeListener(_onFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AppFormBase(
      state: _state,
      error: widget.error,
      selectInput: false,
      child: GestureDetector(
        onTap: () => _focusNode.requestFocus(),
        behavior: HitTestBehavior.translucent,
        child: Wrap(
          spacing: SpaceToken.t08,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            ...widget.values.map(
              (val) => Chip(
                visualDensity: .compact,
                padding: Space.z,
                label: Text(
                  widget.displayTransformer(val),
                  style: AppText.b2 + FontWeight.w500,
                ),
                backgroundColor: AppTheme.c.secondary.withValues(alpha: .1),
                shape: RoundedRectangleBorder(
                  borderRadius: 4.radius(),
                ),
                side: BorderSide.none,
                deleteIcon: Icon(
                  LucideIcons.x,
                  size: SpaceToken.t16,
                  color: AppTheme.c.text,
                ),
                onDeleted: () {
                  final newValue = List<T>.from(widget.values);
                  newValue.remove(val);
                  widget.onChanged(newValue);
                },
              ),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(minWidth: 48),
              child: IntrinsicWidth(
                child: TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  style: AppText.b1,
                  decoration: InputDecoration(
                    hintText: widget.values.isEmpty ? widget.placeholder : null,
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: Space.v.t04,
                  ),
                  onSubmitted: (val) {
                    final trimmed = val.trim();
                    if (trimmed.isNotEmpty) {
                      final newValue = List<T>.from(widget.values);
                      final transformedValue = widget.inputTransformer(trimmed);
                      if (!newValue.contains(transformedValue)) {
                        newValue.add(transformedValue);
                        widget.onChanged(newValue);
                      }
                      _controller.clear();
                      _focusNode.requestFocus();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppFormChipsInput<T> extends StatelessWidget {
  final String name;
  final List<T>? initialValue;
  final FormFieldValidator<List<T>>? validator;
  final ValueChanged<List<T>?>? onChanged;
  final String? heading;
  final String? subHeading;
  final String? placeholder;
  final String? helper;
  final AutovalidateMode autovalidateMode;

  final T Function(String) inputTransformer;
  final String Function(T) displayTransformer;

  const AppFormChipsInput({
    super.key,
    required this.name,
    required this.inputTransformer,
    required this.displayTransformer,
    this.initialValue,
    this.validator,
    this.onChanged,
    this.heading,
    this.subHeading,
    this.placeholder,
    this.helper,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (heading != null) Text(heading!, style: AppText.b1b),
        if (subHeading != null) Text(subHeading!, style: AppText.b2),
        if (heading != null || subHeading != null) Space.y.t04,
        FormBuilderField<List<T>>(
          name: name,
          initialValue: initialValue,
          validator: validator,
          onChanged: onChanged,
          autovalidateMode: autovalidateMode,
          builder: (field) {
            return AppChipsInput<T>(
              values: field.value ?? [],
              onChanged: (val) => field.didChange(val),
              inputTransformer: inputTransformer,
              displayTransformer: displayTransformer,
              placeholder: placeholder,
              error: field.errorText,
            );
          },
        ),
        if (helper != null) ...[
          Space.y.t08,
          Text(helper!, style: AppText.b2 + AppTheme.c.text.addOpacity(.6)),
        ],
      ],
    );
  }
}
