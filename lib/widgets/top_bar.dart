import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';

import '../configs/app_colors.dart';

class TopBar extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;
  final String headingText;
  final void Function()? onTap;

  const TopBar({
    super.key,
    required this.scaffoldKey,
    required this.headingText,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        color: AppColors.primaryAccent,
        child: Row(children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                vertical: spacingSmall, horizontal: spacingLarge),
            child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              return (constraints.maxWidth < 600)
                  ? InkWell(
                      onTap: () {}, child: const Icon(Icons.arrow_back_ios_new))
                  : IconButton(
                      onPressed: () {
                        scaffoldKey.currentState!.openDrawer();
                      },
                      iconSize: 30,
                      icon: const Icon(Icons.menu));
            }),
          ),
          Text(headingText,
              style: Theme.of(context)
                  .textTheme
                  .xTiny
                  .copyWith(fontWeight: FontWeight.w700)),
        ]));
  }
}
