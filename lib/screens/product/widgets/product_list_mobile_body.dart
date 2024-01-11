import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/screens/product/widgets/product_status_container_and_toggle_widget_mobile.dart';
import 'package:saasify/screens/product/widgets/stock_widget_mobile.dart';
import '../../../configs/app_colors.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/products/product_list_model.dart';
import 'barcode_widget_mobile.dart';
import 'category_and_brand_mobile_widget.dart';
import 'currency_widget_mobile.dart';
import 'image_widget_mobile.dart';

class ProductListMobileBody extends StatelessWidget {
  final ProductWithVariant productList;

  const ProductListMobileBody({super.key, required this.productList});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: AppColors.lightGrey,
            borderRadius: BorderRadius.circular(kCircularRadius)),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ImageWidgetMobile(productList: productList),
              Expanded(
                  child: Padding(
                      padding: const EdgeInsets.only(
                          left: spacingXMedium,
                          right: spacingXMedium,
                          top: spacingXXSmall),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            CategoryAndBrandMobileWidget(
                                productList: productList),
                            Text(productList.productName,
                                style: Theme.of(context)
                                    .textTheme
                                    .xTiniest
                                    .copyWith(
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.black),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                softWrap: false),
                            BarcodeWidgetMobile(productList: productList),
                            CurrencyWidgetMobile(productList: productList),
                            const SizedBox(height: spacingXSmall),
                            StockWidgetMobile(productList: productList),
                            ProductStatusContainerAndToggleWidgetMobile(
                                productList: productList)
                          ])))
            ]));
  }
}
