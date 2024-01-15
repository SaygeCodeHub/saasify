import 'package:flutter/material.dart';
import 'package:saasify/configs/app_color.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';

class TopBar extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final String headingText;

  const TopBar({Key? key, required this.scaffoldKey, required this.headingText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColor.saasifyLightDeepBlue,
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: spacingSmall, horizontal: spacingLarge),
            child: IconButton(
                onPressed: () {
                  scaffoldKey.currentState!.openDrawer();
                },
                iconSize: 30,
                icon: const Icon(Icons.menu, color: AppColor.saasifyWhite)),
          ),
          Text(headingText,
              style: Theme.of(context).textTheme.xxTiny.copyWith(
                  fontWeight: FontWeight.w500, color: AppColor.saasifyWhite)),
        ]));
  }
}
