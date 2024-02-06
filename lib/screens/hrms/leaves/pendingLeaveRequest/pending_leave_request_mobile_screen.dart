import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/models/leaves/get_all_leaves_model.dart';
import 'package:saasify/data/models/table_models/column_data_model.dart';
import 'package:saasify/screens/hrms/leaves/pendingLeaveRequest/update_status_popup.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/utils/formatters.dart';
import 'package:saasify/widgets/layoutWidgets/background_card_widget.dart';
import 'package:saasify/widgets/table/custom_table.dart';
import 'package:saasify/widgets/table/table_cells.dart';

class PendingLeaveRequestsMobileScreen extends StatelessWidget {
  final List<MyLeaves> pendingLeaves;

  const PendingLeaveRequestsMobileScreen(
      {super.key, required this.pendingLeaves});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        child: BackgroundCardWidget(
            childScreen: Padding(
                padding: const EdgeInsets.all(spacingMedium),
                child: SizedBox(
                  width: 750,
                  child: CustomDataTable(
                      checkboxVisible: false,
                      showRowCheckBox: false,
                      columnList: [
                        ColumnData(header: "Name"),
                        ColumnData(header: "Leave Type"),
                        ColumnData(header: "Start Date"),
                        ColumnData(header: "End Date"),
                        ColumnData(header: "Leave Reason"),
                        ColumnData(header: "Action")
                      ],
                      selectedIds: const [],
                      dataCount: pendingLeaves.length,
                      dataIds: List.generate(
                          pendingLeaves.length, (index) => pendingLeaves),
                      onRowCheckboxChange: (value) {},
                      generateData: (index) => [
                            TableText(
                                text: pendingLeaves[index].name.toString()),
                            TableText(text: pendingLeaves[index].leaveType),
                            TableText(
                                text: formatDate(
                                    pendingLeaves[index].startDate.toString())),
                            TableText(
                                text: formatDate(
                                    pendingLeaves[index].endDate.toString())),
                            TableText(text: pendingLeaves[index].leaveReason),
                            TableButton(
                                title: StringConstants.kTakeAction,
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => UpdateStatusPopup(
                                          isMobile: true,
                                          pendingLeaves: pendingLeaves[index]));
                                })
                          ]),
                ))));
  }
}
