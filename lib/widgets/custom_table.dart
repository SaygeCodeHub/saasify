import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:saasify/configs/app_color.dart';
import 'package:saasify/configs/app_theme.dart';

class CustomDataTable extends StatelessWidget {
  final List<String> columnList;
  final List selectedIds;
  final int dataCount;
  final List dataIds;
  final List<DataCell> Function(int index) generateData;
  final void Function()? onHeaderCheckboxChange;
  final void Function(int index) onRowCheckboxChange;

  const CustomDataTable(
      {Key? key,
      required this.columnList,
      required this.selectedIds,
      this.onHeaderCheckboxChange,
      required this.dataCount,
      required this.dataIds,
      required this.onRowCheckboxChange,
      required this.generateData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: DataTable2(
            smRatio: 0.5,
            columnSpacing: 0,
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
                                  child: Icon(
                                      (selectedIds.isEmpty)
                                          ? Icons.check_box_outline_blank
                                          : (selectedIds.length < dataCount)
                                              ? Icons
                                                  .indeterminate_check_box_outlined
                                              : Icons.check_box,
                                      color: (selectedIds.isNotEmpty)
                                          ? AppColor.saasifyLightDeepBlue
                                          : AppColor.saasifyLightDeepBlue)))))
                ] +
                List.generate(
                    columnList.length,
                    (index) => DataColumn2(
                        label: Text(columnList[index],
                            style: Theme.of(context)
                                .textTheme
                                .xTiniest
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
                                child: Icon(
                                    (selectedIds.contains(dataIds[index]))
                                        ? Icons.check_box
                                        : Icons.check_box_outline_blank_rounded,
                                    color:
                                        (selectedIds.contains(dataIds[index]))
                                            ? AppColor.saasifyLightDeepBlue
                                            : AppColor.saasifyLightDeepBlue)),
                          ))
                        ] +
                        generateData(index)))));
  }
}
