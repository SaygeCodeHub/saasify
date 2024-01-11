import 'package:flutter/material.dart';
import 'package:saasify/data/models/products/fetch_all_categories_model.dart';
import 'package:saasify/screens/product/widgets/product_form_image_section.dart';
import 'package:saasify/screens/product/widgets/product_form_mobile_section.dart';
import 'package:saasify/screens/product/widgets/publish_and_save_button.dart';
import '../../../configs/app_spacing.dart';
import 'back_icon_and_heading_widget.dart';
import 'container_and_toggle_widget_product_form_mobile.dart';

class ProductFormMobile extends StatelessWidget {
  const ProductFormMobile(
      {super.key,
      required GlobalKey<FormState> formKey,
      required this.isVariant,
      required this.isEdit,
      required this.dataMap,
      required this.categoryList,
      required this.isProductDetail})
      : _formKey = formKey;

  final GlobalKey<FormState> _formKey;
  final bool isVariant;
  final bool isEdit;
  final Map dataMap;
  final bool isProductDetail;
  final List<ProductCategory> categoryList;

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          BackIconAndHeadingWidget(
              isEdit: isEdit,
              dataMap: dataMap,
              isProductDetail: isProductDetail,
              isVariant: isVariant),
          const SizedBox(height: spacingStandard),
          ContainerAndToggleWidgetProductFormMobile(
              dataMap: dataMap, isEdit: isEdit, categoryList: categoryList),
          const SizedBox(height: spacingXHuge),
          ProductFormMobileSection(
              isVariant: isVariant,
              isEdit: isEdit,
              dataMap: dataMap,
              categoryList: categoryList,
              isProductDetail: isProductDetail),
          FormImageSection(
              isEdit: isEdit,
              dataMap: dataMap,
              isProductDetail: isProductDetail),
          const SizedBox(height: spacingMedium),
          PublishAndSaveButton(
              dataMap: dataMap,
              formKey: _formKey,
              isEdit: isEdit,
              isProductDetail: isProductDetail),
          const SizedBox(height: spacingMedium)
        ]));
  }
}
