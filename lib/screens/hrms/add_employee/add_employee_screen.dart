import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/hrms/add_employee/add_employee_web.dart';
import 'package:saasify/widgets/layoutWidgets/responsive_layout.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';
import 'package:saasify/widgets/text/module_heading.dart';
import 'add_employee_mobile.dart';

class AddEmployeeScreen extends StatelessWidget {
  final bool isViewOnly;
  static const routeName = 'AddEmployeeScreen';

  AddEmployeeScreen({super.key, this.isViewOnly = false});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ScreenSkeleton(
        childScreenBuilder: (isMobile) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: spacingMedium),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: spacingMedium),
                          child: Row(children: [
                            isMobile
                                ? const SizedBox.shrink()
                                : const BackButton(),
                            const SizedBox(width: spacingXMedium),
                            ModuleHeading(
                                label: isViewOnly
                                    ? "Employee Details"
                                    : 'Update Employee'),
                          ])),
                      !isViewOnly
                          ? const SizedBox.shrink()
                          : Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.pushReplacementNamed(
                                          context, routeName);
                                    },
                                    padding: EdgeInsets.zero,
                                    icon: const Icon(Icons.edit,
                                        color: AppColors.orange, size: 20)),
                                const SizedBox(width: spacingSmallest),
                                Text(
                                  "Edit",
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelTextStyle
                                      .copyWith(color: AppColors.orange),
                                ),
                                const SizedBox(width: spacingMedium),
                              ],
                            )
                    ],
                  ),
                  Form(
                    key: _formKey,
                    child: Expanded(
                      child: ResponsiveLayout(
                          mobileBody: AddEmployeeMobile(
                              formKey: _formKey, isViewOnly: isViewOnly),
                          provideMobilePadding: false,
                          desktopBody: AddEmployeeWeb(
                              formKey: _formKey, isViewOnly: isViewOnly)),
                    ),
                  )
                ]));
  }
}
