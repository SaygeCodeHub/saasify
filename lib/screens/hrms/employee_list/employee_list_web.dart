import 'package:flutter/material.dart';
import 'package:saasify/data/models/table_models/column_data_model.dart';
import 'package:saasify/widgets/layoutWidgets/background_card_widget.dart';
import 'package:saasify/widgets/table/custom_table.dart';
import 'package:saasify/widgets/table/table_cells.dart';
import '../../../configs/app_spacing.dart';

class EmployeeListWeb extends StatelessWidget {
  const EmployeeListWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundCardWidget(
      childScreen: Padding(
        padding: const EdgeInsets.all(spacingMedium),
        child: CustomDataTable(
            checkboxVisible: false,
            showRowCheckBox: false,
            columnList: [
              ColumnData(header: "", width: 100),
              ColumnData(header: "Name", width: 100),
              ColumnData(header: "Status"),
              ColumnData(header: "Email"),
              ColumnData(header: "Phone"),
              ColumnData(header: "Address", width: 350),
              ColumnData(header: "Age", width: 50),
            ],
            selectedIds: const [],
            dataCount: 5,
            dataIds: const ["1", "2", "3", "4", "5", "6"],
            onRowCheckboxChange: (value) {},
            generateData: (index) => [
                  TableAvatar(avatarUrl: "https://picsum.photos/200"),
                  TableText(text: "John Doeeeeeeeee"),
                  TableStatusChips(status: "Inactive", color: Colors.red),
                  TableText(text: "employee@mail.com"),
                  TableText(text: "9999988888"),
                  TableText(text: "222, 2nd Floor, State, City, Country"),
                  TableText(text: "22"),
                ]),
      ),
    );
  }
}
