import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

import '../configs/app_colors.dart';

class CustomDataTable extends StatelessWidget {
  final List<String> columnList;
  final List selectedIds;
  final int dataCount;
  final List dataIds;
  final bool checkboxVisible;
  final bool showRowCheckBox;
  final List<DataCell> Function(int index) generateData;
  final void Function()? onHeaderCheckboxChange;
  final void Function(int index) onRowCheckboxChange;

  const CustomDataTable(
      {super.key,
      required this.columnList,
      required this.selectedIds,
      this.onHeaderCheckboxChange,
      required this.dataCount,
      required this.dataIds,
      required this.onRowCheckboxChange,
      required this.generateData,
      this.checkboxVisible = true,
      this.showRowCheckBox = true});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: DataTable2(
            smRatio: 0.5,
            columnSpacing: 15,
            horizontalMargin: 0,
            headingRowHeight: 50,
            columns: [
                  DataColumn2(
                      size: ColumnSize.S,
                      label: Center(
                          child: Visibility(
                              visible: dataCount > 0,
                              child: InkWell(
                                  onTap: onHeaderCheckboxChange,
                                  child: Visibility(
                                    visible: checkboxVisible,
                                    child: Icon(
                                        (selectedIds.isEmpty)
                                            ? Icons.check_box_outline_blank
                                            : (selectedIds.length < dataCount)
                                                ? Icons
                                                    .indeterminate_check_box_outlined
                                                : Icons.check_box,
                                        color: (selectedIds.isNotEmpty)
                                            ? AppColors.blue
                                            : AppColors.blue),
                                  )))))
                ] +
                List.generate(
                    columnList.length,
                    (index) => DataColumn2(
                        label: Text(columnList[index],
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(fontWeight: FontWeight.w600)))),
            rows: List.generate(
                dataCount,
                (index) => DataRow(
                    cells: [
                          DataCell(Align(
                            alignment: Alignment.center,
                            child: InkWell(
                                onTap: () {
                                  onRowCheckboxChange(index);
                                },
                                child: Visibility(
                                  visible: showRowCheckBox,
                                  child: Icon(
                                      (selectedIds.contains(dataIds[index]))
                                          ? Icons.check_box
                                          : Icons
                                              .check_box_outline_blank_rounded,
                                      color:
                                          (selectedIds.contains(dataIds[index]))
                                              ? AppColors.blue
                                              : AppColors.blue),
                                )),
                          ))
                        ] +
                        generateData(index)))));
  }
}
