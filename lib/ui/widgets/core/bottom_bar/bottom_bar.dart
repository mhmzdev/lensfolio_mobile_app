import 'package:devxi/configs/configs.dart';
import 'package:devxi/router/routes.dart';
import 'package:devxi/ui/widgets/design/avatar/avatar.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

part '_data.dart';
part '_model.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final currentPath = context.currentPath;

    final user = context.user(true);
    final isProfileIncomplete = user?.playerInfo?.incompleteProfile ?? false;

    return Container(
      padding: Space.z.sb(8).t(8),
      decoration: BoxDecoration(
        color: AppTheme.c.appBg,
        boxShadow: [AppProps.sectionShadow.first],
      ),
      child: Material(
        color: Colors.transparent,
        child: Row(
          children: _tabs.map((tab) {
            final isActive = tab.path == currentPath;
            final color = isActive ? AppTheme.c.secondary : AppTheme.c.textBody;
            var iconColor = color;

            if (isProfileIncomplete && tab.path == AppRoutes.profile) {
              iconColor = AppTheme.c.warning;
              if (isActive) iconColor = AppTheme.c.secondary;
            }

            return Expanded(
              child: InkWell(
                onTap: () {
                  /// If the tab is already active, do nothing.
                  if (isActive) return;
                  tab.path.pushReplace(context);
                },
                child: Column(
                  children: [
                    Space.y.t05,
                    if (tab.path == AppRoutes.profile)
                      isProfileIncomplete
                          ? Icon(
                              HugeIcons.strokeRoundedAlert02,
                              color: iconColor,
                            )
                          : const Avatar(size: 30)
                    else
                      Icon(tab.icon, color: color),
                    Space.y.t05,
                    Text(tab.label, style: AppText.b1 + color),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
