import 'package:flutter/material.dart';
import 'package:saasify/screens/hrms/leaves/apply_and_leave_detail_mobile_screen.dart';
import 'package:saasify/screens/hrms/leaves/apply_and_leave_detail_web_screen.dart';

import '../../../configs/app_spacing.dart';
import '../../../widgets/layoutWidgets/responsive_layout.dart';
import '../../../widgets/layoutWidgets/screen_skeleton.dart';
import '../../../widgets/text/module_heading.dart';

class ApplyAndLeaveDetailScreen extends StatelessWidget {
  static const routeName = 'ApplyAndLeaveDetailScreen';
  final bool? isDetailScreen;

  const ApplyAndLeaveDetailScreen({super.key, this.isDetailScreen = false});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ScreenSkeleton(
        childScreenBuilder: (bool isMobile) => const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: spacingMedium),
            Padding(
              padding: EdgeInsets.only(left: spacingMedium),
              child: Row(
                children: [
                  BackButton(),
                  SizedBox(
                    width: spacingXMedium,
                  ),
                  ModuleHeading(label: 'Apply Leave'),
                ],
              ),
            ),
            Expanded(
              child: ResponsiveLayout(
                  mobileBody:
                      ApplyAndLeaveDetailMobileScreen(isDetailScreen: false),
                  desktopBody:
                      ApplyAndLeaveDetailWebScreen(isDetailScreen: false)),
            ),
          ],
        ),
      ),
    );
  }
}
