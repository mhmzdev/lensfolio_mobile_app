part of '../add_project.dart';

class _CoverImage extends StatelessWidget {
  const _CoverImage();

  @override
  Widget build(BuildContext context) {
    final screenState = _ScreenState.s(context, true);
    final coverImage = screenState.coverImage;
    final isLoading = screenState.pickingImage;
    final showExistingImage = screenState.showExistingImage;
    final existingImageUrl = screenState.existingImageUrl;

    // Determine which image to show
    final hasImage = coverImage != null || showExistingImage;

    return Column(
      crossAxisAlignment: .start,
      children: [
        Text('Cover Image (Optional)', style: AppText.b1b),
        Space.y.t08,
        GestureDetector(
          onTap: isLoading ? null : () => screenState.pickCoverImage(context),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            height: 180.sp(),
            width: double.infinity,
            decoration: BoxDecoration(
              color: AppTheme.c.background,
              borderRadius: 12.radius(),
              border: Border.all(
                color: AppTheme.c.subText.withValues(alpha: .3),
                width: 1.5,
              ),
              image: _getDecorationImage(
                coverImage: coverImage,
                showExistingImage: showExistingImage,
                existingImageUrl: existingImageUrl,
              ),
            ),
            child: hasImage
                ? _buildOverlay(screenState)
                : _buildPlaceholder(isLoading),
          ),
        ),
      ],
    );
  }

  DecorationImage? _getDecorationImage({
    required File? coverImage,
    required bool showExistingImage,
    required String? existingImageUrl,
  }) {
    if (coverImage != null) {
      return DecorationImage(
        image: FileImage(coverImage),
        fit: BoxFit.cover,
      );
    }
    if (showExistingImage && existingImageUrl != null) {
      return DecorationImage(
        image: NetworkImage(existingImageUrl),
        fit: BoxFit.cover,
      );
    }
    return null;
  }

  Widget _buildPlaceholder(bool isLoading) {
    return Center(
      child: isLoading
          ? SizedBox(
              width: 24.sp(),
              height: 24.sp(),
              child: CircularProgressIndicator(
                strokeWidth: 2,
                color: AppTheme.c.primary,
              ),
            )
          : Column(
              mainAxisAlignment: .center,
              children: [
                Icon(
                  LucideIcons.image_plus,
                  size: 40.sp(),
                  color: AppTheme.c.subText,
                ),
                Space.y.t08,
                Text(
                  'Tap to add cover image',
                  style: AppText.b2 + AppTheme.c.subText,
                ),
              ],
            ),
    );
  }

  Widget _buildOverlay(_ScreenState screenState) {
    return Stack(
      children: [
        Positioned(
          top: SpaceToken.t08,
          right: SpaceToken.t08,
          child: Row(
            children: [
              _ImageActionButton(
                icon: LucideIcons.pencil,
                onTap: screenState.pickCoverImage,
              ),
              Space.x.t08,
              _ImageActionButton(
                icon: LucideIcons.trash_2,
                onTap: (_) => screenState.removeCoverImage(),
                isDestructive: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ImageActionButton extends StatelessWidget {
  final IconData icon;
  final void Function(BuildContext) onTap;
  final bool isDestructive;

  const _ImageActionButton({
    required this.icon,
    required this.onTap,
    this.isDestructive = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(context),
      child: Container(
        padding: Space.a.t08,
        decoration: BoxDecoration(
          color: isDestructive
              ? AppTheme.c.dangerBase.addOpacity(.9)
              : AppTheme.c.background.addOpacity(.9),
          borderRadius: 8.radius(),
        ),
        child: Icon(
          icon,
          size: 18.sp(),
          color: isDestructive ? Colors.white : AppTheme.c.text,
        ),
      ),
    );
  }
}
