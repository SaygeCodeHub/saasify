import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/employee/employee_bloc.dart';
import 'package:saasify/bloc/employee/employee_event.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/models/table_models/column_data_model.dart';
import 'package:saasify/widgets/layoutWidgets/background_card_widget.dart';
import 'package:saasify/widgets/table/custom_table.dart';
import 'package:saasify/widgets/table/table_cells.dart';

import '../../../bloc/salary_rollouts/salary_rollout_bloc.dart';
import '../../../bloc/salary_rollouts/salary_rollout_event.dart';
import '../../../bloc/salary_rollouts/salary_rollout_state.dart';
import '../../../configs/app_dimensions.dart';
import '../../../data/models/salary_rollouts/fetch_salary_rollout_model.dart';
import '../../../widgets/actions/detailsPopUp.dart';
import '../../../widgets/buttons/primary_button.dart';

class EmployeeSalaryWeb extends StatelessWidget {
  final SalaryRolloutData salaryRolloutData;

  const EmployeeSalaryWeb({super.key, required this.salaryRolloutData});

  @override
  Widget build(BuildContext context) {
    return BackgroundCardWidget(
        childScreen: Padding(
            padding: const EdgeInsets.all(spacingMedium),
            child: CustomDataTable(
                checkboxVisible: false,
                showRowCheckBox: false,
                rowOnTap: (index) {
                  context.read<EmployeeBloc>().add(GetEmployee(
                      employeeId:
                          salaryRolloutData.salaryRollout[index].employeeId));
                },
                columnList: [
                  ColumnData(header: "", width: 100),
                  ColumnData(header: "Name"),
                  ColumnData(header: "Employee ID"),
                  ColumnData(header: "Email"),
                  ColumnData(header: "Payroll"),
                  ColumnData(header: "")
                ],
                selectedIds: const [],
                dataCount: salaryRolloutData.salaryRollout.length,
                dataIds: List.generate(
                    salaryRolloutData.salaryRollout.length,
                    (index) =>
                        salaryRolloutData.salaryRollout[index].employeeId),
                onRowCheckboxChange: (value) {},
                generateData: (index) => [
                      const TableAvatar(),
                      TableText(
                          text: salaryRolloutData.salaryRollout[index].name),
                      TableText(
                          text: salaryRolloutData
                              .salaryRollout[index].employeeId
                              .toString()),
                      TableText(
                          text:
                              salaryRolloutData.salaryRollout[index].userEmail),
                      TableText(
                          text: salaryRolloutData.salaryRollout[index].payroll
                              .toString()),
                      TableButton(
                          title: "Pay",
                          onPressed: (salaryRolloutData
                                      .salaryRollout[index].isRolledOut !=
                                  true)
                              ? () {
                                  context.read<SalaryRolloutBloc>().add(
                                      FetchRolloutCalculation(
                                          employeeId: salaryRolloutData
                                              .salaryRollout[index].employeeId
                                              .toString()));
                                  showDialog(
                                      context: context,
                                      builder: (context) {
                                        return DetailsPopUp(
                                            height: 150,
                                            width: 300,
                                            title: 'Pay Amount',
                                            actionsBuilder: (commentsKey) {
                                              return [
                                                PrimaryButton(
                                                    buttonWidth:
                                                        kErrorPopButtonWidth,
                                                    backgroundColor:
                                                        AppColors.orange,
                                                    onPressed: () {
                                                      Navigator.pop(context);
                                                      context
                                                          .read<
                                                              SalaryRolloutBloc>()
                                                          .add(RollOutIndividualSalary(
                                                              employeeId: salaryRolloutData
                                                                  .salaryRollout[
                                                                      index]
                                                                  .employeeId
                                                                  .toString()));
                                                    },
                                                    buttonTitle: "Continue")
                                              ];
                                            },
                                            details: [
                                              Text(
                                                  'Employee: ${salaryRolloutData.salaryRollout[index].name}'),
                                              BlocBuilder<SalaryRolloutBloc,
                                                      SalaryRolloutStates>(
                                                  builder: (context, state) {
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
                                            showComments: false);
                                      });
                                }
                              : null)
                    ])));
  }

  Color designationColor(String designation) {
    switch (designation) {
      case 'OWNER':
        return AppColors.successGreen;
      case 'MANAGER':
        return AppColors.orange;
      default:
        return AppColors.lightBlue;
    }
  }
}
