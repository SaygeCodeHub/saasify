import 'package:flutter/material.dart';
import 'package:saasify/configs/app_color.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/inventory/fetch_inventory_list_model.dart';
import 'package:saasify/screens/inventory/widgets/negative_counter.dart';
import 'package:saasify/screens/inventory/widgets/positive_counter.dart';

class InventoryCounter extends StatelessWidget {
  const InventoryCounter({
    super.key,
    required this.product,
  });

  final InventoryProduct product;

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          NegativeCounter(product: product),
          SizedBox(
            height: kCounterContainerSize,
            width: kStockContainerSize,
            child: Center(
                child: Text(product.stock.toString(),
                    style: Theme.of(context).textTheme.xxTiniest.copyWith(
                        color: (product.stock <= product.restockReminder)
                            ? AppColor.saasifyRed
                            : AppColor.saasifyBlack))),
          ),
          PositiveCounter(product: product)
        ]));
  }
}
