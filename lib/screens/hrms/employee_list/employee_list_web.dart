import 'package:flutter/material.dart';
import 'package:saasify/data/models/table_models/column_data_model.dart';
import 'package:saasify/widgets/layoutWidgets/background_card_widget.dart';
import 'package:saasify/widgets/table/custom_table.dart';
import 'package:saasify/widgets/table/table_cells.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/employee/get_all_employees_model.dart';

class EmployeeListWeb extends StatelessWidget {
  final List<EmployeeDatum> employees;

  const EmployeeListWeb({super.key, required this.employees});

  @override
  Widget build(BuildContext context) {
    return BackgroundCardWidget(
      childScreen: Padding(
        padding: const EdgeInsets.all(spacingMedium),
        child: CustomDataTable(
            checkboxVisible: false,
            showRowCheckBox: false,
            columnList: [
              ColumnData(header: "", width: 100),
              ColumnData(header: "Name"),
              ColumnData(header: "Employee ID"),
              ColumnData(header: "Email"),
              ColumnData(header: "Phone"),
              ColumnData(header: "Designation"),
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
                  TableText(text: employees[index].userContact ?? '-'),
                  TableText(text: employees[index].designations[0].toString()),
                ]),
      ),
    );
  }
}
