import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/utils/responsive.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/screen_arguments/add_product_screen_arguments.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../utils/custom_dialogue_util.dart';
import '../../../widgets/primary_button.dart';
import '../add_product_screen.dart';
import '../product_screen.dart';

class BackIconAndHeadingWidget extends StatelessWidget {
  final bool isVariant;
  final bool isEdit;
  final Map dataMap;
  final bool isProductDetail;

  const BackIconAndHeadingWidget(
      {super.key,
      required this.isEdit,
      required this.dataMap,
      required this.isProductDetail,
      required this.isVariant});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
                onTap: () {
                  (isProductDetail == true)
                      ? Navigator.pushReplacementNamed(
                          context, ProductScreen.routeName)
                      : CustomDialogueUtils.discardChangesWarningDialogue(
                          context);
                },
                child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(Icons.arrow_back_ios_new))),
            const SizedBox(width: spacingSmall),
            context.responsive(const SizedBox.shrink(),
                desktop: Text(
                    (isVariant == true)
                        ? StringConstants.kAddVariant
                        : (isEdit)
                            ? 'Edit Product'
                            : (isProductDetail == true)
                                ? StringConstants.kProductDetails
                                : StringConstants.kAddProduct,
                    style: Theme.of(context)
                        .textTheme
                        .xxTiny
                        .copyWith(fontWeight: FontWeight.w700)))
          ]),
      Visibility(
          visible: isEdit || isProductDetail,
          child: SizedBox(
              width: kGeneralActionButtonWidth,
              child: PrimaryButton(
                  onPressed: () {
                    (isProductDetail == true)
                        ? Navigator.pushReplacementNamed(
                            context, AddProductScreen.routeName,
                            arguments: AddProductScreenArguments(
                                isEdit: true,
                                isVariant: false,
                                dataMap: dataMap,
                                isProductDetail: false))
                        : Navigator.pushReplacementNamed(
                            context, AddProductScreen.routeName,
                            arguments: AddProductScreenArguments(
                                isEdit: false,
                                isVariant: true,
                                dataMap: {
                                  'product_name': dataMap['product_name'],
                                  'category_name': dataMap['category_name'],
                                  'brand_name': dataMap['brand_name'],
                                  'product_id': dataMap['product_id'],
                                  'product_description':
                                      dataMap['product_description'],
                                },
                                isProductDetail: false));
                  },
                  buttonTitle: (isProductDetail == true)
                      ? 'Edit Product Details'
                      : 'Add Variant')))
    ]);
  }
}
