import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/models/products/fetch_all_categories_model.dart';
import 'package:saasify/screens/product/widgets/product_name_widget_product_form.dart';
import 'package:saasify/screens/product/widgets/quantity_and_unit_widget_product_form.dart';
import 'barcode_widget_product_form.dart';
import 'gst_widget_product_form.dart';

class ProductFormSection2 extends StatelessWidget {
  const ProductFormSection2({
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
      ProductNameWidgetProductForm(
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
      QuantityAndUnitWidgetProductForm(
          isProductDetail: isProductDetail,
          categoryList: categoryList,
          isVariant: isVariant,
          isEdit: isEdit,
          dataMap: dataMap),
      const SizedBox(height: spacingXXLarge),
      GstWidgetProductForm(
          isProductDetail: isProductDetail,
          categoryList: categoryList,
          dataMap: dataMap),
    ]));
  }
}
