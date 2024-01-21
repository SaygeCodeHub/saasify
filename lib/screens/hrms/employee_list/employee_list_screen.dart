import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/hrms/employee_list/employee_list_mobile.dart';
import 'package:saasify/screens/hrms/employee_list/employee_list_web.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';
import 'package:saasify/widgets/layoutWidgets/responsive_layout.dart';

import '../../../widgets/text/module_heading.dart';
import '../../../widgets/userInput/custom_drop_down.dart';

class EmployeeListScreen extends StatelessWidget {
  static const routeName = 'EmployeeListScreen';

  const EmployeeListScreen({super.key});

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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          isMobile
                              ? const SizedBox.shrink()
                              : const BackButton(),
                          const SizedBox(width: spacingXMedium),
                          const ModuleHeading(label: 'Employee List'),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: spacingLarger),
                        child: (isMobile)
                            ? InkWell(
                                onTap: () {},
                                child: const Icon(Icons.filter_alt_outlined))
                            : Row(children: [
                                CustomDropDown(
                                    items: const ["Last 30 Days", "Last Week"],
                                    defaultValue: "Last 30 Days",
                                    icon: Icons.store,
                                    onChanged: (value) {}),
                              ]),
                      ),
                    ],
                  ),
                ),
                const Expanded(
                  child: ResponsiveLayout(
                    mobileBody: EmployeeListMobile(),
                    desktopBody: EmployeeListWeb(),
                  ),
                ),
              ],
            ));
  }
}
