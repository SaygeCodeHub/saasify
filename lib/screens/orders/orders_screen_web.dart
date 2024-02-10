import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/models/table_models/column_data_model.dart';
import 'package:saasify/widgets/layoutWidgets/background_card_widget.dart';
import 'package:saasify/widgets/table/custom_table.dart';
import 'package:saasify/widgets/table/table_cells.dart';

class OrdersScreenWeb extends StatelessWidget {
  const OrdersScreenWeb({super.key});

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
              ColumnData(header: "Name"),
              ColumnData(header: "Employee ID"),
              ColumnData(header: "Email"),
              ColumnData(header: "Phone"),
              ColumnData(header: "Designation"),
            ],
            selectedIds: const [],
            dataCount: 10,
            dataIds: [0, 1, 2, 3, 4],
            onRowCheckboxChange: (value) {},
            generateData: (index) => [
                  const TableAvatar(),
                  TableText(text: 'name'),
                  TableText(text: 'name'),
                  TableText(text: 'name'),
                  TableText(text: 'name'),
                  TableText(text: 'name'),
                ]),
      ),
    );
  }
}
