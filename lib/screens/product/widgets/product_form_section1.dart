import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/models/products/fetch_all_categories_model.dart';
import 'package:saasify/screens/product/widgets/product_description_widget_product_form.dart';
import 'category_widget_product_form.dart';

class ProductFormSection1 extends StatelessWidget {
  const ProductFormSection1(
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
    return Expanded(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      CategoryWidgetProductForm(
        isProductDetail: isProductDetail,
        categoryList: categoryList,
        isVariant: isVariant,
        isEdit: isEdit,
        dataMap: dataMap,
      ),
      (isProductDetail == true)
          ? const SizedBox(height: spacingLarge)
          : const SizedBox(height: spacingHuge),
      ProductDescriptionWidgetProductForm(
          isProductDetail: isProductDetail,
          categoryList: categoryList,
          isVariant: isVariant,
          isEdit: isEdit,
          dataMap: dataMap),
    ]));
  }
}
