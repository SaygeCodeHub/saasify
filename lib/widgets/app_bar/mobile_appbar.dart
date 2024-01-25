import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/widgets/icons/logout_icon.dart';

import '../icons/notification_widget.dart';

class MobileAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MobileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: spacingSmall),
          child: NotificationWidget(),
        ),
        Padding(
          padding: EdgeInsets.only(right: spacingSmall),
          child: LogoutIconWidget(),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
