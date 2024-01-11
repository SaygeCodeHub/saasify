import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/models/products/fetch_all_categories_model.dart';
import 'package:saasify/screens/product/widgets/price_and_discount_widget_product_form.dart';
import 'package:saasify/screens/product/widgets/product_description_widget_product_form.dart';
import 'package:saasify/screens/product/widgets/product_name_widget_product_form.dart';
import 'package:saasify/screens/product/widgets/quantity_and_unit_widget_product_form.dart';
import 'package:saasify/screens/product/widgets/stock_and_low_stock_widget_product_form.dart';
import 'barcode_widget_product_form.dart';
import 'brand_widget_product_form.dart';
import 'category_widget_product_form.dart';
import 'disable_gst_toggle_widget_product_form.dart';
import 'gst_widget_product_form.dart';

class ProductFormMobileSection extends StatelessWidget {
  const ProductFormMobileSection(
      {super.key,
      required this.isVariant,
      required this.isEdit,
      required this.dataMap,
      required this.categoryList,
      required this.isProductDetail});

  final List<ProductCategory> categoryList;
  final bool isVariant;
  final bool isEdit;
  final Map dataMap;
  final bool isProductDetail;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      CategoryWidgetProductForm(
          isProductDetail: isProductDetail,
          categoryList: categoryList,
          isVariant: isVariant,
          isEdit: isEdit,
          dataMap: dataMap),
      (isProductDetail == true)
          ? const SizedBox(height: spacingLarge)
          : const SizedBox(height: spacingHuge),
      ProductNameWidgetProductForm(
          isProductDetail: isProductDetail,
          categoryList: categoryList,
          isVariant: isVariant,
          isEdit: isEdit,
          dataMap: dataMap),
      const SizedBox(height: spacingHuge),
      BrandWidgetProductForm(
          isProductDetail: isProductDetail,
          categoryList: categoryList,
          isVariant: isVariant,
          isEdit: isEdit,
          dataMap: dataMap),
      const SizedBox(height: spacingHuge),
      BarcodeWidgetProductForm(
          isProductDetail: isProductDetail,
          categoryList: categoryList,
          isVariant: isVariant,
          isEdit: isEdit,
          dataMap: dataMap),
      const SizedBox(height: spacingHuge),
      ProductDescriptionWidgetProductForm(
          isProductDetail: isProductDetail,
          categoryList: categoryList,
          isVariant: isVariant,
          isEdit: isEdit,
          dataMap: dataMap),
      const SizedBox(height: spacingXMedium),
      QuantityAndUnitWidgetProductForm(
          isProductDetail: isProductDetail,
          categoryList: categoryList,
          isVariant: isVariant,
          isEdit: isEdit,
          dataMap: dataMap),
      const SizedBox(height: spacingXXLarge),
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
      const SizedBox(height: spacingExtra),
      GstWidgetProductForm(
          isProductDetail: isProductDetail,
          categoryList: categoryList,
          dataMap: dataMap),
      DisableGstToggleWidgetProductForm(
          isProductDetail: isProductDetail,
          categoryList: categoryList,
          dataMap: dataMap),
      const SizedBox(height: spacingHuge)
    ]);
  }
}
