import 'package:flutter/material.dart';
import 'package:saasify/data/models/table_models/column_data_model.dart';
import 'package:saasify/data/models/viewData/view_data_model.dart';
import 'package:saasify/screens/viewData/view_data_screen.dart';
import 'package:saasify/widgets/table/custom_table.dart';
import 'package:saasify/widgets/table/table_cells.dart';

class ViewDataWeb extends StatelessWidget {
  final ViewData viewData;

  const ViewDataWeb({super.key, required this.viewData});

  @override
  Widget build(BuildContext context) {
    return CustomDataTable(
        columnList: List.generate(
            viewData.columns.length,
            (index) => ColumnData(
                header: viewData.columns[index].columnTitle,
                width: viewData.columns[index].columnWidth)),
        dataIds: viewData.data.map((e) => e["id"] as int).toList(),
        generateData: (rowIndex) {
          return List.generate(
              viewData.columns.length,
              (dataIndex) => _getCellForColumnType(
                  viewData.columns[dataIndex].dataType,
                  viewData.data[rowIndex][viewData.columns[dataIndex].dataKey],
                  getColorFromStatus(
                      viewData.statusTypes,
                      viewData.data[rowIndex]
                          [viewData.columns[dataIndex].dataKey])));
        });
  }

  DataCell _getCellForColumnType(type, data, Color statusColor) {
    switch (type) {
      case "text":
        return TableText(text: data);
      case "avatar":
        return const TableAvatar();
      case "status":
        return TableStatusChips(
            status: data, color: Color(int.parse("0xFF$statusColor")));
      default:
        return TableText(text: "Invalid Data Column Type");
    }
  }
}
