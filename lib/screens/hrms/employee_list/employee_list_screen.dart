import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/hrms/employee_list/employee_list_mobile.dart';
import 'package:saasify/screens/hrms/employee_list/employee_list_web.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';
import 'package:saasify/widgets/layoutWidgets/responsive_layout.dart';

class EmployeeListScreen extends StatelessWidget {
  static const routeName = 'EmployeeListScreen';
  const EmployeeListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenSkeleton(
        childScreenBuilder: (isMobile) => const Padding(
              padding: EdgeInsets.all(spacingLarge),
              child: ResponsiveLayout(
                mobileBody: EmployeeListMobile(),
                desktopBody: EmployeeListWeb(),
              ),
            ));
  }
}
