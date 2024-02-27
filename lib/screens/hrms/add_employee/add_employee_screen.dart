import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/employee/employee_bloc.dart';
import 'package:saasify/bloc/employee/employee_event.dart';
import 'package:saasify/bloc/employee/employee_states.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/hrms/add_employee/add_employee_web.dart';
import 'package:saasify/utils/progress_bar.dart';
import 'package:saasify/widgets/alertDialogs/error_alert_dialog.dart';
import 'package:saasify/widgets/alertDialogs/success_alert_dialog.dart';
import 'package:saasify/widgets/alertDialogs/warning_alert_dialogue.dart';
import 'package:saasify/widgets/layoutWidgets/responsive_layout.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';
import 'package:saasify/widgets/text/module_heading.dart';
import 'add_employee_mobile.dart';

class AddEmployeeScreen extends StatelessWidget {
  final bool isViewOnly;
  static const routeName = 'AddEmployeeScreen';

  AddEmployeeScreen({super.key, this.isViewOnly = false});

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
                                        context
                                                .read<EmployeeBloc>()
                                                .isEmployeeDetailsChanged()
                                            ? showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return WarningAlertDialogue(
                                                      description:
                                                          "Are you sure you want to leave this page without saving the changes?",
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                        Navigator.pop(context);
                                                      });
                                                })
                                            : Navigator.pop(context);
                                      },
                                    ),
                              const SizedBox(width: spacingXMedium),
                              ModuleHeading(
                                  label: isViewOnly
                                      ? "Employee Details"
                                      : context
                                                  .read<EmployeeBloc>()
                                                  .selectedEmployeeId ==
                                              -1
                                          ? 'Add Employee'
                                          : 'Update Employee'),
                            ])),
                        context.read<EmployeeBloc>().selectedEmployeeId == -1
                            ? const SizedBox.shrink()
                            : Row(mainAxisSize: MainAxisSize.min, children: [
                                !isViewOnly
                                    ? const SizedBox.shrink()
                                    : IconButton(
                                        onPressed: () {
                                          Navigator.pushReplacementNamed(
                                              context, routeName);
                                        },
                                        padding: EdgeInsets.zero,
                                        icon: const Icon(Icons.edit_outlined,
                                            color: AppColors.darkBlue,
                                            size: 25)),
                                BlocListener<EmployeeBloc, EmployeeStates>(
                                    listener: (context, state) {
                                      if (state is DeletingEmployee) {
                                        ProgressBar.show(context);
                                      }
                                      if (state is EmployeeDeleted) {
                                        ProgressBar.dismiss(context);
                                        showDialog(
                                            context: context,
                                            builder: (context) =>
                                                SuccessAlertDialog(
                                                    description:
                                                        "Employee Deleted Successfully",
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                      Navigator.pop(context);
                                                    }));
                                      }
                                      if (state is DeletingEmployeeFailed) {
                                        ProgressBar.dismiss(context);
                                        showDialog(
                                            context: context,
                                            builder: (context) =>
                                                ErrorAlertDialog(
                                                    description:
                                                        state.errorMessage));
                                      }
                                    },
                                    child: IconButton(
                                        onPressed: () {
                                          showDialog(
                                              context: context,
                                              builder: (context) {
                                                return WarningAlertDialogue(
                                                    description:
                                                        "Are you sure you want to delete this employee?",
                                                    onPressed: () {
                                                      context
                                                          .read<EmployeeBloc>()
                                                          .add(
                                                              DeleteEmployee());
                                                      Navigator.pop(context);
                                                    });
                                              });
                                        },
                                        padding: EdgeInsets.zero,
                                        icon: const Icon(Icons.delete_outline,
                                            color: AppColors.darkBlue,
                                            size: 25))),
                                const SizedBox(width: spacingLarge)
                              ])
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
}
