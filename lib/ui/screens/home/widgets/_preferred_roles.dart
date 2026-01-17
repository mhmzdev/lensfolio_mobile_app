part of '../home.dart';

class _PreferredRolesCard extends StatelessWidget {
  const _PreferredRolesCard();

  @override
  Widget build(BuildContext context) {
    final userData = context.userData!;

    return Container(
      padding: Space.a.t16,
      decoration: AppProps.softBoxDecoration,
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Text(
            'Preferred Roles',
            style: AppText.h2b,
          ),
          Space.y.t12,
          Wrap(
            spacing: SpaceToken.t08,
            children: userData.preferredRoles
                .map(
                  (role) => Chip(
                    visualDensity: .compact,
                    padding: Space.z,
                    label: Text(
                      role,
                      style: AppText.b2 + FontWeight.w500,
                    ),
                    backgroundColor: AppTheme.c.primary.addOpacity(.1),
                    shape: RoundedRectangleBorder(
                      borderRadius: 4.radius(),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
