import 'package:flutter/material.dart';
import 'package:saasify/widgets/custom_table.dart';

class EmployeeListWeb extends StatelessWidget {
  const EmployeeListWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomDataTable(
        columnList: [],
        selectedIds: [],
        dataCount: 0,
        dataIds: [],
        onRowCheckboxChange: (value) {},
        generateData: (index) => []);
  }
}