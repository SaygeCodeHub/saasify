import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';

import '../../../configs/app_colors.dart';
import '../../../data/models/products/product_list_model.dart';

class CategoryAndBrandMobileWidget extends StatelessWidget {
  final ProductWithVariant productList;

  const CategoryAndBrandMobileWidget({super.key, required this.productList});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(children: [
        Text('Category : ',
            style: Theme.of(context)
                .textTheme
                .xTiniest
                .copyWith(fontWeight: FontWeight.w500, color: AppColors.black),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            softWrap: false),
        Text(productList.categoryName,
            style: Theme.of(context)
                .textTheme
                .xTiniest
                .copyWith(fontWeight: FontWeight.w500, color: AppColors.black),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            softWrap: false)
      ]),
      SizedBox(
          width: MediaQuery.sizeOf(context).width * 0.2,
          child: Text(productList.brandName ?? '',
              style: Theme.of(context).textTheme.xTiniest.copyWith(
                  fontWeight: FontWeight.w500, color: AppColors.black),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              softWrap: false))
    ]);
  }
}
