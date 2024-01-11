import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/models/products/fetch_all_categories_model.dart';
import 'package:saasify/screens/product/widgets/price_and_discount_widget_product_form.dart';
import 'package:saasify/screens/product/widgets/stock_and_low_stock_widget_product_form.dart';
import 'brand_widget_product_form.dart';
import 'disable_gst_toggle_widget_product_form.dart';

class ProductFormSection3 extends StatelessWidget {
  const ProductFormSection3({
    super.key,
    required this.isVariant,
    required this.isEdit,
    required this.dataMap,
    required this.isProductDetail,
    required this.categoryList,
  });

  final bool isVariant;
  final bool isEdit;
  final bool isProductDetail;
  final Map dataMap;
  final List<ProductCategory> categoryList;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      BrandWidgetProductForm(
          isProductDetail: isProductDetail,
          categoryList: categoryList,
          isVariant: isVariant,
          isEdit: isEdit,
          dataMap: dataMap),
      const SizedBox(height: spacingHuge),
      PriceAndDiscountWidgetProductForm(
          isProductDetail: isProductDetail,
          categoryList: categoryList,
          isVariant: isVariant,
          isEdit: isEdit,
          dataMap: dataMap),
      const SizedBox(height: spacingHuge),
      StockAndLowStockWidgetProductForm(
          isProductDetail: isProductDetail,
          categoryList: categoryList,
          isVariant: isVariant,
          isEdit: isEdit,
          dataMap: dataMap),
      const SizedBox(height: 70),
      DisableGstToggleWidgetProductForm(
          isProductDetail: isProductDetail,
          categoryList: categoryList,
          dataMap: dataMap)
    ]));
  }
}
