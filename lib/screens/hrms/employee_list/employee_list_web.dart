import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/new_app_theme.dart';
import 'package:saasify/data/models/table_models/column_data_model.dart';
import 'package:saasify/widgets/layoutWidgets/background_card_widget.dart';
import 'package:saasify/widgets/table/custom_table.dart';
import 'package:saasify/widgets/table/table_cells.dart';
import 'package:saasify/widgets/text/module_heading.dart';
import 'package:saasify/widgets/userInput/custom_drop_down.dart';

import '../../../configs/app_spacing.dart';

class EmployeeListWeb extends StatelessWidget {
  const EmployeeListWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundCardWidget(
      childScreen: Padding(
        padding: const EdgeInsets.all(spacingMedium),
        child: Column(
          children: [
            SizedBox(height: spacingMedium),
            Row(children: [
              CustomDropDown(
                  items: ["Last 30 Days", "Last Week"],
                  defaultValue: "Last 30 Days",
                  icon: Icons.store,
                  onChanged: (value) {}
              ),
            ]),
            SizedBox(height: spacingMedium),
            Expanded(
              child: CustomDataTable(
                  checkboxVisible: false,
                  showRowCheckBox: false,
                  columnList: [
                    ColumnData(header: "", width: 100),
                    ColumnData(header: "Employee Name"),
                    ColumnData(header: "Employee Status"),
                    ColumnData(header: "Employee Email"),
                    ColumnData(header: "Employee Phone"),
                    ColumnData(header: "Employee Address"),
                    ColumnData(header: "Employee Age"),
                  ],
                  selectedIds: [],
                  dataCount: 5,
                  dataIds: ["1", "2", "3", "4", "5", "6"],
                  onRowCheckboxChange: (value) {},
                  generateData: (index) => [
                        TableAvatar(),
                        TableText(text: "Employee Name"),
                        TableStatusChips(status: "Inactive", color: Colors.red),
                        TableText(text: "Employee Email"),
                        TableText(text: "Employee Phone"),
                        TableText(text: "Employee Address"),
                        TableText(text: "Employee Age"),
                      ]),
            ),
          ],
        ),
      ),
    );
  }
}
