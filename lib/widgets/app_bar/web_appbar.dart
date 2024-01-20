import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/authentication/auhentication_screen.dart';
import 'package:saasify/widgets/profile/user_name_widget.dart';
import 'package:saasify/widgets/profile/user_profile_widget.dart';
import '../../configs/app_colors.dart';
import '../change_branch.dart';
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
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(width: spacingXMedium),
          const ChangeBranch(),
          const Expanded(child: SizedBox()),
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
                  ])),
          IconButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, AuthenticationScreen.routeName, (route) => false);
              },
              icon: const Icon(Icons.logout_rounded))
        ],
      ),
    );
  }
}
