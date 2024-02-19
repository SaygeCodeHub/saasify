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
                                : const BackButton(),
                            const SizedBox(width: spacingXMedium),
                            ModuleHeading(
                                label: isViewOnly
                                    ? "Employee Details"
                                    : 'Update Employee'),
                          ])),
                      !isViewOnly
                          ? const SizedBox.shrink()
                          : Card(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: spacingMedium),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Card(
                                    color: AppColors.orange,
                                    child: IconButton(
                                        onPressed: () {
                                          Navigator.pushReplacementNamed(
                                              context, routeName);
                                        },
                                        padding: EdgeInsets.zero,
                                        icon: const Icon(Icons.edit_outlined,
                                            color: AppColors.white, size: 20)),
                                  ),
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
                                                const SuccessAlertDialog(
                                                    description:
                                                        "Employee Deleted Successfully"));
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
                                    child: Card(
                                      color: AppColors.errorRed,
                                      child: IconButton(
                                          onPressed: () {
                                            context
                                                .read<EmployeeBloc>()
                                                .add(DeleteEmployee());
                                          },
                                          padding: EdgeInsets.zero,
                                          icon: const Icon(Icons.delete_outline,
                                              color: AppColors.white,
                                              size: 20)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ],
                  ),
                  Expanded(
                    child: ResponsiveLayout(
                        mobileBody: AddEmployeeMobile(
                            formKeys: _formKeys, isViewOnly: isViewOnly),
                        provideMobilePadding: false,
                        desktopBody: AddEmployeeWeb(
                            formKeys: _formKeys, isViewOnly: isViewOnly)),
                  )
                ]));
  }
}
