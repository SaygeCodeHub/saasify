import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/models/leaves/get_all_leaves_model.dart';
import 'package:saasify/data/models/table_models/column_data_model.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/layoutWidgets/background_card_widget.dart';
import 'package:saasify/widgets/table/custom_table.dart';
import 'package:saasify/widgets/table/table_cells.dart';
import 'package:saasify/widgets/text/textfield_label_widget.dart';

class GetMyLeavesWebScreen extends StatelessWidget {
  const GetMyLeavesWebScreen({super.key, required this.myLeavesData});
  final GetMyLeavesData myLeavesData;

  @override
  Widget build(BuildContext context) {
    log("asdfghjkl;${myLeavesData.toJson()}");
    return Padding(
      padding: const EdgeInsets.all(spacingMedium),
      child: SizedBox(
        height: 150,
        child: BackgroundCardWidget(
          childScreen: Padding(
            padding: const EdgeInsets.all(spacingMedium),
            child: CustomDataTable(
                checkboxVisible: false,
                showRowCheckBox: false,
                columnList: [
                  ColumnData(header: "Name"),
                  ColumnData(header: "Leave Type"),
                  ColumnData(header: "Start Date"),
                  ColumnData(header: "End Date"),
                  ColumnData(header: "Leave Reason"),
                  ColumnData(header: "Approver"),
                  ColumnData(header: "Leave Status")
                ],
                selectedIds: const [],
                dataCount: myLeavesData.myLeaves.length,
                dataIds:List.generate(myLeavesData.myLeaves.length, (index) => myLeavesData.myLeaves),
                onRowCheckboxChange: (value) {},
                generateData: (index) => [
                  TableText(text: myLeavesData.myLeaves[index].name),
                  TableText(text: myLeavesData.myLeaves[index].leaveType.toString()),
                  TableText(text: myLeavesData.myLeaves[index].startDate.toString()),
                  TableText(text: myLeavesData.myLeaves[index].endDate.toString()),
                  TableText(text: myLeavesData.myLeaves[index].leaveReason),
                  TableText(text: myLeavesData.myLeaves[index].approvers.toString()),
                  TableText(text: myLeavesData.myLeaves[index].leaveStatus),
                ]),
          ),
        ),
      ),
      // child: Column(
      //   mainAxisSize: MainAxisSize.min,
      //   children: [
      //     SizedBox(
      //       height: 150,
      //       child: Column(
      //         children: [
      //           Title(color: AppColors.black, child: const Text("Pending Leaves",)),
      //           BackgroundCardWidget(
      //             childScreen: Padding(
      //               padding: const EdgeInsets.all(spacingMedium),
      //               child: CustomDataTable(
      //                   checkboxVisible: false,
      //                   showRowCheckBox: false,
      //                   columnList: [
      //                     ColumnData(header: "Name", width: 50),
      //                     ColumnData(header: "Leave Type", width: 50),
      //                     ColumnData(header: "Start Date", width: 50),
      //                     ColumnData(header: "End Date", width: 50),
      //                     ColumnData(header: "Leave Reason", width: 150),
      //                     ColumnData(header: "Approver", width: 50)
      //                   ],
      //                   selectedIds: const [],
      //                   dataCount: myLeavesData.pendingLeaves.length,
      //                   dataIds:List.generate(myLeavesData.pendingLeaves.length, (index) => myLeavesData.pendingLeaves),
      //                   onRowCheckboxChange: (value) {},
      //                   generateData: (index) => [
      //                     TableText(text: myLeavesData.pendingLeaves[index].leaveType),
      //                     TableText(text: myLeavesData.pendingLeaves[index].startDate.toString()),
      //                     TableText(text: myLeavesData.pendingLeaves[index].endDate.toString()),
      //                     TableText(text: myLeavesData.pendingLeaves[index].leaveReason),
      //                     TableText(text: myLeavesData.pendingLeaves[index].approvers[index]),
      //                   ]),
      //             ),
      //           )
      //         ],
      //       ),
      //     ),
      //     SizedBox(
      //       height: 150,
      //       child: BackgroundCardWidget(
      //         childScreen: Padding(
      //           padding: const EdgeInsets.all(spacingMedium),
      //           child: CustomDataTable(
      //               checkboxVisible: false,
      //               showRowCheckBox: false,
      //               columnList: [
      //                 ColumnData(header: "Name", width: 200),
      //                 ColumnData(header: "Leave Type", width: 200),
      //                 ColumnData(header: "Start Date", width: 250),
      //                 ColumnData(header: "End Date"),
      //                 ColumnData(header: "Leave Reason", width: 350),
      //                 ColumnData(header: "Approver"),
      //                 ColumnData(header: "Leave Status")
      //               ],
      //               selectedIds: const [],
      //               dataCount: myLeavesData.myLeaves.length,
      //               dataIds:List.generate(myLeavesData.myLeaves.length, (index) => myLeavesData.myLeaves),
      //               onRowCheckboxChange: (value) {},
      //               generateData: (index) => [
      //                 TableText(text: myLeavesData.myLeaves[index].leaveType),
      //                 TableText(text: myLeavesData.myLeaves[index].startDate.toString()),
      //                 TableText(text: myLeavesData.myLeaves[index].endDate.toString()),
      //                 TableText(text: myLeavesData.myLeaves[index].leaveReason),
      //                 TableText(text: myLeavesData.myLeaves[index].approvers[index]),
      //                 TableText(text: myLeavesData.myLeaves[index].leaveStatus),
      //               ]),
      //         ),
      //       ),
      //     ),
      //   ],
      // ),
    );
  }
}
