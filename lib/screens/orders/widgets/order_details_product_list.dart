import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/orders/fetch_orders_model.dart';
import '../order_details_list_datatable.dart';

class OrderDetailsProductList extends StatelessWidget {
  final Order orderListDatum;

  const OrderDetailsProductList({super.key, required this.orderListDatum});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
            decoration: BoxDecoration(
                color: AppColor.saasifyWhite,
                borderRadius: BorderRadius.circular(kCircularRadius)),
            child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: spacingLarge, vertical: spacingLarge),
                child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Products',
                          style: Theme.of(context)
                              .textTheme
                              .tiniest
                              .copyWith(fontWeight: FontWeight.w600)),
                      const SizedBox(height: spacingXSmall),
                      Expanded(
                          child: OrderDetailsListDataTable(
                              orderListDatum: orderListDatum))
                    ]))));
  }
}
