import 'package:flutter/material.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/widgets/profile/user_name_widget.dart';
import 'package:saasify/widgets/profile/user_profile_widget.dart';
import '../../configs/app_colors.dart';
import '../userInput/change_branch.dart';
import '../icons/logout_icon.dart';
import '../icons/notification_widget.dart';
import '../icons/settings_widget.dart';

class WebAppBar extends StatelessWidget {
  const WebAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.grey,
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height * 0.065,
      child: const Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(width: spacingXMedium),
          ChangeBranch(),
          Expanded(child: SizedBox()),
          NotificationWidget(),
          SizedBox(width: spacingXMedium),
          SettingsWidget(),
          SizedBox(width: spacingXMedium),
          LogoutIconWidget(),
          SizedBox(width: spacingXMedium),
          Padding(
              padding: EdgeInsets.only(right: spacingHuge),
              child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    UserProfileWidget(size: kAvatarRadius),
                    SizedBox(width: spacingXMedium),
                    UserNameWidget()
                  ])),
        ],
      ),
    );
  }
}
