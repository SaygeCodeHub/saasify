import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/models/leaves/get_all_leaves_model.dart';
import 'package:saasify/data/models/table_models/column_data_model.dart';
import 'package:saasify/screens/hrms/leaves/getAllLeaves/update_status_popup.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/layoutWidgets/background_card_widget.dart';
import 'package:saasify/widgets/table/custom_table.dart';
import 'package:saasify/widgets/table/table_cells.dart';

class PendingLeavesTable extends StatelessWidget {
  final GetMyLeavesData myLeavesData;

  const PendingLeavesTable({super.key, required this.myLeavesData});

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
                ColumnData(header: StringConstants.kApplicantName),
                ColumnData(header: StringConstants.kLeaveType),
                ColumnData(header: StringConstants.kStartDate),
                ColumnData(header: StringConstants.kEndDate),
                ColumnData(header: StringConstants.kLeaveReason),
                ColumnData(header: StringConstants.kApprovers),
                ColumnData(header: StringConstants.kUpdateStatus),
              ],
              selectedIds: const [],
              dataCount: myLeavesData.pendingLeaves.length,
              dataIds: List.generate(myLeavesData.pendingLeaves.length,
                  (index) => myLeavesData.pendingLeaves),
              onRowCheckboxChange: (value) {},
              generateData: (index) => [
                    TableText(text: myLeavesData.pendingLeaves[index].name),
                    TableText(
                        text: myLeavesData.pendingLeaves[index].leaveType
                            .toString()),
                    TableText(
                        text: DateFormat("yyyy-MM-dd").format(
                            myLeavesData.pendingLeaves[index].startDate)),
                    TableText(
                        text: DateFormat("yyyy-MM-dd")
                            .format(myLeavesData.pendingLeaves[index].endDate)),
                    TableText(
                        text: myLeavesData.pendingLeaves[index].leaveReason),
                    TableText(
                        text: myLeavesData.pendingLeaves[index].approvers
                            .toString()
                            .replaceAll("[", "")
                            .replaceAll(",", "\n")
                            .replaceAll("]", "")),
                    TableButton(
                        title: StringConstants.kUpdateStatus,
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) => UpdateStatusPopup(
                                    isMobile: false,
                                    pendingLeaves:
                                        myLeavesData.pendingLeaves[index],
                                  ));
                        }),
                  ]),
        ),
      ),
    );
  }
}
