import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/data/models/table_models/column_data_model.dart';

class CustomDataTable extends StatelessWidget {
  final List<ColumnData> columnList;
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
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.black12),
      child: DataTable2(
          smRatio: 0.5,
          columnSpacing: 10,
          horizontalMargin: 0,
          dividerThickness: 0.7,
          dataRowHeight: 55,
          headingRowHeight: 50,
          columns: ((checkboxVisible)
                  ? [
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
                                                : (selectedIds.length <
                                                        dataCount)
                                                    ? Icons
                                                        .indeterminate_check_box_outlined
                                                    : Icons.check_box,
                                            color: (selectedIds.isNotEmpty)
                                                ? AppColors.darkBlue
                                                : AppColors.darkBlue),
                                      )))))
                    ]
                  : <DataColumn2>[]) +
              List.generate(
                  columnList.length,
                  (index) => DataColumn2(
                      fixedWidth: columnList[index].width,
                      label: Text(columnList[index].header,
                          style: Theme.of(context)
                              .textTheme
                              .labelLarge!
                              .copyWith(
                                  color: AppColors.darkBlue,
                                  fontWeight: FontWeight.w700)))),
          rows: List.generate(
              dataCount,
              (index) => DataRow(
                  cells: ((checkboxVisible)
                          ? [
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
                                          color: (selectedIds
                                                  .contains(dataIds[index]))
                                              ? AppColors.darkBlue
                                              : AppColors.darkBlue),
                                    )),
                              ))
                            ]
                          : <DataCell>[]) +
                      generateData(index)))),
    );
  }
}
