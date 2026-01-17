part of '../home.dart';

class _Placeholder extends StatelessWidget {
  const _Placeholder();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .stretch,
      children: [
        // Profile Card skeleton
        Container(
          padding: Space.a.t12,
          child: Row(
            children: [
              const Skeleton(
                type: SkeletonType.avatar,
                width: 80,
              ),
              Space.x.t12,
              const Expanded(
                child: Skeleton(type: SkeletonType.textLeft),
              ),
            ],
          ),
        ),
        Space.y.t12,
        // Buttons skeleton
        Row(
          children: [
            const Expanded(child: Skeleton(type: SkeletonType.button)),
            Space.x.t08,
            const Expanded(child: Skeleton(type: SkeletonType.button)),
          ],
        ),
        Space.y.t16,
        // About Card skeleton
        const Skeleton(type: SkeletonType.card, height: 150),
        Space.y.t16,
        // Contact Card skeleton
        const Skeleton(type: SkeletonType.card, height: 100),
        Space.y.t16,
        // Skills Card skeleton
        const Skeleton(type: SkeletonType.card, height: 150),
        Space.y.t16,
        // Tech Stack Card skeleton
        const Skeleton(type: SkeletonType.card, height: 120),
        Space.y.t16,
        // Preferred Roles Card skeleton
        const Skeleton(type: SkeletonType.card, height: 80),
      ],
    );
  }
}
