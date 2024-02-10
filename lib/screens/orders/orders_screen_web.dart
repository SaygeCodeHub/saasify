import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
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
              ColumnData(header: "# Order ID"),
              ColumnData(header: "Date"),
              ColumnData(header: "Customer Name"),
              ColumnData(header: "Contact"),
              ColumnData(header: "Amount"),
              ColumnData(header: "Payment Type"),
              ColumnData(header: "Status"),
            ],
            selectedIds: const [],
            dataCount: 10,
            dataIds: const [0, 1, 2, 3],
            onRowCheckboxChange: (value) {},
            generateData: (index) => [
                  TableText(text: '49399123'),
                  TableText(text: '24/04/2024'),
                  TableText(text: 'Ramesh Jupiter'),
                  TableText(text: '+91-8888881890'),
                  TableText(text: 'Rs. 29,123/-'),
                  TableText(text: 'Cash'),
                  TableStatusChips(status: 'PAID', color: statusColor('PAID')),
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
