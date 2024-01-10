import 'package:flutter/material.dart';
import 'package:saasify/screens/product/widgets/product_form_web.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/products/fetch_all_categories_model.dart';

class AddProductScreenWeb extends StatelessWidget {
  final List<ProductCategory> categoryList;
  final GlobalKey<FormState> _formKey;
  final bool isEdit;
  final bool isVariant;
  final Map dataMap;
  final bool isProductDetail;

  const AddProductScreenWeb({
    super.key,
    required this.isEdit,
    required this.isVariant,
    required this.dataMap,
    required this.isProductDetail,
    required GlobalKey<FormState> formKey,
    required this.categoryList,
  }) : _formKey = formKey;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
            top: spacingXXLarge,
            left: spacingXHuge,
            right: kHelloSpacingHeight),
        child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: ProductFormWeb(
                formKey: _formKey,
                isVariant: isVariant,
                isEdit: isEdit,
                dataMap: dataMap,
                categoryList: categoryList,
                isProductDetail: isProductDetail)));
  }
}
