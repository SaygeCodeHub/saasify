import 'package:flutter/material.dart';

import '../../configs/app_dimensions.dart';
import '../../utils/global.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget mobileBody;
  final bool provideMobilePadding;
  final Widget desktopBody;

  const ResponsiveLayout({
    super.key,
    required this.mobileBody,
    this.provideMobilePadding = true,
    required this.desktopBody,
  });

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < mobileBreakPoint;
    return isMobile
        ? SafeArea(
            child: Padding(
              padding: provideMobilePadding
                  ? const EdgeInsets.all(mobileBodyPadding)
                  : const EdgeInsets.all(0),
              child: mobileBody,
            ),
          )
        : desktopBody;
  }
}
