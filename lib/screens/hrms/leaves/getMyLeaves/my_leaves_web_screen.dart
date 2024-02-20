import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/leaves/get_all_leaves_model.dart';
import 'package:saasify/data/models/table_models/column_data_model.dart';
import 'package:saasify/screens/hrms/leaves/widgets/leave_details_popup.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/layoutWidgets/background_card_widget.dart';
import 'package:saasify/widgets/table/custom_table.dart';
import 'package:saasify/widgets/table/table_cells.dart';
import 'package:saasify/utils/formatters.dart';

class MyLeavesWebScreen extends StatelessWidget {
  final List<MyLeaves> myLeaves;

  const MyLeavesWebScreen({super.key, required this.myLeaves});

  @override
  Widget build(BuildContext context) {
    return BackgroundCardWidget(
        childScreen: Padding(
            padding: const EdgeInsets.all(spacingMedium),
            child: CustomDataTable(
                checkboxVisible: false,
                showRowCheckBox: false,
                columnList: [
                  ColumnData(header: StringConstants.kLeaveType),
                  ColumnData(header: StringConstants.kStartDate),
                  ColumnData(header: StringConstants.kEndDate),
                  ColumnData(header: StringConstants.kApprovers),
                  ColumnData(header: StringConstants.kLeaveStatus),
                  ColumnData(header: StringConstants.kShowDetails)
                ],
                selectedIds: const [],
                dataCount: myLeaves.length,
                dataIds: List.generate(myLeaves.length, (index) => myLeaves),
                onRowCheckboxChange: (value) {},
                generateData: (index) => [
                      TableText(text: myLeaves[index].leaveType),
                      TableText(
                          text:
                              formatDate(myLeaves[index].startDate.toString())),
                      TableText(
                          text: formatDate(myLeaves[index].endDate.toString())),
                      TableText(text: myLeaves[index].approvers.join(", ")),
                      TableStatusChips(
                          status: myLeaves[index].leaveStatus.toString(),
                          color: getColorFromStatus(
                              myLeaves[index].leaveStatus.toString())),
                      TableButton(
                          title: StringConstants.kShowDetails,
                          textStyle: Theme.of(context)
                              .textTheme
                              .cardMobileHeadingTextStyle
                              .copyWith(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.normal),
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (context) => LeaveDetailsPopup(
                                    isMobile: false,
                                    leaves: myLeaves[index],
                                    isFromPending: false));
                          })
                    ])));
  }
}
