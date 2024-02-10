import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/models/table_models/column_data_model.dart';
import 'package:saasify/widgets/layoutWidgets/background_card_widget.dart';
import 'package:saasify/widgets/table/custom_table.dart';
import 'package:saasify/widgets/table/table_cells.dart';

class InventoryScreenWeb extends StatelessWidget {
  const InventoryScreenWeb({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundCardWidget(
      childScreen: Padding(
        padding: const EdgeInsets.all(spacingMedium),
        child: CustomDataTable(
            checkboxVisible: false,
            showRowCheckBox: false,
            columnList: [
              ColumnData(header: "Product ID"),
              ColumnData(header: "Name"),
              ColumnData(header: "Category"),
              ColumnData(header: "Brand"),
              ColumnData(header: "Price"),
              ColumnData(header: "Quantity"),
              ColumnData(header: "Updated At"),
            ],
            selectedIds: const [],
            dataCount: 10,
            dataIds: const [0, 1, 2, 3],
            onRowCheckboxChange: (value) {},
            generateData: (index) => [
                  TableText(text: '49399123'),
                  TableText(text: 'Maggie'),
                  TableText(text: 'Fast food'),
                  TableText(text: 'Nestle'),
                  TableText(text: 'Rs. 29/-'),
                  TableText(text: '731'),
                  TableText(text: '24/01/2012,  12:23 PM'),
                ]),
      ),
    );
  }

  Color statusColor(String designation) {
    switch (designation) {
      case 'PAID':
        return AppColors.successGreen;
      case 'PARTIAL':
        return AppColors.orange;
      default:
        return AppColors.errorRed;
    }
  }
}
