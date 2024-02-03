import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/models/leaves/get_all_leaves_model.dart';
import 'package:saasify/data/models/table_models/column_data_model.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/layoutWidgets/background_card_widget.dart';
import 'package:saasify/widgets/table/custom_table.dart';
import 'package:saasify/widgets/table/table_cells.dart';
class MyLeavesTable extends StatelessWidget {
  final GetMyLeavesData myLeavesData;
  const MyLeavesTable({super.key, required this.myLeavesData});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 1,
        child: BackgroundCardWidget(
            childScreen: Padding(
              padding: const EdgeInsets.all(spacingMedium),
              child: CustomDataTable(
                  checkboxVisible: false,
                  showRowCheckBox: false,
                  columnList: [
                    ColumnData(header: StringConstants.kLeaveType),
                    ColumnData(header: StringConstants.kStartDate),
                    ColumnData(header: StringConstants.kEndDate),
                    ColumnData(header: StringConstants.kLeaveReason),
                    ColumnData(header: StringConstants.kApprovers),
                    ColumnData(header: StringConstants.kLeaveStatus)
                  ],
                  selectedIds: const [],
                  dataCount: myLeavesData.myLeaves.length,
                  dataIds: List.generate(myLeavesData.myLeaves.length,
                          (index) => myLeavesData.myLeaves),
                  onRowCheckboxChange: (value) {},
                  generateData: (index) => [
                    TableText(
                        text: myLeavesData.myLeaves[index].leaveType
                            .toString()),
                    TableText(
                        text: DateFormat("yyyy-MM-dd").format(
                            myLeavesData.myLeaves[index].startDate)),
                    TableText(
                        text: DateFormat("yyyy-MM-dd").format(
                            myLeavesData.myLeaves[index].endDate)),
                    TableText(
                        text:
                        myLeavesData.myLeaves[index].leaveReason),
                    TableText(
                        text: myLeavesData.myLeaves[index].approvers
                            .toString()
                            .replaceAll("[", "")
                            .replaceAll("]", "")),
                    TableText(
                        text:
                        myLeavesData.myLeaves[index].leaveStatus)
                  ]),
            )));
  }
}
