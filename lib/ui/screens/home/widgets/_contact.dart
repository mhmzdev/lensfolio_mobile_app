part of '../home.dart';

class _ContactCard extends StatelessWidget {
  const _ContactCard();

  @override
  Widget build(BuildContext context) {
    final userData = context.userData!;

    final contactDetails = userData.contactDetails;
    if (contactDetails == null) return const SizedBox.shrink();

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
          if (userData.contactDetails!.phoneNumber.available) ...[
            Space.y.t08,
            Row(
              children: [
                Icon(
                  LucideIcons.phone,
                  size: SpaceToken.t16,
                ),
                Space.x.t08,
                Text(userData.contactDetails!.phoneNumber),
              ],
            ),
          ],
          if (userData.contactDetails!.address.available) ...[
            Space.y.t08,
            if (userData.contactDetails!.address.available)
              Row(
                children: [
                  Icon(
                    LucideIcons.map_pin,
                    size: SpaceToken.t16,
                  ),
                  Space.x.t08,
                  Text(userData.contactDetails!.address!),
                ],
              ),
          ],
          if (userData.website.available) ...[
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
          ],
        ],
      ),
    );
  }
}
