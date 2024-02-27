import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/employee/employee_bloc.dart';
import 'package:saasify/bloc/employee/employee_event.dart';
import 'package:saasify/bloc/salary_rollouts/salary_rollout_bloc.dart';
import 'package:saasify/bloc/salary_rollouts/salary_rollout_event.dart';
import 'package:saasify/bloc/salary_rollouts/salary_rollout_state.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/hrms/salaryRollout/employee_salary_mobile.dart';
import 'package:saasify/screens/hrms/salaryRollout/employee_salary_web.dart';
import 'package:saasify/utils/progress_bar.dart';
import 'package:saasify/widgets/alertDialogs/error_alert_dialog.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';
import 'package:saasify/widgets/layoutWidgets/responsive_layout.dart';
import 'package:saasify/widgets/text/module_heading.dart';

import '../../../widgets/actions/detailsPopUp.dart';

class EmployeeSalaryListScreen extends StatelessWidget {
  static const routeName = 'EmployeeSalaryListScreen';

  const EmployeeSalaryListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<SalaryRolloutBloc>().add(FetchSalaryRollout());
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
                    child: BlocConsumer<SalaryRolloutBloc, SalaryRolloutStates>(
                      listener: (context, state) {
                        if (state is ErrorFetchingSalaryRollouts) {
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
                        return current is FetchingSalaryRollouts ||
                            current is SalaryRolloutsFetched ||
                            current is ErrorFetchingSalaryRollouts;
                      },
                      builder: (context, state) {
                        if (state is FetchingSalaryRollouts) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        if (state is SalaryRolloutsFetched) {
                          return ResponsiveLayout(
                            mobileBody: EmployeeSalaryMobile(
                                salaryRolloutData:
                                    state.fetchSalaryRolloutModel.data),
                            desktopBody: EmployeeSalaryWeb(
                                salaryRolloutData:
                                    state.fetchSalaryRolloutModel.data),
                          );
                        }
                        if (state is ErrorFetchingSalaryRollouts) {
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
                  BlocBuilder<SalaryRolloutBloc, SalaryRolloutStates>(
                      builder: (context, state) {
                    return Container(
                        padding: const EdgeInsets.all(spacingStandard),
                        color: AppColors.white,
                        child: Align(
                            alignment: isMobile
                                ? Alignment.center
                                : Alignment.centerRight,
                            child: PrimaryButton(
                                buttonWidth:
                                    isMobile ? null : kGeneralActionButtonWidth,
                                onPressed: (context
                                        .read<SalaryRolloutBloc>()
                                        .payAll)
                                    ? () {
                                        context.read<SalaryRolloutBloc>().add(
                                            FetchRolloutCalculation(
                                                employeeId: ""));
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return DetailsPopUp(
                                                height: 100,
                                                title: 'Pay All Employees',
                                                actionsBuilder: (commentsKey) {
                                                  return [
                                                    PrimaryButton(
                                                        buttonWidth:
                                                            kGeneralActionButtonWidth,
                                                        backgroundColor:
                                                            AppColors.orange,
                                                        onPressed: () {},
                                                        buttonTitle: "Continue")
                                                  ];
                                                },
                                                details: [
                                                  BlocBuilder<SalaryRolloutBloc,
                                                          SalaryRolloutStates>(
                                                      builder:
                                                          (context, state) {
                                                    if (state
                                                        is SalaryCalculationFetched) {
                                                      return Text(
                                                          'Final Amount: ${state.calculateDeductionModel.data.finalPay}');
                                                    } else {
                                                      return const SizedBox
                                                          .shrink();
                                                    }
                                                  })
                                                ],
                                                commentsRequired: false,
                                                showComments: false,
                                              );
                                            });
                                      }
                                    : null,
                                buttonTitle: "Pay All")));
                  })
                ]));
  }
}
