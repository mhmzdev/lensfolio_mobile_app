part of '../forms.dart';

enum AppFormDateType {
  single,
  range,
}

class AppFormContainedDateInput extends FormBuilderField<dynamic> {
  AppFormContainedDateInput({
    super.key,
    required super.name,
    this.type = AppFormDateType.range,
    dynamic initialValue,
    super.validator,
    super.onChanged,
    super.enabled = true,
    this.margin,
    this.firstDate,
    this.lastDate,
    this.dateFormat,
  }) : super(
         initialValue:
             initialValue ??
             (type == AppFormDateType.range
                 ? DateTimeRange(
                     start: DateTime.now(),
                     end: DateTime.now().add(7.days),
                   )
                 : null),
         builder: (FormFieldState<dynamic> field) {
           final state = field as _AppFormContainedDateInputState;
           final value = state.value;

           var label = '';
           if (value == null) {
             label = 'Select Date';
           } else if (type == AppFormDateType.range && value is DateTimeRange) {
             label = '${_formatDate(value.start)} - ${_formatDate(value.end)}';
           } else if (type == AppFormDateType.single && value is DateTime) {
             label = _formatDate(value);
           }

           return Padding(
             padding: margin ?? EdgeInsets.zero,
             child: ClipRRect(
               borderRadius: 12.radius(),
               child: BackdropFilter(
                 filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                 child: GestureDetector(
                   onTap: state.enabled ? state._handleTap : null,
                   child: Container(
                     padding: Space.sym(SpaceToken.t16, SpaceToken.t16),
                     decoration: BoxDecoration(
                       color: AppTheme.c.primary.withValues(alpha: 0.75),
                       borderRadius: 12.radius(),
                     ),
                     child: Row(
                       mainAxisSize: MainAxisSize.min,
                       children: [
                         Icon(
                           LucideIcons.calendar,
                           size: 20,
                           color: AppTheme.c.text,
                         ),
                         if (value != null) ...[
                           Space.x.t08,
                           Text(
                             label,
                             style: AppText.b2
                                 .cl(AppTheme.c.text)
                                 .sfPro,
                           ),
                         ],
                       ],
                     ),
                   ),
                 ),
               ),
             ),
           );
         },
       );

  final AppFormDateType type;
  final EdgeInsetsGeometry? margin;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final DateFormat? dateFormat;

  static String _formatDate(DateTime date) {
    // Basic formatting: 28 Feb
    // We can use intl if available, but for now manual or basic intl
    // Assuming intl is available via flutter_form_builder dependency
    return DateFormat('d MMM').format(date);
  }

  @override
  FormBuilderFieldState<AppFormContainedDateInput, dynamic> createState() =>
      _AppFormContainedDateInputState();
}

class _AppFormContainedDateInputState
    extends FormBuilderFieldState<AppFormContainedDateInput, dynamic> {
  Future<void> _handleTap() async {
    final now = DateTime.now();
    final firstDate = widget.firstDate ?? DateTime(now.year - 1);
    final lastDate = widget.lastDate ?? DateTime(now.year + 1);

    if (widget.type == AppFormDateType.range) {
      const initialEntryMode = DatePickerEntryMode.calendar;
      final result = await showDateRangePicker(
        context: context,
        firstDate: firstDate,
        lastDate: lastDate,
        initialDateRange: value is DateTimeRange ? value : null,
        initialEntryMode: initialEntryMode,
        builder: _themeBuilder,
        routeSettings: const RouteSettings(name: '/date_range_picker'),
      );
      if (result != null) {
        didChange(result);
      }
    } else {
      final result = await showDatePicker(
        context: context,
        initialDate: value is DateTime ? value : now,
        firstDate: firstDate,
        lastDate: lastDate,
        builder: _themeBuilder,
      );
      if (result != null) {
        didChange(result);
      }
    }
  }

  Widget _themeBuilder(BuildContext context, Widget? child) {
    return Theme(
      data: Theme.of(context).copyWith(
        colorScheme: ColorScheme.dark(
          primary: AppTheme.c.primary,
          onPrimary: AppTheme.c.text,
          surface: AppTheme.c.primary,
          onSurface: AppTheme.c.text,
        ),
      ),
      child: child!,
    );
  }
}
