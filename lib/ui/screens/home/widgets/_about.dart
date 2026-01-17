part of '../home.dart';

class _AboutCard extends StatelessWidget {
  const _AboutCard();

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
            'About',
            style: AppText.h2b,
          ),
          Space.y.t08,
          Text(
            userData.about!,
            style: AppText.b1,
          ),
        ],
      ),
    );
  }
}
