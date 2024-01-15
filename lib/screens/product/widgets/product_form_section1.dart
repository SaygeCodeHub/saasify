import 'package:flutter/material.dart';
import 'package:saasify/configs/app_color.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/products/fetch_all_categories_model.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/custom_dropdown.dart';
import 'package:saasify/widgets/custom_text_field.dart';

import '../../../configs/app_dimensions.dart';

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
      Text(StringConstants.kCategory,
          style: Theme.of(context)
              .textTheme
              .xxTiniest
              .copyWith(fontWeight: FontWeight.w700)),
      const SizedBox(height: spacingXMedium),
      (isProductDetail == true)
          ? Container(
              height: kTextFieldHeight,
              width: double.maxFinite,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(spacingXSmall),
                  border: Border.all(color: AppColor.saasifyPaleGrey)),
              child: Padding(
                  padding: const EdgeInsets.all(spacingSmall),
                  child: Text(dataMap['category_name'])))
          : CustomDropdownWidget(
              validator: (value) {
                if (value == null || value.trim() == '') {
                  return 'Please Select a Category';
                }
                return null;
              },
              addOption: true,
              hintText: 'Add New Category',
              canEdit: !(isVariant && !isEdit),
              dataMap: dataMap,
              mapKey: 'category_name',
              initialValue: dataMap['category_name'] ??
                  categoryList
                      .map((e) =>
                          e.categoryName[0].toUpperCase() +
                          e.categoryName.substring(1).toLowerCase())
                      .toList()[0],
              listItems: categoryList
                      .map((e) =>
                          e.categoryName[0].toUpperCase() +
                          e.categoryName.substring(1).toLowerCase())
                      .toList() +
                  ['Add New']),
      (isProductDetail == true)
          ? const SizedBox(height: spacingLarge)
          : const SizedBox(height: spacingHuge),
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
                  borderRadius: BorderRadius.circular(spacingXSmall),
                  border: Border.all(color: AppColor.saasifyPaleGrey)),
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
              }),
    ]));
  }
}
