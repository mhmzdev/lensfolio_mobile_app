part of '../home.dart';

class _Settings extends StatelessWidget {
  const _Settings();

  @override
  Widget build(BuildContext context) {
    App.init(context);

    return PopupMenuButton<String>(
      routeSettings: const RouteSettings(
        name: '/drop-down/profile-settings',
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(SpaceToken.t12),
      ),
      elevation: 4,
      offset: Offset(0, SpaceToken.t32),
      color: AppTheme.c.background,
      onSelected: (value) {
        if (value == 'edit') {
          AppRoutes.editProfile.push(context);
        } else if (value == 'logout') {
          UserCubit.c(context).logout();
        } else if (value == 'delete') {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            routeSettings: const RouteSettings(
              name: '/modal/delete-account',
            ),
            isDismissible: false,
            enableDrag: false,
            backgroundColor: Colors.transparent,
            builder: (context) => const _DeleteAccountModal(),
          );
        }
      },
      itemBuilder: (context) {
        App.init(context);
        return [
          PopupMenuItem(
            value: 'edit',
            child: Row(
              mainAxisSize: .min,
              children: [
                Container(
                  padding: Space.a.t08,
                  decoration: AppProps.softBoxDecoration.copyWith(
                    color: AppTheme.c.primary.addOpacity(.1),
                  ),
                  child: Icon(
                    LucideIcons.user_round_pen,
                    size: SpaceToken.t16,
                    color: AppTheme.c.primary,
                  ),
                ),
                Space.x.t12,
                Text(
                  'Edit Profile',
                  style: AppText.b1b.copyWith(
                    color: AppTheme.c.text,
                  ),
                ),
              ],
            ),
          ),
          PopupMenuItem(
            value: 'logout',
            child: Row(
              mainAxisSize: .min,
              children: [
                Container(
                  padding: Space.a.t08,
                  decoration: AppProps.softBoxDecoration.copyWith(
                    color: AppTheme.c.dangerBase.addOpacity(.1),
                  ),
                  child: Icon(
                    LucideIcons.log_out,
                    size: SpaceToken.t16,
                    color: AppTheme.c.dangerBase,
                  ),
                ),
                Space.x.t12,
                Text(
                  'Logout',
                  style: AppText.b1b.copyWith(
                    color: AppTheme.c.dangerBase,
                  ),
                ),
              ],
            ),
          ),
          PopupMenuItem(
            value: 'delete',
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: Space.a.t08,
                  decoration: AppProps.softBoxDecoration.copyWith(
                    color: AppTheme.c.dangerBase.addOpacity(.1),
                  ),
                  child: Icon(
                    LucideIcons.user_round_x,
                    size: SpaceToken.t16,
                    color: AppTheme.c.dangerBase,
                  ),
                ),
                Space.x.t12,
                Text(
                  'Delete Account',
                  style: AppText.b1b.copyWith(
                    color: AppTheme.c.dangerBase,
                  ),
                ),
              ],
            ),
          ),
        ];
      },
      child: Container(
        padding: Space.a.t04,
        decoration: BoxDecoration(
          color: AppTheme.c.secondary.addOpacity(.1),
          shape: BoxShape.circle,
        ),
        child: Icon(
          Icons.more_vert,
          size: SpaceToken.t24,
          color: AppTheme.c.secondary,
        ),
      ),
    );
  }
}
