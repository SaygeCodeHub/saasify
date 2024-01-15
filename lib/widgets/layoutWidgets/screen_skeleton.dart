import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:saasify/screens/hrms/hrms_dashboard_screen.dart';
import 'package:saasify/utils/globals.dart';
import '../app_bar/mobile_appbar.dart';
import '../app_bar/web_appbar.dart';
import '../drawer/custom_drawer.dart';

class ScreenSkeleton extends StatelessWidget {
  final Widget Function(bool isMobile) childScreenBuilder;
  static const routeName = 'RootScreen';

  const ScreenSkeleton({super.key, required this.childScreenBuilder});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < mobileBreakPoint;
    return Scaffold(
      appBar: isMobile ? const MobileAppBar() : null,
      drawer: isMobile ? const CustomDrawer() : null,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          isMobile ? const SizedBox() : const CustomDrawer(),
          Expanded(
            child: !isMobile
                ? Column(
                    children: [
                      const WebAppBar(),
                      Expanded(child: childScreenBuilder(isMobile)),
                    ],
                  )
                : childScreenBuilder(isMobile),
          )
        ],
      ),
    );
  }
}
