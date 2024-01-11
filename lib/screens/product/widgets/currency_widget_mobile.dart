import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';

import '../../../configs/app_colors.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/products/product_list_model.dart';

class CurrencyWidgetMobile extends StatelessWidget {
  final ProductWithVariant productList;

  const CurrencyWidgetMobile({super.key, required this.productList});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(productList.currency.toString(),
          style: Theme.of(context)
              .textTheme
              .xxTiniest
              .copyWith(fontWeight: FontWeight.w500, color: AppColors.black),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          softWrap: false),
      const SizedBox(width: spacingSmallest),
      Text(productList.cost.toString(),
          style: Theme.of(context)
              .textTheme
              .tiniest
              .copyWith(fontWeight: FontWeight.w500, color: AppColors.black),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          softWrap: false)
    ]);
  }
}
