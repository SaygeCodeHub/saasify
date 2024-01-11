import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import 'package:saasify/data/models/products/fetch_all_categories_model.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../widgets/custom_dropdown.dart';

class CategoryWidgetProductForm extends StatelessWidget {
  final List<ProductCategory> categoryList;
  final bool isVariant;
  final bool isEdit;
  final Map dataMap;
  final bool isProductDetail;

  const CategoryWidgetProductForm(
      {super.key,
      required this.isProductDetail,
      required this.categoryList,
      required this.isVariant,
      required this.isEdit,
      required this.dataMap});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  color: AppColor.saasifyLighterWhite,
                  borderRadius: BorderRadius.circular(kCircularRadius),
                  border: Border.all(color: AppColor.saasifyGrey)),
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
                  ['Add New'])
    ]);
  }
}
