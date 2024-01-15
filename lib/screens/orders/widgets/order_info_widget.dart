import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/orders/fetch_orders_model.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';

class OrderInfoWidget extends StatelessWidget {
  final Order orderListDatum;

  const OrderInfoWidget({super.key, required this.orderListDatum});

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CircleAvatar(
              radius: kAvatarRadius,
              backgroundColor: AppColor.saasifyLightestPaleGrey,
              child: Icon(Icons.shopping_cart_outlined,
                  color: AppColor.saasifyBlack)),
          const SizedBox(width: spacingXMedium),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Order Info',
                  style: Theme.of(context)
                      .textTheme
                      .tinier
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: spacingXSmall),
                Row(children: [
                  Text('Shipping:',
                      style: Theme.of(context)
                          .textTheme
                          .xTiniest
                          .copyWith(color: AppColor.saasifyGreyBlue)),
                  const SizedBox(width: spacingXXSmall),
                  Text('Next Express',
                      style: Theme.of(context)
                          .textTheme
                          .xTiniest
                          .copyWith(fontWeight: FontWeight.w600))
                ]),
                const SizedBox(height: spacingXSmall),
                Row(children: [
                  Text('Payment Method:',
                      style: Theme.of(context)
                          .textTheme
                          .xTiniest
                          .copyWith(color: AppColor.saasifyGreyBlue)),
                  const SizedBox(width: spacingXXSmall),
                  Text(
                    orderListDatum.paymentType.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .xTiniest
                        .copyWith(fontWeight: FontWeight.w600),
                  )
                ]),
                const SizedBox(height: spacingXSmall),
                Row(children: [
                  Text('Status:',
                      style: Theme.of(context)
                          .textTheme
                          .xTiniest
                          .copyWith(color: AppColor.saasifyGreyBlue)),
                  const SizedBox(width: spacingXXSmall),
                  Text(
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
                          .xTiniest
                          .copyWith(fontWeight: FontWeight.w600))
                ])
              ])
        ]);
  }
}
