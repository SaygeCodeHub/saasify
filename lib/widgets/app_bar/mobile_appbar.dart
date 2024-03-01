import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/widgets/icons/notification_widget.dart';

class MobileAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isHome;

  const MobileAppBar({super.key, this.isHome = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: spacingSmall),
          child: isHome
              ? PopupMenuButton(
                  itemBuilder: (BuildContext context) {
                    return [
                      PopupMenuItem(
                        onTap: () {},
                        child: const Text('Add Announcement'),
                      )
                    ];
                  },
                  icon: const Icon(Icons.add, color: AppColors.darkBlue))
              : const SizedBox.shrink(),
        ),
        Padding(
          padding: const EdgeInsets.only(right: spacingSmall),
          child: isHome ? const NotificationWidget() : const SizedBox(),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
