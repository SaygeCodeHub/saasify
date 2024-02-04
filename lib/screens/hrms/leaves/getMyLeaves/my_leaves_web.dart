import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/models/leaves/get_all_leaves.dart';
import 'package:saasify/data/models/table_models/column_data_model.dart';
import 'package:saasify/widgets/layoutWidgets/background_card_widget.dart';
import 'package:saasify/widgets/table/custom_table.dart';
import 'package:saasify/widgets/table/table_cells.dart';

class MyLeavesWeb extends StatelessWidget {
  final List<MyLeaves> myLeaves;

  const MyLeavesWeb({super.key, required this.myLeaves});

  @override
  Widget build(BuildContext context) {
    return BackgroundCardWidget(
      childScreen: Padding(
        padding: const EdgeInsets.all(spacingMedium),
        child: CustomDataTable(
            checkboxVisible: false,
            showRowCheckBox: false,
            columnList: [
              ColumnData(header: "Leave Type"),
              ColumnData(header: "Start Date"),
              ColumnData(header: "End Date"),
              ColumnData(header: "Approvers"),
              ColumnData(header: "Status"),
              ColumnData(header: "Comment"),
            ],
            selectedIds: const [],
            dataCount: myLeaves.length,
            dataIds: const ["1", "2", "3", "4", "5", "6"],
            onRowCheckboxChange: (value) {},
            generateData: (index) => [
                  TableText(text: myLeaves[index].leaveType),
                  TableText(
                      text: formatDate(myLeaves[index].startDate.toString())),
                  TableText(
                      text: formatDate(myLeaves[index].endDate.toString())),
                  TableText(text: myLeaves[index].approvers.join(", ")),
                  TableText(text: myLeaves[index].leaveStatus),
                  TableText(text: 'Some comment by approver'),
                ]),
      ),
    );
  }
}

String formatDate(String inputDate) {
  DateTime dateTime = DateTime.parse(inputDate);
  String formattedDate = DateFormat('dd/MM/yyyy').format(dateTime);
  return formattedDate;
}
