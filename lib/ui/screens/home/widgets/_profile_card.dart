part of '../home.dart';

class _ProfileCard extends StatelessWidget {
  const _ProfileCard();

  @override
  Widget build(BuildContext context) {
    final userData = context.userData!;

    return Container(
      padding: Space.a.t12,
      child: Column(
        crossAxisAlignment: .start,
        children: [
          Row(
            crossAxisAlignment: .start,
            children: [
              Consumer<_ScreenState>(
                builder: (context, value, child) {
                  return BlocBuilder<FileCubit, FileState>(
                    buildWhen: (a, b) =>
                        a.uploadProfilePicture != b.uploadProfilePicture,
                    builder: (context, state) {
                      final loading = state.uploadProfilePicture.isLoading;
                      return AppAvatar(
                        showEditBadge: !value.pickingFile && !loading,
                        onEditTap: () => value.pickProfilePicture(context),
                      );
                    },
                  ).withScaleAnimation();
                },
              ),
              Space.x.t12,
              Expanded(
                child: Column(
                  mainAxisSize: .min,
                  crossAxisAlignment: .start,
                  children: [
                    Text(userData.fullName, style: AppText.h1b),
                    if (userData.designation.available)
                      Text(
                        userData.designation!,
                        style: AppText.b1,
                      ),
                    if (userData.cityState.available)
                      Padding(
                        padding: Space.t.t04,
                        child: Row(
                          children: [
                            Icon(
                              LucideIcons.map_pin,
                              size: SpaceToken.t16,
                            ),
                            Space.x.t04,
                            Flexible(
                              child: Text(
                                userData.cityState!,
                                style: AppText.b2b,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
              Space.x.t08,
              const _Settings(),
            ],
          ),
        ],
      ),
    );
  }
}
