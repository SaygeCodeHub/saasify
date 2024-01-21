import 'package:flutter/material.dart';
import 'package:saasify/screens/hrms/add_employee/add_employee_web.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';

import '../../../configs/app_spacing.dart';
import '../../../widgets/layoutWidgets/responsive_layout.dart';
import '../../../widgets/text/module_heading.dart';
import 'add_employee_mobile.dart';

class AddEmployeeScreen extends StatelessWidget {
  static const routeName = 'AddEmployeeScreen';

  const AddEmployeeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenSkeleton(
        childScreenBuilder: (isMobile) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: spacingMedium),
                Padding(
                  padding: const EdgeInsets.only(left: spacingMedium),
                  child: Row(
                    children: [
                      isMobile ? const SizedBox.shrink() : const BackButton(),
                      const SizedBox(width: spacingXMedium),
                      const ModuleHeading(label: 'Add New Employee'),
                    ],
                  ),
                ),
                const Expanded(
                  child: ResponsiveLayout(
                      mobileBody: AddEmployeeMobile(),
                      desktopBody: AddEmployeeWeb()),
                ),
              ],
            ));
  }
}
