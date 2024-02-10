import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/table_models/column_data_model.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/utils/formatters.dart';
import 'package:saasify/widgets/layoutWidgets/background_card_widget.dart';
import 'package:saasify/widgets/table/custom_table.dart';
import 'package:saasify/widgets/table/table_cells.dart';

import '../../../data/models/timesheet/timesheet_attendance_history_model.dart';

class TimeSheetWebScreen extends StatelessWidget {
  final List<TimesheetData> timesheetData;

  const TimeSheetWebScreen({super.key, required this.timesheetData});

  @override
  Widget build(BuildContext context) {
    return BackgroundCardWidget(
        childScreen: Padding(
            padding: const EdgeInsets.all(spacingMedium),
            child: CustomDataTable(
                checkboxVisible: false,
                showRowCheckBox: false,
                columnList: [
                  ColumnData(header: StringConstants.kDate),
                  ColumnData(header: StringConstants.kCheckIn),
                  ColumnData(header: StringConstants.kCheckOut),
                  ColumnData(header: StringConstants.kRegularise)
                ],
                selectedIds: const [],
                dataCount: timesheetData.length,
                dataIds: List.generate(timesheetData.length, (index) => timesheetData),
                onRowCheckboxChange: (value) {},
                generateData: (index) => [
                      TableText(
                          text: timesheetData[index].date == null
                              ? "--"
                              : formatDate(
                                  timesheetData[index].date.toString())),
                      TableText(
                          text: timesheetData[index].checkIn == null
                              ? "--"
                              : DateFormat('HH:mm')
                                  .format(timesheetData[index].checkIn.toLocal())),
                      TableText(
                          text: timesheetData[index].checkOut == null
                              ? "--"
                              : DateFormat('HH:mm')
                                  .format(timesheetData[index].checkOut.toLocal())),
                      TableButton(
                          title: StringConstants.kRegularise,
                          textStyle: Theme.of(context)
                              .textTheme
                              .cardMobileHeadingTextStyle
                              .copyWith(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.normal),
                          onPressed: () {})
                    ])));
  }
}
