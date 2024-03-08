import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/data/models/table_models/column_data_model.dart';

class CustomDataTable extends StatefulWidget {
  final List<ColumnData> columnList;
  final List<int> dataIds;
  final bool checkboxVisible;
  final List<DataCell> Function(int index) generateData;
  final void Function(int index)? rowOnTap;
  final void Function(List<int> selectedIds)? onSelectChanged;

  const CustomDataTable(
      {super.key,
      required this.columnList,
      required this.dataIds,
      required this.generateData,
      this.checkboxVisible = true,
      this.rowOnTap,
      this.onSelectChanged});

  @override
  State<CustomDataTable> createState() => _CustomDataTableState();
}

class _CustomDataTableState extends State<CustomDataTable> {
  List<int> selectedIds = [];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.black12),
      child: DataTable2(
          smRatio: 0.5,
          columnSpacing: 10,
          horizontalMargin: 30,
          dividerThickness: 0.7,
          dataRowHeight: 50,
          headingRowHeight: 50,
          checkboxHorizontalMargin: 30,
          showCheckboxColumn: widget.checkboxVisible,
          headingCheckboxTheme: CheckboxThemeData(
            fillColor: MaterialStateColor.resolveWith((states) =>
                states.contains(MaterialState.selected)
                    ? AppColors.darkBlue
                    : AppColors.white),
          ),
          datarowCheckboxTheme: CheckboxThemeData(
            fillColor: MaterialStateColor.resolveWith((states) =>
                states.contains(MaterialState.selected)
                    ? AppColors.darkBlue
                    : AppColors.white),
          ),
          onSelectAll: (isAllChecked) {
            if (isAllChecked!) {
              setState(() {
                selectedIds = [];
                selectedIds.addAll(widget.dataIds);
              });
            } else {
              setState(() {
                selectedIds = [];
              });
            }
            if (widget.onSelectChanged != null) {
              widget.onSelectChanged!(selectedIds);
            }
          },
          columns: List.generate(
              widget.columnList.length,
              (index) => DataColumn2(
                  fixedWidth: widget.columnList[index].width,
                  label: Text(widget.columnList[index].header,
                      style: Theme.of(context).textTheme.labelLarge!.copyWith(
                          color: AppColors.darkBlue,
                          fontWeight: FontWeight.w700)))),
          rows: List.generate(
              widget.dataIds.length,
              (index) => DataRow2(
                  onSelectChanged: (isSelected) {
                    if (isSelected!) {
                      setState(() {
                        selectedIds.add(widget.dataIds[index]);
                      });
                    } else {
                      setState(() {
                        selectedIds.remove(widget.dataIds[index]);
                      });
                    }
                    if (widget.onSelectChanged != null) {
                      widget.onSelectChanged!(selectedIds);
                    }
                  },
                  selected: selectedIds.contains(widget.dataIds[index]),
                  onTap: (widget.rowOnTap != null)
                      ? () {
                          widget.rowOnTap!(index);
                        }
                      : null,
                  cells: widget.generateData(index)))),
    );
  }
}
