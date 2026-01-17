part of '../jobs.dart';

class _Placeholder extends StatelessWidget {
  const _Placeholder();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .stretch,
      children: [
        // Search header skeleton
        Padding(
          padding: Space.h.t16,
          child: const Skeleton(type: SkeletonType.textLeft),
        ),
        Space.y.t12,
        Padding(
          padding: Space.h.t16,
          child: const Skeleton(type: SkeletonType.button),
        ),
        Space.y.t12,
        // Filters skeleton
        Padding(
          padding: Space.h.t16,
          child: Row(
            children: [
              const Skeleton(
                type: SkeletonType.card,
                width: 80,
                height: 28,
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              Space.x.t08,
              const Skeleton(
                type: SkeletonType.card,
                width: 100,
                height: 28,
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              Space.x.t08,
              const Skeleton(
                type: SkeletonType.card,
                width: 90,
                height: 28,
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
            ],
          ),
        ),
        Space.y.t20,
        // Job cards skeleton (3 cards)
        ...List.generate(
          5,
          (_) => const Padding(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 12),
            child: _JobCardSkeleton(),
          ),
        ),
      ],
    );
  }
}

class _JobCardSkeleton extends StatelessWidget {
  const _JobCardSkeleton();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Space.a.t16,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: 12.radius(),
        border: Border.all(
          color: AppTheme.c.subText.addOpacity(0.15),
        ),
      ),
      child: Column(
        crossAxisAlignment: .start,
        children: [
          // Title + bookmark
          Row(
            children: [
              const Expanded(
                child: Skeleton(type: SkeletonType.textLeft),
              ),
              Space.x.t16,
              Skeleton(
                type: SkeletonType.card,
                width: 24,
                height: 24,
                borderRadius: 4.radius(),
              ),
            ],
          ),
          Space.y.t12,
          // Company & location row
          Row(
            children: [
              Skeleton(
                type: SkeletonType.card,
                width: 120,
                height: 14,
                borderRadius: 4.radius(),
              ),
              Space.x.t12,
              Skeleton(
                type: SkeletonType.card,
                width: 80,
                height: 14,
                borderRadius: 4.radius(),
              ),
            ],
          ),
          Space.y.t12,
          // Salary & date row
          Row(
            children: [
              Skeleton(
                type: SkeletonType.card,
                width: 100,
                height: 16,
                borderRadius: 4.radius(),
              ),
              const Spacer(),
              Skeleton(
                type: SkeletonType.card,
                width: 80,
                height: 14,
                borderRadius: 4.radius(),
              ),
            ],
          ),
          Space.y.t12,
          // Description
          const Skeleton(type: SkeletonType.paragraph),
          Space.y.t16,
          // Button
          const Skeleton(type: SkeletonType.button),
        ],
      ),
    );
  }
}
