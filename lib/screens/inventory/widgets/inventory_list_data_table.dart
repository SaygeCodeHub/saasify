import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/inventory/inventory_bloc.dart';
import 'package:saasify/bloc/inventory/inventory_event.dart';
import 'package:saasify/configs/app_color.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/inventory/fetch_inventory_list_model.dart';
import 'package:saasify/screens/inventory/inventory_list_screen.dart';
import 'package:saasify/screens/inventory/widgets/inventory_counter.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/custom_table.dart';

class InventoryListDataTable extends StatelessWidget {
  final List<InventoryProduct> productList;

  const InventoryListDataTable({Key? key, required this.productList})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomDataTable(
        columnList: const [
          StringConstants.kName,
          StringConstants.kBarcode,
          StringConstants.kCategory,
          StringConstants.kPrice,
          StringConstants.kDiscountPercent,
          StringConstants.kStock,
          ''
        ],
        selectedIds: InventoryListScreen.selectedIds,
        dataCount: productList.length,
        dataIds: productList.map((e) => e.variantId).toList(),
        onHeaderCheckboxChange: () {
          if (InventoryListScreen.selectedIds.length < productList.length) {
            InventoryListScreen.selectedIds =
                productList.map((e) => e.variantId).toList();
          } else {
            InventoryListScreen.selectedIds.clear();
          }
          context
              .read<InventoryBloc>()
              .add(SelectInventoryItem(productList: productList));
        },
        onRowCheckboxChange: (index) {
          (InventoryListScreen.selectedIds
                  .contains(productList[index].variantId))
              ? InventoryListScreen.selectedIds
                  .remove(productList[index].variantId)
              : InventoryListScreen.selectedIds
                  .add(productList[index].variantId);
          context
              .read<InventoryBloc>()
              .add(SelectInventoryItem(productList: productList));
        },
        generateData: (index) {
          return [
            DataCell(Align(
              alignment: Alignment.centerLeft,
              child: Text(productList[index].productName,
                  textAlign: TextAlign.left,
                  style: Theme.of(context).textTheme.xxTiniest),
            )),
            DataCell(
              Align(
                alignment: Alignment.centerLeft,
                child: Text(productList[index].barcode.toString(),
                    style: Theme.of(context).textTheme.xxTiniest),
              ),
            ),
            DataCell(Align(
              alignment: Alignment.centerLeft,
              child: Text(productList[index].categoryName,
                  style: Theme.of(context).textTheme.xxTiniest),
            )),
            DataCell(Text(
                '${productList[index].currency} ${productList[index].cost}',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.xxTiniest)),
            DataCell(Text(productList[index].discountPercent.toString(),
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.xxTiniest)),
            DataCell(InventoryCounter(product: productList[index])),
            DataCell((productList[index].stock <=
                    productList[index].restockReminder)
                ? Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: AppColor.saasifyLighterRed),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.circle,
                            size: 8, color: AppColor.saasifyRed),
                        const SizedBox(width: 6),
                        Text(
                            (productList[index].stock > 0)
                                ? 'Low Stock'
                                : 'Out of Stock',
                            style: Theme.of(context)
                                .textTheme
                                .xxTiniest
                                .copyWith(color: AppColor.saasifyRed)),
                      ],
                    ))
                : const SizedBox.shrink())
          ];
        });
  }
}
