part of '../generated_letter.dart';

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: Space.b.t12,
      child: CoreHeader(
        leading: IconButton(
          onPressed: () {
            showDialog(
              context: context,
              routeSettings: const RouteSettings(
                name: '${AppRoutes.generatedLetter}/back-alert',
              ),
              builder: (context) => const _BackAlert(),
            );
          },
          icon: Icon(
            LucideIcons.arrow_left,
            size: 20,
            color: AppTheme.c.primary,
          ),
          splashRadius: 20,
          padding: EdgeInsets.zero,
          visualDensity: VisualDensity.compact,
        ),
        title: 'Letter Generated',
        subTitle: 'You can copy/paste body and edit it as you like.',
      ),
    );
  }
}
