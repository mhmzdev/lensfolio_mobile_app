part of '../home.dart';

class _SkillsCard extends StatelessWidget {
  const _SkillsCard();

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
            'Skills',
            style: AppText.h2b,
          ),
          Space.y.t12,
          Wrap(
            spacing: SpaceToken.t08,
            children: userData.skills
                .map(
                  (skill) => Chip(
                    visualDensity: .compact,
                    padding: Space.z,
                    label: Text(
                      skill,
                      style: AppText.b2 + FontWeight.w500,
                    ),
                    backgroundColor: AppTheme.c.secondary.addOpacity(.1),
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
