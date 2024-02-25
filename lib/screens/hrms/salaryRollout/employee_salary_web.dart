import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/employee/employee_bloc.dart';
import 'package:saasify/bloc/employee/employee_event.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/models/employee/get_all_employees_model.dart';
import 'package:saasify/data/models/table_models/column_data_model.dart';
import 'package:saasify/widgets/layoutWidgets/background_card_widget.dart';
import 'package:saasify/widgets/table/custom_table.dart';
import 'package:saasify/widgets/table/table_cells.dart';

class EmployeeSalaryWeb extends StatelessWidget {
  final List<EmployeeListData> employees;

  const EmployeeSalaryWeb({super.key, required this.employees});

  @override
  Widget build(BuildContext context) {
    return BackgroundCardWidget(
      childScreen: Padding(
        padding: const EdgeInsets.all(spacingMedium),
        child: CustomDataTable(
            checkboxVisible: false,
            showRowCheckBox: false,
            rowOnTap: (index) {
              context
                  .read<EmployeeBloc>()
                  .add(GetEmployee(employeeId: employees[index].employeeId));
            },
            columnList: [
              ColumnData(header: "", width: 100),
              ColumnData(header: "Name"),
              ColumnData(header: "Employee ID"),
              ColumnData(header: "Email"),
              ColumnData(header: "Payroll"),
              ColumnData(header: "Actions")
            ],
            selectedIds: const [],
            dataCount: employees.length,
            dataIds: List.generate(
                employees.length, (index) => employees[index].employeeId),
            onRowCheckboxChange: (value) {},
            generateData: (index) => [
                  const TableAvatar(),
                  TableText(text: employees[index].name),
                  TableText(text: employees[index].employeeId.toString()),
                  TableText(text: employees[index].userEmail),
                  TableText(text: employees[index].payroll.toString()),
                  TableButton(title: "Rollout", onPressed: () {})
                ]),
      ),
    );
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