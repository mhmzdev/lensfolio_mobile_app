import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:lensfolio_mobile_app/configs/configs.dart';
import 'package:lensfolio_mobile_app/router/routes.dart';

part '_data.dart';
part '_model.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    App.init(context);
    final currentPath = context.currentPath;

    return Material(
      color: AppTheme.c.background,
      elevation: 0,
      child: Container(
        padding: Space.z.sb().t(8),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: .centerRight,
            end: .centerLeft,
            colors: [
              AppTheme.c.primary.addOpacity(.1),
              Colors.transparent,
              AppTheme.c.primary.addOpacity(.1),
            ],
          ),
        ),
        child: Row(
          children: _tabs.map((tab) {
            final isActive = tab.path == currentPath;
            final color = isActive
                ? AppTheme.c.primary
                : AppTheme.c.subText.addOpacity(.5);

            return Expanded(
              child: InkWell(
                onTap: () {
                  if (isActive) return;
                  tab.path.pushReplace(context);
                },
                child: Column(
                  children: [
                    Space.y.t04,
                    Icon(tab.icon, color: color),
                    Space.y.t04,
                    Text(
                      tab.label,
                      style: AppText.b2b + color,
                    ),
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
