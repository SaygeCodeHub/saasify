import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';

import '../icons/notification_widget.dart';

class MobileAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isHome;
  const MobileAppBar({super.key, this.isHome = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: [
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
