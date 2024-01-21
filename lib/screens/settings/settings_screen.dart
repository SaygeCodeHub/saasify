import 'package:flutter/material.dart';
import 'package:saasify/screens/settings/settings_mobile_screen.dart';
import 'package:saasify/screens/settings/settings_web_screen.dart';
import 'package:saasify/widgets/layoutWidgets/responsive_layout.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';

import '../../configs/app_spacing.dart';
import '../../widgets/text/module_heading.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = 'SettingsScreen';

  const SettingsScreen({super.key});

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
                        SizedBox(width: spacingXMedium),
                        ModuleHeading(label: 'Settings'),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ResponsiveLayout(
                        mobileBody: SettingsMobileScreen(),
                        desktopBody: SettingsWebScreen()),
                  )
                ],
              )),
    );
  }
}
