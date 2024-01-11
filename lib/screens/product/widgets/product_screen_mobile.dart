import 'package:flutter/material.dart';
import 'package:saasify/screens/product/widgets/product_list_mobile.dart';
import 'package:saasify/utils/custom_dialogue_util.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/products/product_list_model.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../widgets/custom_page_header.dart';
import '../product_screen.dart';

class ProductScreenMobile extends StatelessWidget {
  final bool visible;

  final List<ProductWithVariant> productList;

  const ProductScreenMobile({
    super.key,
    required this.productList,
    required this.visible,
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      CustomPageHeader(
          titleText: StringConstants.kProducts,
          buttonVisible: false,
          buttonTitle: StringConstants.kAddProduct,
          utilityVisible: true,
          deleteIconVisible: ProductScreen.selectedIds.isNotEmpty,
          onPressed: () {
            CustomDialogueUtils.addNewProductDialogue(context);
          }),
      const SizedBox(height: spacingStandard),
      ProductListMobile(productList: productList)
    ]);
  }
}
