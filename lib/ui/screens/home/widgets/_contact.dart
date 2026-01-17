part of '../home.dart';

class _ContactCard extends StatelessWidget {
  const _ContactCard();

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
            'Contact',
            style: AppText.h2b,
          ),
          Space.y.t08,
          Row(
            children: [
              Icon(
                LucideIcons.phone,
                size: SpaceToken.t16,
              ),
              Space.x.t08,
              Text(userData.details!.phoneNumber),
            ],
          ),

          Space.y.t08,
          Row(
            children: [
              Icon(
                LucideIcons.globe,
                size: SpaceToken.t16,
              ),
              Space.x.t08,
              Text(userData.website!),
            ],
          ),
          Space.y.t08,
          Row(
            children: [
              Icon(
                LucideIcons.map_pin,
                size: SpaceToken.t16,
              ),
              Space.x.t08,
              Text(userData.details!.address),
            ],
          ),
        ],
      ),
    );
  }
}
