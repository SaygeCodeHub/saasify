import 'package:flutter/material.dart';
import 'package:saasify/utils/globals.dart';
import '../app_bar/mobile_appbar.dart';
import '../app_bar/web_appbar.dart';
import '../drawer/custom_drawer.dart';

class ScreenSkeleton extends StatelessWidget {
  final bool isHome;
  final Widget Function(bool isMobile) childScreenBuilder;
  static const routeName = 'RootScreen';

  const ScreenSkeleton(
      {super.key, required this.childScreenBuilder, this.isHome = false});

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < mobileBreakPoint;
    return Scaffold(
      appBar: isMobile ? MobileAppBar(isHome: isHome) : null,
      drawer: isMobile
          ? isHome
              ? const CustomDrawer()
              : null
          : null,
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          isMobile ? const SizedBox() : const CustomDrawer(),
          isMobile ? const SizedBox() : const VerticalDivider(),
          Expanded(
            child: !isMobile
                ? Column(
                    children: [
                      WebAppBar(isHome: isHome),
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
