part of '../letters.dart';

class _Placeholder extends StatelessWidget {
  const _Placeholder();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: .stretch,
      children: [
        // Header skeleton
        Padding(
          padding: Space.a.t16,
          child: Column(
            crossAxisAlignment: .stretch,
            children: [
              const Skeleton(type: SkeletonType.textLeft),
              Space.y.t08,
              Skeleton(
                type: SkeletonType.card,
                width: 200,
                height: 14,
                borderRadius: 4.radius(),
              ),
            ],
          ),
        ),
        Space.y.t16,
        // Generator skeleton
        Padding(
          padding: Space.h.t16,
          child: const _GeneratorSkeleton(),
        ),
        Space.y.t20,
        // Saved Letters Header
        Padding(
          padding: Space.h.t16,
          child: const Skeleton(type: SkeletonType.textLeft, width: 150),
        ),
        Space.y.t12,
        // Letter cards skeleton
        ...List.generate(
          2,
          (_) => const Padding(
            padding: EdgeInsets.only(left: 16, right: 16, bottom: 12),
            child: _LetterCardSkeleton(),
          ),
        ),
      ],
    );
  }
}

class _GeneratorSkeleton extends StatelessWidget {
  const _GeneratorSkeleton();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: Space.a.t16,
      decoration: BoxDecoration(
        color: AppTheme.c.primary.addOpacity(0.05),
        borderRadius: 12.radius(),
        border: Border.all(
          color: AppTheme.c.primary.addOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: .stretch,
        children: [
          const Skeleton(type: SkeletonType.textLeft, width: 180),
          Space.y.t16,
          Skeleton(
            type: SkeletonType.card,
            height: 50,
            borderRadius: 8.radius(),
          ),
          Space.y.t12,
          Skeleton(
            type: SkeletonType.card,
            height: 50,
            borderRadius: 8.radius(),
          ),
          Space.y.t12,
          Skeleton(
            type: SkeletonType.card,
            height: 80,
            borderRadius: 8.radius(),
          ),
          Space.y.t16,
          const Skeleton(type: SkeletonType.button, height: 44),
        ],
      ),
    );
  }
}

class _LetterCardSkeleton extends StatelessWidget {
  const _LetterCardSkeleton();

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
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    const Skeleton(type: SkeletonType.textLeft, width: 150),
                    Space.y.t08,
                    Skeleton(
                      type: SkeletonType.card,
                      width: 120,
                      height: 14,
                      borderRadius: 4.radius(),
                    ),
                  ],
                ),
              ),
              Skeleton(
                type: SkeletonType.card,
                width: 40,
                height: 40,
                borderRadius: 8.radius(),
              ),
            ],
          ),
          Space.y.t12,
          const Skeleton(type: SkeletonType.paragraph),
          Space.y.t16,
          Row(
            children: [
              const Expanded(
                child: Skeleton(
                  type: SkeletonType.button,
                  height: 36,
                ),
              ),
              Space.x.t08,
              const Expanded(
                child: Skeleton(
                  type: SkeletonType.button,
                  height: 36,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
