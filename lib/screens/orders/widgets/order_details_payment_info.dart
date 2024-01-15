import 'package:flutter/material.dart';
import 'package:saasify/data/models/orders/fetch_orders_model.dart';
import 'package:saasify/screens/orders/widgets/payment_info_widget.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import 'customer_info_widget.dart';
import 'order_info_widget.dart';

class OrderDetailsPaymentInfo extends StatelessWidget {
  final Order orderListDatum;

  const OrderDetailsPaymentInfo({super.key, required this.orderListDatum});

  @override
  Widget build(BuildContext context) {
    return Container(
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
                  Row(children: [
                    CustomerInfoWidget(orderListDatum: orderListDatum),
                    const SizedBox(width: spacingXExcel),
                    OrderInfoWidget(orderListDatum: orderListDatum)
                  ]),
                  const SizedBox(height: spacingExcel),
                  PaymentInfoWidget(orderListDatum: orderListDatum),
                ])));
  }
}
