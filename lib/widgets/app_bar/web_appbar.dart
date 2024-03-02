import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/widgets/app_bar/profile_dropdown.dart';
import 'package:saasify/widgets/userInput/change_branch.dart';

class WebAppBar extends StatelessWidget {
  final bool isHome;

  const WebAppBar({super.key, this.isHome = false});

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
              const SizedBox(width: spacingXMedium),
              const ChangeBranch(),
              const Expanded(child: SizedBox()),
              IconButton(
                  splashRadius: 20,
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: const Icon(Icons.settings)),
              // const NotificationWidget(),
              const SizedBox(width: spacingXMedium),
              Padding(
                  padding: const EdgeInsets.only(right: spacingXXHuge),
                  child: WebProfileDropdown(isHome: isHome))
            ]));
  }
}
