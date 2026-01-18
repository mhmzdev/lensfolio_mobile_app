part of '../projects.dart';

class _Placeholder extends StatelessWidget {
  const _Placeholder();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .stretch,
      children: [
        // Header skeleton
        Padding(
          padding: Space.h.t16,
          child: const Skeleton(type: SkeletonType.textLeft),
        ),
        Space.y.t20,
        // Project cards skeleton
        ...List.generate(
          3,
          (_) => const Padding(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 12),
            child: _ProjectCardSkeleton(),
          ),
        ),
      ],
    );
  }
}

class _ProjectCardSkeleton extends StatelessWidget {
  const _ProjectCardSkeleton();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: 12.radius(),
        border: Border.all(
          color: AppTheme.c.subText.addOpacity(0.15),
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: .start,
        children: [
          // Image skeleton
          const Skeleton(
            type: SkeletonType.card,
            width: double.infinity,
            height: 180,
            borderRadius: BorderRadius.zero,
          ),
          Padding(
            padding: Space.a.t16,
            child: Column(
              crossAxisAlignment: .start,
              children: [
                // Title
                const Skeleton(type: SkeletonType.textLeft),
                Space.y.t12,
                // Description
                const Skeleton(type: SkeletonType.paragraph),
                Space.y.t16,
                // Technologies
                Row(
                  children: [
                    Skeleton(
                      type: SkeletonType.card,
                      width: 60,
                      height: 24,
                      borderRadius: 4.radius(),
                    ),
                    Space.x.t08,
                    Skeleton(
                      type: SkeletonType.card,
                      width: 70,
                      height: 24,
                      borderRadius: 4.radius(),
                    ),
                    Space.x.t08,
                    Skeleton(
                      type: SkeletonType.card,
                      width: 80,
                      height: 24,
                      borderRadius: 4.radius(),
                    ),
                  ],
                ),
                Space.y.t16,
                // Buttons
                Row(
                  children: [
                    const Expanded(
                      child: Skeleton(
                        type: SkeletonType.button,
                        height: 44,
                      ),
                    ),
                    Space.x.t12,
                    const Expanded(
                      child: Skeleton(
                        type: SkeletonType.button,
                        height: 44,
                      ),
                    ),
                  ],
                ),
                Space.y.t12,
                // Date
                Skeleton(
                  type: SkeletonType.card,
                  width: 120,
                  height: 14,
                  borderRadius: 4.radius(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
