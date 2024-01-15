import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/orders/widgets/payment_info_widget.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/orders/fetch_orders_model.dart';
import 'customer_info_widget.dart';

class OrderDetailsHeaderWidget extends StatelessWidget {
  final Order orderListDatum;

  const OrderDetailsHeaderWidget({super.key, required this.orderListDatum});

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          'Order ID: ${orderListDatum.orderId}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .xTiniest
                                              .copyWith(
                                                  fontWeight: FontWeight.w600)),
                                      const SizedBox(height: spacingXSmall),
                                      Text(
                                          DateFormat('dd MMM yyyy')
                                              .format(orderListDatum.orderDate),
                                          style: Theme.of(context)
                                              .textTheme
                                              .xxTiniest),
                                      const SizedBox(height: spacingXXSmall),
                                      Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: spacingXSmall,
                                              horizontal: spacingXXSmall),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      kGeneralRadius),
                                              color:
                                                  AppColor.saasifyLighterGreen),
                                          child: Text(
                                              orderListDatum.paymentStatus
                                                      .trim()
                                                      .substring(0, 1)
                                                      .toUpperCase() +
                                                  orderListDatum.paymentStatus
                                                      .trim()
                                                      .substring(
                                                        1,
                                                      )
                                                      .toLowerCase(),
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .xxTiniest
                                                  .copyWith(
                                                      color: AppColor
                                                          .saasifyGreen)))
                                    ])
                              ]),
                          const SizedBox(
                            height: spacingLarge,
                          ),
                          CustomerInfoWidget(
                            orderListDatum: orderListDatum,
                          )
                        ],
                      ),
                      PaymentInfoWidget(
                        orderListDatum: orderListDatum,
                      )
                    ],
                  )
                ])));
  }
}
