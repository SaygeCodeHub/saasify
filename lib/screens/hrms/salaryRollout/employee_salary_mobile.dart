import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/employee/employee_bloc.dart';
import 'package:saasify/bloc/employee/employee_event.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/employee/get_all_employees_model.dart';

class EmployeeSalaryMobile extends StatelessWidget {
  final List<EmployeeListData> employees;

  const EmployeeSalaryMobile({super.key, required this.employees});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.separated(
              itemCount: employees.length,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                return Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.lighterBlack),
                        borderRadius: BorderRadius.circular(kCardRadius)),
                    child: ListTile(
                        onTap: () {
                          context.read<EmployeeBloc>().add(GetEmployee(
                              employeeId: employees[index].employeeId));
                        },
                        leading: const Icon(Icons.person,
                            color: AppColors.darkBlue, size: kAvatarRadius),
                        trailing: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                                backgroundColor: AppColors.orange,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5))),
                            child: const Text('Rollout',
                                style: TextStyle(
                                    color: AppColors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12))),
                        title: Text(employees[index].name,
                            style:
                                Theme.of(context).textTheme.userNameTextStyle),
                        subtitle: Row(
                          children: [
                            Text('Employee ID - ${employees[index].employeeId}',
                                style: Theme.of(context)
                                    .textTheme
                                    .statusTextStyle
                                    .copyWith(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 10)),
                            const SizedBox(width: 10),
                            Text("Payroll - ${employees[index].payroll}",
                                style: Theme.of(context)
                                    .textTheme
                                    .statusTextStyle
                                    .copyWith(
                                        fontWeight: FontWeight.normal,
                                        fontSize: 10)),
                          ],
                        )));
              }),
        ),
      ],
    );
  }
}
