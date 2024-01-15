import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/new_app_theme.dart';
import 'package:saasify/widgets/profile/user_name_widget.dart';
import 'package:saasify/widgets/profile/user_profile_widget.dart';

import '../../configs/app_colors.dart';
import '../../utils/globals.dart';
import '../icons/notification_widget.dart';
import '../icons/settings_widget.dart';

class WebAppBar extends StatelessWidget {
  const WebAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height * 0.065,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  left: spacingStandard, top: spacingStandard),
              child: Text(locationBreadcrumbs.join(' > '),
                  style: Theme.of(context).textTheme.churnPathTextStyle),
            ),
          ),
          const SettingsWidget(),
          const SizedBox(width: spacingXMedium),
          const NotificationWidget(),
          const SizedBox(width: spacingXMedium),
          const Padding(
            padding: EdgeInsets.only(right: spacingHuge),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                UserProfileWidget(),
                SizedBox(width: spacingXMedium),
                UserNameWidget()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
