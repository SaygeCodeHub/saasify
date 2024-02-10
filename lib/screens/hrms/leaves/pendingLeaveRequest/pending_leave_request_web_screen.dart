import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/leaves/get_all_leaves_model.dart';
import 'package:saasify/data/models/table_models/column_data_model.dart';
import 'package:saasify/screens/hrms/leaves/widgets/leave_details_popup.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/utils/formatters.dart';
import 'package:saasify/widgets/layoutWidgets/background_card_widget.dart';
import 'package:saasify/widgets/table/custom_table.dart';
import 'package:saasify/widgets/table/table_cells.dart';

class PendingLeaveRequestsWebScreen extends StatelessWidget {
  final List<MyLeaves> pendingLeaves;

  const PendingLeaveRequestsWebScreen({super.key, required this.pendingLeaves});

  @override
  Widget build(BuildContext context) {
    return BackgroundCardWidget(
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
              ColumnData(header: StringConstants.kAction)
            ],
            selectedIds: const [],
            dataCount: pendingLeaves.length,
            dataIds:
                List.generate(pendingLeaves.length, (index) => pendingLeaves),
            onRowCheckboxChange: (value) {},
            generateData: (index) => [
                  TableText(text: pendingLeaves[index].name.toString()),
                  TableText(text: pendingLeaves[index].leaveType),
                  TableText(
                      text: formatDate(
                          pendingLeaves[index].startDate.toString())),
                  TableText(
                      text:
                          formatDate(pendingLeaves[index].endDate.toString())),
                  TableText(text: pendingLeaves[index].leaveReason),
                  TableButton(
                      title: StringConstants.kTakeAction,
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
                                  leaves: pendingLeaves[index],
                                  isPending: true,
                                ));
                      }),
                ]),
      ),
    );
  }
}
