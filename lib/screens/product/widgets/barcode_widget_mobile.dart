import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';
import '../../../configs/app_colors.dart';
import '../../../data/models/products/product_list_model.dart';

class BarcodeWidgetMobile extends StatelessWidget {
  final ProductWithVariant productList;

  const BarcodeWidgetMobile({super.key, required this.productList});

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Barcode : ',
              style: Theme.of(context).textTheme.xxTiniest.copyWith(
                  fontWeight: FontWeight.w500, color: AppColors.black),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              softWrap: false),
          Text(productList.barcode.toString(),
              style: Theme.of(context).textTheme.xxTiniest.copyWith(
                  fontWeight: FontWeight.w500, color: AppColors.black),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              softWrap: false)
        ]);
  }
}
