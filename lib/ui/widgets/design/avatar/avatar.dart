import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lensfolio_mobile_app/configs/configs.dart';
import 'package:lensfolio_mobile_app/models/user/user_data.dart';

/// An avatar widget that displays a user's profile picture or initials.
///
/// Priority order for image display:
/// 1. [imageUrl] parameter (if provided)
/// 2. Current user's profile picture (if logged in)
/// 3. User's initials (fallback)
class AppAvatar extends StatelessWidget {
  const AppAvatar({
    super.key,
    this.imageUrl,
    this.size = 60,
    this.borderWidth = 4,
    this.showEditBadge = false,
    this.onEditTap,
  });

  /// Optional image URL that takes highest priority
  final String? imageUrl;

  /// Size of the avatar (width and height)
  final double size;

  /// Width of the gradient border
  final double borderWidth;

  /// Whether to show the edit badge in bottom right
  final bool showEditBadge;

  /// Callback when edit badge is tapped
  final VoidCallback? onEditTap;

  @override
  Widget build(BuildContext context) {
    final currentUser = context.userData;

    return SizedBox(
      width: size + (borderWidth * 2) + (showEditBadge ? 8 : 0),
      height: size + (borderWidth * 2) + (showEditBadge ? 8 : 0),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          _AvatarCore(
            imageUrl: imageUrl,
            currentUser: currentUser,
            size: size,
            borderWidth: borderWidth,
          ),
          if (showEditBadge)
            Positioned(
              bottom: SpaceToken.t04,
              right: SpaceToken.t04,
              child: _EditBadge(onTap: onEditTap),
            ),
        ],
      ),
    );
  }
}

class _AvatarCore extends StatelessWidget {
  const _AvatarCore({
    required this.imageUrl,
    required this.currentUser,
    required this.size,
    required this.borderWidth,
  });

  final String? imageUrl;
  final UserData? currentUser;
  final double size;
  final double borderWidth;

  String? get _effectiveImageUrl {
    // Priority: 1. Param, 2. Current user profile
    if (imageUrl.available) return imageUrl;
    if (currentUser?.profilePicture.available == true) {
      return currentUser!.profilePicture;
    }
    return null;
  }

  String get _initials {
    if (currentUser != null) return currentUser!.initials;
    return '?';
  }

  @override
  Widget build(BuildContext context) {
    final totalSize = size + (borderWidth * 2);

    return Container(
      width: totalSize,
      height: totalSize,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: AppColors.gradientPrimary,
      ),
      padding: EdgeInsets.all(borderWidth),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppTheme.c.background,
        ),
        clipBehavior: Clip.antiAlias,
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    final effectiveUrl = _effectiveImageUrl;

    if (effectiveUrl != null) {
      return CachedNetworkImage(
        imageUrl: effectiveUrl,
        fit: BoxFit.cover,
        placeholder: (context, url) => _InitialsContent(initials: _initials),
        errorWidget: (context, url, error) =>
            _InitialsContent(initials: _initials),
      );
    }

    return _InitialsContent(initials: _initials);
  }
}

class _InitialsContent extends StatelessWidget {
  const _InitialsContent({required this.initials});

  final String initials;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: AppColors.gradientPrimary,
      ),
      child: Center(
        child: Text(
          initials,
          style: AppText.h1b.copyWith(
            color: Colors.white,
            fontSize: 32.font(),
          ),
        ),
      ),
    );
  }
}

class _EditBadge extends StatelessWidget {
  const _EditBadge({this.onTap});

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 32,
        height: 32,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppTheme.c.background,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.15),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(
          Icons.edit_outlined,
          size: SpaceToken.t24,
          color: AppTheme.c.primary,
        ),
      ),
    );
  }
}
