import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/hrms/add_employee/add_employee_web.dart';
import 'package:saasify/screens/hrms/add_employee/widgets/add_employee_button.dart';
import 'package:saasify/widgets/layoutWidgets/responsive_layout.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';
import 'package:saasify/widgets/text/module_heading.dart';
import 'add_employee_mobile.dart';

class AddEmployeeScreen extends StatelessWidget {
  static const routeName = 'AddEmployeeScreen';

  AddEmployeeScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ScreenSkeleton(
        childScreenBuilder: (isMobile) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: spacingMedium),
                  Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: spacingMedium),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [
                              isMobile
                                  ? const SizedBox.shrink()
                                  : const BackButton(),
                              const SizedBox(width: spacingXMedium),
                              const ModuleHeading(label: 'Add New Employee'),
                            ]),
                            AddEmployeeButton(formKey: _formKey)
                          ])),
                  Form(
                    key: _formKey,
                    child: const Expanded(
                      child: ResponsiveLayout(
                          mobileBody: AddEmployeeMobile(),
                          desktopBody: AddEmployeeWeb()),
                    ),
                  )
                ]));
  }
}
