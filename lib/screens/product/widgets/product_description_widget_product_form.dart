import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saasify/configs/app_theme.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import 'package:saasify/data/models/products/fetch_all_categories_model.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../widgets/custom_text_field.dart';

class ProductDescriptionWidgetProductForm extends StatelessWidget {
  final List<ProductCategory> categoryList;
  final bool isVariant;
  final bool isEdit;
  final Map dataMap;
  final bool isProductDetail;

  const ProductDescriptionWidgetProductForm(
      {super.key,
      required this.isProductDetail,
      required this.categoryList,
      required this.isVariant,
      required this.isEdit,
      required this.dataMap});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Wrap(children: [
        Text(StringConstants.kProductDescription,
            style: Theme.of(context)
                .textTheme
                .xxTiniest
                .copyWith(fontWeight: FontWeight.w700)),
        const SizedBox(width: spacingXSmall),
        (isProductDetail == true)
            ? const SizedBox()
            : Text(StringConstants.kMaxLines,
                style: Theme.of(context).textTheme.xTiniest)
      ]),
      const SizedBox(height: spacingXMedium),
      (isProductDetail == true)
          ? Container(
              height: kTextContainerHeight,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  color: AppColor.saasifyLighterWhite,
                  borderRadius: BorderRadius.circular(kCircularRadius),
                  border: Border.all(color: AppColor.saasifyGrey)),
              child: Padding(
                padding: const EdgeInsets.all(spacingSmall),
                child: Text(dataMap['product_description']),
              ))
          : CustomTextField(
              maxLines: 10,
              validator: (value) {
                if ((value == null || value.trim() == '') &&
                    dataMap['draft'] == false) {
                  return 'Please Enter the Product Description';
                }
                return null;
              },
              enabled: !(isVariant && !isEdit),
              initialValue: dataMap['product_description'] ?? '',
              onTextFieldChanged: (value) {
                dataMap['product_description'] = value;
              })
    ]);
  }
}
