import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/employee/employee_bloc.dart';
import 'package:saasify/bloc/employee/employee_event.dart';
import 'package:saasify/bloc/employee/employee_states.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/hrms/add_employee/add_employee_screen.dart';
import 'package:saasify/screens/hrms/salaryRollout/employee_salary_mobile.dart';
import 'package:saasify/screens/hrms/salaryRollout/employee_salary_web.dart';
import 'package:saasify/utils/progress_bar.dart';
import 'package:saasify/widgets/alertDialogs/error_alert_dialog.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';
import 'package:saasify/widgets/layoutWidgets/responsive_layout.dart';
import 'package:saasify/widgets/text/module_heading.dart';

class EmployeeSalaryListScreen extends StatelessWidget {
  static const routeName = 'EmployeeSalaryListScreen';

  const EmployeeSalaryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<EmployeeBloc>().add(GetAllEmployees());
    return ScreenSkeleton(
        childScreenBuilder: (isMobile) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: spacingMedium),
                Padding(
                    padding: const EdgeInsets.only(left: spacingMedium),
                    child: Row(children: [
                      isMobile ? const SizedBox.shrink() : const BackButton(),
                      const SizedBox(width: spacingXMedium),
                      const ModuleHeading(label: 'Employee List')
                    ])),
                Expanded(
                  child: BlocConsumer<EmployeeBloc, EmployeeStates>(
                    listener: (context, state) {
                      if (state is LoadingEmployeesFailed) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return ErrorAlertDialog(
                                  description: state.errorMessage);
                            });
                      }
                      if (state is LoadingEmployee) {
                        ProgressBar.show(context);
                      }
                      if (state is EmployeeLoaded) {
                        ProgressBar.dismiss(context);
                        Navigator.pushNamed(
                                context, AddEmployeeScreen.routeName,
                                arguments: true)
                            .then((value) => context
                                .read<EmployeeBloc>()
                                .add(GetAllEmployees()));
                      }
                      if (state is LoadingEmployeeFailed) {
                        context.read<EmployeeBloc>().add(GetAllEmployees());
                        ProgressBar.dismiss(context);
                        showDialog(
                            context: context,
                            builder: (context) {
                              return ErrorAlertDialog(
                                  description: state.errorMessage);
                            });
                      }
                    },
                    buildWhen: (previous, current) {
                      return current is LoadingEmployees ||
                          current is EmployeesLoaded ||
                          current is LoadingEmployeesFailed;
                    },
                    builder: (context, state) {
                      if (state is LoadingEmployees) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (state is EmployeesLoaded) {
                        return ResponsiveLayout(
                          mobileBody:
                              EmployeeSalaryMobile(employees: state.employees),
                          desktopBody:
                              EmployeeSalaryWeb(employees: state.employees),
                        );
                      }
                      if (state is LoadingEmployeesFailed) {
                        return Center(
                            child: Text(state.errorMessage,
                                style: Theme.of(context)
                                    .textTheme
                                    .errorTitleTextStyle));
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),
                const Divider(height: 0),
                Container(
                    padding: const EdgeInsets.all(spacingStandard),
                    color: AppColors.white,
                    child: Align(
                      alignment:
                          isMobile ? Alignment.center : Alignment.centerRight,
                      child: PrimaryButton(
                          buttonWidth:
                              isMobile ? null : kGeneralActionButtonWidth,
                          onPressed: () {},
                          buttonTitle: "Pay All"),
                    ))
              ],
            ));
  }
}
