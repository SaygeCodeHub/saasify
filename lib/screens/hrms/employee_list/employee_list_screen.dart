import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/hrms/employee_list/employee_list_mobile.dart';
import 'package:saasify/screens/hrms/employee_list/employee_list_web.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';
import 'package:saasify/widgets/layoutWidgets/responsive_layout.dart';

import '../../../widgets/text/module_heading.dart';

class EmployeeListScreen extends StatelessWidget {
  static const routeName = 'EmployeeListScreen';

  const EmployeeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenSkeleton(
        childScreenBuilder: (isMobile) => const Column(
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
                      ModuleHeading(label: 'Employee List'),
                    ],
                  ),
                ),
                Expanded(
                  child: ResponsiveLayout(
                    mobileBody: EmployeeListMobile(),
                    desktopBody: EmployeeListWeb(),
                  ),
                ),
              ],
            ));
  }
}
