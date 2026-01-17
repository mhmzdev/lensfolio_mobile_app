import 'package:flutter/material.dart';
import 'package:lensfolio_mobile_app/configs/configs.dart';
import 'package:shimmer/shimmer.dart';

enum SkeletonType {
  avatar,
  textLeft,
  textRight,
  paragraph,
  card,
  button,
}

/// A skeleton loading widget for displaying placeholder content.
class Skeleton extends StatelessWidget {
  const Skeleton({
    super.key,
    this.type = SkeletonType.card,
    this.width,
    this.height,
    this.borderRadius,
  });

  final SkeletonType type;
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return switch (type) {
      SkeletonType.avatar => _SkeletonAvatar(size: width ?? 60),
      SkeletonType.textLeft => const _SkeletonText(align: .start),
      SkeletonType.textRight => const _SkeletonText(align: .end),
      SkeletonType.paragraph => _SkeletonParagraph(width: width),
      SkeletonType.card => _SkeletonCard(
        width: width,
        height: height,
        borderRadius: borderRadius,
      ),
      SkeletonType.button => _SkeletonButton(width: width),
    };
  }
}

class _SkeletonAvatar extends StatelessWidget {
  const _SkeletonAvatar({required this.size});

  final double size;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppTheme.c.subText.addOpacity(0.15),
      highlightColor: AppTheme.c.subText.addOpacity(0.05),
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppTheme.c.subText,
        ),
      ),
    );
  }
}

class _SkeletonText extends StatelessWidget {
  const _SkeletonText({required this.align});

  final CrossAxisAlignment align;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppTheme.c.subText.addOpacity(0.15),
      highlightColor: AppTheme.c.subText.addOpacity(0.05),
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: align,
        children: [
          Container(
            height: 14,
            width: 180,
            decoration: BoxDecoration(
              color: AppTheme.c.subText,
              borderRadius: 4.radius(),
            ),
          ),
          Space.y.t08,
          Container(
            height: 12,
            width: 120,
            decoration: BoxDecoration(
              color: AppTheme.c.subText,
              borderRadius: 4.radius(),
            ),
          ),
        ],
      ),
    );
  }
}

class _SkeletonParagraph extends StatelessWidget {
  const _SkeletonParagraph({this.width});

  final double? width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppTheme.c.subText.addOpacity(0.15),
      highlightColor: AppTheme.c.subText.addOpacity(0.05),
      child: Column(
        mainAxisSize: .min,
        crossAxisAlignment: .start,
        children: [
          Container(
            height: 12,
            width: width ?? double.infinity,
            decoration: BoxDecoration(
              color: AppTheme.c.subText,
              borderRadius: 4.radius(),
            ),
          ),
          Space.y.t08,
          Container(
            height: 12,
            width: (width ?? 300) * 0.9,
            decoration: BoxDecoration(
              color: AppTheme.c.subText,
              borderRadius: 4.radius(),
            ),
          ),
          Space.y.t08,
          Container(
            height: 12,
            width: (width ?? 300) * 0.75,
            decoration: BoxDecoration(
              color: AppTheme.c.subText,
              borderRadius: 4.radius(),
            ),
          ),
        ],
      ),
    );
  }
}

class _SkeletonCard extends StatelessWidget {
  const _SkeletonCard({
    this.width,
    this.height,
    this.borderRadius,
  });

  final double? width;
  final double? height;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppTheme.c.subText.addOpacity(0.15),
      highlightColor: AppTheme.c.subText.addOpacity(0.05),
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 120,
        decoration: BoxDecoration(
          color: AppTheme.c.subText,
          borderRadius: borderRadius ?? 12.radius(),
        ),
      ),
    );
  }
}

class _SkeletonButton extends StatelessWidget {
  const _SkeletonButton({this.width});

  final double? width;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppTheme.c.subText.addOpacity(0.15),
      highlightColor: AppTheme.c.subText.addOpacity(0.05),
      child: Container(
        width: width ?? double.infinity,
        height: 48,
        decoration: BoxDecoration(
          color: AppTheme.c.subText,
          borderRadius: 12.radius(),
        ),
      ),
    );
  }
}
