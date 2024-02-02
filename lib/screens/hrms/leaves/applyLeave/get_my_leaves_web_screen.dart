import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/models/leaves/get_my_leaves_model.dart';
import 'package:saasify/data/models/table_models/column_data_model.dart';
import 'package:saasify/widgets/layoutWidgets/background_card_widget.dart';
import 'package:saasify/widgets/table/custom_table.dart';
import 'package:saasify/widgets/table/table_cells.dart';

class GetMyLeavesWebScreen extends StatelessWidget {
  const GetMyLeavesWebScreen({super.key, required this.myLeavesData});
  final List <GetMyLeavesData> myLeavesData;
  @override
  Widget build(BuildContext context) {
    return BackgroundCardWidget(
      childScreen: Padding(
        padding: const EdgeInsets.all(spacingMedium),
        child: CustomDataTable(
            checkboxVisible: false,
            showRowCheckBox: false,
            columnList: [
              ColumnData(header: "Leave Type", width: 200),
              ColumnData(header: "Start Date", width: 250),
              ColumnData(header: "End Date"),
              ColumnData(header: "Leave Reason", width: 350),
              ColumnData(header: "Approver"),
              ColumnData(header: "Leave Status")
            ],
            selectedIds: const [],
            dataCount: myLeavesData.length,
            dataIds:[myLeavesData.indexed],
            onRowCheckboxChange: (value) {},
            generateData: (index) => [
                  TableText(text: myLeavesData[index].leaveType),
                  TableText(text: myLeavesData[index].startDate.toString()),
                  TableText(text: myLeavesData[index].endDate.toString()),
                  TableText(text: myLeavesData[index].leaveReason),
                  TableText(text: myLeavesData[index].approvers[index]),
                  TableText(text: myLeavesData[index].leaveStatus),
                ]),
      ),
    );
  }
}
