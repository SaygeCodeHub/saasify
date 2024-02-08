import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/widgets/app_bar/profile_dropdown.dart';
import '../../configs/app_colors.dart';
import '../userInput/change_branch.dart';
import '../icons/notification_widget.dart';

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
          Padding(
            padding: EdgeInsets.only(right: spacingXXHuge),
            child: WebProfileDropdown(),
          )
        ],
      ),
    );
  }
}
