part of '../jobs.dart';

class _Filters extends StatelessWidget {
  const _Filters();

  @override
  Widget build(BuildContext context) {
    final screenState = _ScreenState.s(context, true);

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: Space.h.t16,
      child: Row(
        children: _FiltersType.values.map((f) {
          final isSelected = screenState.getFiltersType == f;

          return GestureDetector(
            onTap: () => screenState.setFiltersType(f),
            child: AnimatedContainer(
              duration: AppProps.medium,
              margin: Space.r.t08,
              padding: Space.a.t08 + Space.h.t08,
              decoration: BoxDecoration(
                color: isSelected
                    ? AppTheme.c.secondary
                    : AppTheme.c.background,
                borderRadius: 8.radius(),
              ),
              child: Text(
                f.name.titleCase,
                style:
                    AppText.b2b +
                    (isSelected ? AppTheme.c.background : AppTheme.c.text),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
