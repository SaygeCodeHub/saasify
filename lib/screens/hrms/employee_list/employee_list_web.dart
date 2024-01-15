import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:saasify/data/models/table_models/column_data_model.dart';
import 'package:saasify/widgets/table/custom_table.dart';
import 'package:saasify/widgets/table/table_cells.dart';

class EmployeeListWeb extends StatelessWidget {
  const EmployeeListWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: CustomDataTable(
          checkboxVisible: false,
          showRowCheckBox: false,
          columnList: [
            ColumnData(header: "", width: 80),
            ColumnData(header: "Employee Name"),
            ColumnData(header: "Employee Designation"),
            ColumnData(header: "Employee Email"),
            ColumnData(header: "Employee Phone"),
            ColumnData(header: "Employee Address")
          ],
          selectedIds: [],
          dataCount: 5,
          dataIds: ["1", "2", "3", "4", "5", "6"],
          onRowCheckboxChange: (value) {},
          generateData: (index) => [
                TableAvatar(),
                TableText(context, text: "Employee Name"),
                TableText(context, text: "Employee Designation"),
                TableText(context, text: "Employee Email"),
                TableText(context, text: "Employee Phone"),
                TableText(context, text: "Employee Address"),
              ]),
    );
  }
}
