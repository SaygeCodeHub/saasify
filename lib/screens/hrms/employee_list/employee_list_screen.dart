import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/employee/employee_bloc.dart';
import 'package:saasify/bloc/employee/employee_event.dart';
import 'package:saasify/bloc/employee/employee_states.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/hrms/add_employee/add_employee_screen.dart';
import 'package:saasify/screens/hrms/employee_list/employee_list_mobile.dart';
import 'package:saasify/screens/hrms/employee_list/employee_list_web.dart';
import 'package:saasify/utils/progress_bar.dart';
import 'package:saasify/widgets/alertDialogs/error_alert_dialog.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';
import 'package:saasify/widgets/layoutWidgets/responsive_layout.dart';

import '../../../widgets/text/module_heading.dart';

class EmployeeListScreen extends StatelessWidget {
  static const routeName = 'EmployeeListScreen';

  const EmployeeListScreen({super.key});

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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        isMobile ? const SizedBox.shrink() : const BackButton(),
                        const SizedBox(width: spacingXMedium),
                        const ModuleHeading(label: 'Employee List')
                      ])
                    ],
                  ),
                ),
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
                        ProgressBar.dismiss(context);
                        showDialog(
                            context: context,
                            builder: (context) {
                              return ErrorAlertDialog(
                                  description: state.errorMessage);
                            });
                      }
                    },
                    buildWhen: (previous, current) =>
                        previous.runtimeType != current.runtimeType,
                    builder: (context, state) {
                      if (state is LoadingEmployees) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (state is EmployeesLoaded) {
                        return ResponsiveLayout(
                          mobileBody:
                              EmployeeListMobile(employees: state.employees),
                          desktopBody:
                              EmployeeListWeb(employees: state.employees),
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
              ],
            ));
  }
}
