import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/widgets/user_name_widget.dart';
import 'package:saasify/widgets/user_profile_widget.dart';

import '../../configs/app_colors.dart';
import '../icons/notification_icon.dart';

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
            child: Container(),
          ),
          const NotificationIcon(),
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
