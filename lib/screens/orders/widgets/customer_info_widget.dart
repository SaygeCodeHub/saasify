import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/orders/fetch_orders_model.dart';

import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';

class CustomerInfoWidget extends StatelessWidget {
  final Order orderListDatum;

  const CustomerInfoWidget({super.key, required this.orderListDatum});

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CircleAvatar(
              radius: kAvatarRadius,
              backgroundColor: AppColor.saasifyLightestPaleGrey,
              child: Icon(Icons.person_outlined, color: AppColor.saasifyBlack)),
          const SizedBox(width: spacingXMedium),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Customer',
                    style: Theme.of(context)
                        .textTheme
                        .tinier
                        .copyWith(fontWeight: FontWeight.w600)),
                const SizedBox(height: spacingXSmall),
                Row(children: [
                  Text('Name:',
                      style: Theme.of(context)
                          .textTheme
                          .xTiniest
                          .copyWith(color: AppColor.saasifyGreyBlue)),
                  const SizedBox(width: spacingXXSmall),
                  Text(orderListDatum.customerName,
                      style: Theme.of(context)
                          .textTheme
                          .xTiniest
                          .copyWith(fontWeight: FontWeight.w600))
                ]),
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
                ])
              ])
        ]);
  }
}
