import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/table_models/column_data_model.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/utils/formatters.dart';
import 'package:saasify/widgets/layoutWidgets/background_card_widget.dart';
import 'package:saasify/widgets/table/custom_table.dart';
import 'package:saasify/widgets/table/table_cells.dart';

class TimeSheetAttendanceHistoryScreen extends StatelessWidget {
  static const routeName = 'TimeSheetAttendanceHistoryScreen';

  const TimeSheetAttendanceHistoryScreen({super.key});

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
                dataCount: 1,
                dataIds: ["1"],
                onRowCheckboxChange: (value) {},
                generateData: (index) => [
                      TableText(text: formatDate("")),
                      TableText(text: formatDate("")),
                      TableText(text: formatDate("")),
                      TableButton(
                          title: StringConstants.kRegularise,
                          textStyle: Theme.of(context)
                              .textTheme
                              .cardMobileHeadingTextStyle
                              .copyWith(
                                  color: AppColors.white,
                                  fontWeight: FontWeight.normal),
                          onPressed: () {}),
                    ])));
  }
}