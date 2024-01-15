import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/orders/fetch_orders_model.dart';

class PaymentInfoWidget extends StatelessWidget {
  final Order orderListDatum;

  const PaymentInfoWidget({super.key, required this.orderListDatum});

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CircleAvatar(
              radius: kAvatarRadius,
              backgroundColor: AppColor.saasifyLightestPaleGrey,
              child:
                  Icon(Icons.payment_outlined, color: AppColor.saasifyBlack)),
          const SizedBox(
            width: spacingXMedium,
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Payment Info',
                  style: Theme.of(context)
                      .textTheme
                      .tinier
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: spacingXSmall),
                Row(
                  children: [
                    Text(
                      'Master Card:',
                      style: Theme.of(context)
                          .textTheme
                          .xTiniest
                          .copyWith(color: AppColor.saasifyGreyBlue),
                    ),
                    const SizedBox(width: spacingXXSmall),
                    Text(
                      '******8578',
                      style: Theme.of(context)
                          .textTheme
                          .xTiniest
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(height: spacingXSmall),
                Row(
                  children: [
                    Text('Business Name:',
                        style: Theme.of(context)
                            .textTheme
                            .xTiniest
                            .copyWith(color: AppColor.saasifyGreyBlue)),
                    const SizedBox(width: spacingXXSmall),
                    Text(
                      'Maria Aniston',
                      style: Theme.of(context)
                          .textTheme
                          .xTiniest
                          .copyWith(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                const SizedBox(height: spacingXSmall),
                Row(children: [
                  Text('Phone:',
                      style: Theme.of(context)
                          .textTheme
                          .xTiniest
                          .copyWith(color: AppColor.saasifyGreyBlue)),
                  const SizedBox(width: spacingXXSmall),
                  Text(orderListDatum.customerContact.toString(),
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
