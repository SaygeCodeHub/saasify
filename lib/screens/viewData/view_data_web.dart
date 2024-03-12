import 'package:flutter/material.dart';
import 'package:saasify/data/models/table_models/column_data_model.dart';
import 'package:saasify/data/models/viewData/view_data_model.dart';
import 'package:saasify/screens/viewData/view_data_screen.dart';
import 'package:saasify/widgets/table/custom_table.dart';
import 'package:saasify/widgets/table/table_cells.dart';

class ViewDataWeb extends StatelessWidget {
  final ViewData viewData;
  final void Function()? onRefresh;
  final void Function(List<int>)? onSelectChanged;

  const ViewDataWeb(
      {super.key,
      required this.viewData,
      this.onSelectChanged,
      this.onRefresh});

  @override
  Widget build(BuildContext context) {
    return viewData.columns == null
        ? Row(
            children: [
              TextButton(onPressed: onRefresh, child: const Text("Refresh")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Back")),
            ],
          )
        : CustomDataTable(
            columnList: List.generate(
                viewData.columns?.length ?? 0,
                (index) => ColumnData(
                    header: viewData.columns?[index].columnTitle ?? "",
                    width: viewData.columns?[index].columnWidth)),
            dataIds: viewData.data.map((e) => e["id"] as int).toList(),
            onSelectChanged: onSelectChanged,
            generateData: (rowIndex) {
              return List.generate(
                  viewData.columns?.length ?? 0,
                  (dataIndex) => _getCellForColumnType(
                      viewData.columns?[dataIndex].dataType,
                      viewData.data[rowIndex]
                              [viewData.columns?[dataIndex].dataKey ?? ""] ??
                          "",
                      getColorFromStatus(
                          viewData.data[rowIndex]["status_color"])));
            });
  }

  DataCell _getCellForColumnType(
      String? type, String? data, Color statusColor) {
    switch (type) {
      case "text":
        return TableText(text: data ?? "");
      case "avatar":
        return const TableAvatar();
      case "status":
        return TableStatusChips(status: data ?? "", color: statusColor);
      default:
        return TableText(text: "Invalid Data Column Type");
    }
  }
}
