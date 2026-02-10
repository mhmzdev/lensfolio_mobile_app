part of '../home.dart';

class _DeleteAccountModal extends StatelessWidget {
  const _DeleteAccountModal();

  @override
  Widget build(BuildContext context) {
    return AppModal(
      expanded: false,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                padding: Space.a.t08,
                decoration: AppProps.softBoxDecoration.copyWith(
                  color: AppTheme.c.dangerBase.addOpacity(.1),
                ),
                child: Icon(
                  LucideIcons.user_round_x,
                  size: SpaceToken.t20,
                  color: AppTheme.c.dangerBase,
                ),
              ),
              Space.x.t12,
              Text('Delete Account', style: AppText.h2b),
            ],
          ),
          Space.y.t16,
          Text(
            'Your account will be deleted permanently. This action cannot be undone. Please be careful and proceed with caution.\n\nYour data includes:\n- Profile Information\n- Media (images) if any\n- Misc data linked with your profile',
            style: AppText.b1,
          ),
          Space.y.t24,
          Row(
            children: [
              Expanded(
                child: AppButton(
                  style: .primaryBorder,
                  label: 'Cancel',
                  onTap: () => Navigator.pop(context),
                ),
              ),
              Space.x.t12,
              Expanded(
                child: BlocBuilder<UserCubit, UserState>(
                  buildWhen: (a, b) => a.delete != b.delete,
                  builder: (context, state) {
                    final loading = state.delete.isLoading;
                    return AppButton(
                      label: 'Delete',
                      style: .error,
                      state: loading ? .disabled : .def,
                      onTap: () => UserCubit.c(context).delete(),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
