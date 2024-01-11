import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_colors.dart';
import '../../../data/models/products/product_list_model.dart';

class StockWidgetMobile extends StatelessWidget {
  final ProductWithVariant productList;

  const StockWidgetMobile({super.key, required this.productList});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.start, children: [
      Text('Stock : ',
          style: Theme.of(context)
              .textTheme
              .xxTiniest
              .copyWith(color: AppColors.black),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          softWrap: false),
      Text(productList.stock.toString(),
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.xxTiniest.copyWith(
              color: (productList.stock != null &&
                      productList.restockReminder != null)
                  ? ((productList.stock ?? 0) <
                          (productList.restockReminder ?? 0))
                      ? AppColor.saasifyRed
                      : AppColor.saasifyGreen
                  : AppColor.saasifyGreen))
    ]);
  }
}
