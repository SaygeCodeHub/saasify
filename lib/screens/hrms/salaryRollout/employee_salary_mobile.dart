import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/salary_rollouts/salary_rollout_event.dart';
import 'package:saasify/bloc/salary_rollouts/salary_rollout_state.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_theme.dart';

import '../../../bloc/salary_rollouts/salary_rollout_bloc.dart';
import '../../../data/models/salary_rollouts/fetch_salary_rollout_model.dart';
import '../../../widgets/actions/detailsPopUp.dart';
import '../../../widgets/buttons/primary_button.dart';

class EmployeeSalaryMobile extends StatelessWidget {
  final SalaryRolloutData salaryRolloutData;

  const EmployeeSalaryMobile({super.key, required this.salaryRolloutData});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Expanded(
          child: ListView.separated(
              itemCount: salaryRolloutData.salaryRollout.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                return Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.lighterBlack),
                        borderRadius: BorderRadius.circular(kCardRadius)),
                    child: ListTile(
                        onTap: () {},
                        leading: const Icon(Icons.person,
                            color: AppColors.darkBlue, size: kAvatarRadius),
                        trailing: TextButton(
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
                                            height: 100,
                                            title: 'Pay Amount',
                                            actionsBuilder: (commentsKey) {
                                              return [
                                                PrimaryButton(
                                                    buttonWidth:
                                                        kGeneralActionButtonWidth,
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
                                            showComments: false,
                                          );
                                        });
                                  }
                                : null,
                            style: TextButton.styleFrom(
                                backgroundColor:
                                    (salaryRolloutData.salaryRollout[index].isRolledOut !=
                                            true)
                                        ? AppColors.orange
                                        : Colors.grey.shade300,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5))),
                            child: const Text('Pay',
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12))),
                        title: Text(salaryRolloutData.salaryRollout[index].name,
                            style: Theme.of(context).textTheme.userNameTextStyle),
                        subtitle: Row(children: [
                          Text(
                              'Employee ID - ${salaryRolloutData.salaryRollout[index].employeeId}',
                              style: Theme.of(context)
                                  .textTheme
                                  .statusTextStyle
                                  .copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 10)),
                          const SizedBox(width: 10),
                          Text(
                              "Payroll - ${salaryRolloutData.salaryRollout[index].payroll}",
                              style: Theme.of(context)
                                  .textTheme
                                  .statusTextStyle
                                  .copyWith(
                                      fontWeight: FontWeight.normal,
                                      fontSize: 10))
                        ])));
              }))
    ]);
  }
}
