import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/employee/employee_bloc.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/hrms/add_employee/add_employee_web.dart';
import 'package:saasify/screens/hrms/add_employee/widgets/buttons/delete_employee_button.dart';
import 'package:saasify/screens/hrms/add_employee/widgets/buttons/edit_employee_button.dart';
import 'package:saasify/widgets/alertDialogs/warning_alert_dialogue.dart';
import 'package:saasify/widgets/layoutWidgets/responsive_layout.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';
import 'package:saasify/widgets/text/module_heading.dart';
import 'add_employee_mobile.dart';

class AddEmployeeScreen extends StatelessWidget {
  final bool isViewOnly;
  final bool isProfile;
  static const routeName = 'AddEmployeeScreen';

  AddEmployeeScreen(
      {super.key, this.isViewOnly = false, required this.isProfile});

  final _formKeys = List.generate(4, (index) => GlobalKey<FormState>());

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
                                  : BackButton(
                                      onPressed: () {
                                        checkIfChangesMade(context);
                                      },
                                    ),
                              const SizedBox(width: spacingXMedium),
                              getHeading(context)
                            ])),
                        buildActions(context)
                      ]),
                  Expanded(
                      child: ResponsiveLayout(
                          mobileBody: AddEmployeeMobile(
                              formKeys: _formKeys, isViewOnly: isViewOnly),
                          provideMobilePadding: false,
                          desktopBody: AddEmployeeWeb(
                              formKeys: _formKeys, isViewOnly: isViewOnly)))
                ]));
  }

  getHeading(BuildContext context) {
    return ModuleHeading(
        label: isViewOnly
            ? isProfile
                ? "Profile Details"
                : "Employee Details"
            : isProfile
                ? "Update Profile"
                : context.read<EmployeeBloc>().selectedEmployeeId == -1
                    ? 'Add Employee'
                    : 'Update Employee');
  }

  checkIfChangesMade(BuildContext context) {
    context.read<EmployeeBloc>().isEmployeeDetailsChanged()
        ? showDialog(
            context: context,
            builder: (context) {
              return WarningAlertDialogue(
                  showCloseButton: true,
                  description:
                      "Are you sure you want to leave this page without saving the changes?",
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  });
            })
        : Navigator.pop(context);
  }

  buildActions(BuildContext context) {
    return context.read<EmployeeBloc>().selectedEmployeeId == -1
        ? const SizedBox.shrink()
        : Row(mainAxisSize: MainAxisSize.min, children: [
            !isViewOnly
                ? const SizedBox.shrink()
                : EditEmployeeButton(
                    routeName: routeName, isProfile: isProfile),
            isProfile ? const SizedBox.shrink() : const DeleteEmployeeButton(),
            const SizedBox(width: spacingLarge)
          ]);
  }
}
