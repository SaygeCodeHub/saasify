import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/utils/date_time_formatters.dart';
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
              Text(formatTime(DateTime.now()),
                  maxLines: 1,
                  style: Theme.of(context).textTheme.cardMobileValueTextStyle),
              const SizedBox(width: spacingXMedium),
              IconButton(
                  splashRadius: 20,
                  padding: EdgeInsets.zero,
                  onPressed: () {},
                  icon: const Icon(Icons.settings)),
              const SizedBox(width: spacingXMedium),
              Padding(
                  padding: const EdgeInsets.only(right: spacingXXHuge),
                  child: WebProfileDropdown(isHome: isHome))
            ]));
  }
}
