import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/configs/app_color.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/products/fetch_all_categories_model.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/custom_dropdown.dart';
import 'package:saasify/widgets/custom_text_field.dart';

import '../../../bloc/product/product_bloc.dart';
import '../../../bloc/product/product_event.dart';
import '../../../configs/app_dimensions.dart';
import '../../../widgets/toggle_switch_widget.dart';

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
                  ['Add New']),
      (isProductDetail == true)
          ? const SizedBox(height: spacingLarge)
          : const SizedBox(height: spacingHuge),
      Text(StringConstants.kName,
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
                  borderRadius: BorderRadius.circular(spacingXSmall),
                  border: Border.all(color: AppColor.saasifyPaleGrey)),
              child: Padding(
                  padding: const EdgeInsets.all(spacingSmall),
                  child: Text(dataMap['product_name'])))
          : CustomTextField(
              validator: (value) {
                if (value == null || value.trim() == '') {
                  return 'Please Enter the Product Name';
                }
                return null;
              },
              enabled: !(isVariant && !isEdit),
              initialValue: dataMap['product_name'] ?? '',
              onTextFieldChanged: (value) {
                dataMap['product_name'] = value;
              }),
      const SizedBox(height: spacingHuge),
      Text(StringConstants.kBrand,
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
                  child: Text(dataMap['brand_name'])))
          : CustomTextField(
              validator: (value) {
                if ((value == null || value.trim() == '') &&
                    dataMap['draft'] == false) {
                  return 'Please Enter the Brand Name';
                }
                return null;
              },
              enabled: !(isVariant && !isEdit),
              initialValue: dataMap['brand_name'] ?? '',
              onTextFieldChanged: (value) {
                dataMap['brand_name'] = value;
              }),
      const SizedBox(height: spacingHuge),
      Text(StringConstants.kBarcode,
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
                  borderRadius: BorderRadius.circular(spacingXSmall),
                  border: Border.all(color: AppColor.saasifyPaleGrey)),
              child: Padding(
                  padding: const EdgeInsets.all(spacingSmall),
                  child: Text(dataMap['barcode'].toString())))
          : CustomTextField(
              validator: (value) {
                if (value == null || value.trim() == '') {
                  return 'Please Enter the Product Barcode';
                }
                return null;
              },
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly
              ],
              initialValue: dataMap['barcode'] ?? '',
              onTextFieldChanged: (value) {
                dataMap['barcode'] = value;
              }),
      const SizedBox(height: spacingHuge),
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
              }),
      const SizedBox(height: spacingXMedium),
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(StringConstants.kQuantity,
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
                      borderRadius: BorderRadius.circular(spacingXSmall),
                      border: Border.all(color: AppColor.saasifyPaleGrey)),
                  child: Padding(
                      padding: const EdgeInsets.all(spacingSmall),
                      child: Text(dataMap['quantity'].toString())))
              : CustomTextField(
                  validator: (value) {
                    if ((value == null || value.trim() == '') &&
                        dataMap['draft'] == false) {
                      return 'This field cannot be blank';
                    }
                    return null;
                  },
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  initialValue: dataMap['quantity'] ?? '',
                  onTextFieldChanged: (value) {
                    dataMap['quantity'] = value;
                  })
        ])),
        const SizedBox(width: spacingLarger),
        Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(StringConstants.kUnit,
              overflow: TextOverflow.ellipsis,
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
                      border: Border.all(color: AppColor.saasifyPaleGrey)),
                  child: Padding(
                      padding: const EdgeInsets.all(spacingSmall),
                      child: Text(dataMap['unit'] ?? "nos")))
              : CustomDropdownWidget(
                  onChanges: () {
                    context
                        .read<ProductBloc>()
                        .add(LoadForm(categoryList: categoryList));
                  },
                  initialValue: dataMap['unit'] ?? "nos",
                  listItems: ["nos", "kg", "l", "gm", "m"] +
                      ((dataMap['unit'] != null &&
                              !["nos", "kg", "l", "gm", "m"]
                                  .contains(dataMap['unit']))
                          ? [dataMap['unit']]
                          : []),
                  dataMap: dataMap,
                  mapKey: 'unit')
        ]))
      ]),
      const SizedBox(height: spacingXXLarge),
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(StringConstants.kPrice,
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
                      child: Text('${dataMap['currency']} ${dataMap['cost']}')))
              : CustomTextField(
                  validator: (value) {
                    if ((value == null || value.trim() == '') &&
                        dataMap['draft'] == false) {
                      return 'This field cannot be blank';
                    }
                    return null;
                  },
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  initialValue: dataMap['cost'] ?? '',
                  onTextFieldChanged: (value) {
                    dataMap['cost'] = value;
                  })
        ])),
        const SizedBox(width: spacingLarger),
        Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(StringConstants.kDiscountPercent,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
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
                      child: Text(dataMap['discount_percent'].toString())))
              : CustomTextField(
                  validator: (value) {
                    if ((value == null || value.trim() == '') &&
                        dataMap['draft'] == false) {
                      return 'This field cannot be blank';
                    }
                    return null;
                  },
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  initialValue: dataMap['discount_percent'] ?? '0',
                  onTextFieldChanged: (value) {
                    dataMap['discount_percent'] = value;
                  })
        ]))
      ]),
      const SizedBox(height: spacingHuge),
      Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(StringConstants.kStock,
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
                      child: Text(dataMap['stock'].toString())))
              : CustomTextField(
                  validator: (value) {
                    if ((value == null || value.trim() == '') &&
                        dataMap['draft'] == false) {
                      return 'This field cannot be blank';
                    }
                    return null;
                  },
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  initialValue: dataMap['stock'] ?? '',
                  onTextFieldChanged: (value) {
                    dataMap['stock'] = value;
                  })
        ])),
        const SizedBox(width: spacingLarger),
        Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(StringConstants.kLowStock,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
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
                      child: Text(dataMap['restock_reminder'].toString())))
              : CustomTextField(
                  validator: (value) {
                    if ((value == null || value.trim() == '') &&
                        dataMap['draft'] == false) {
                      return 'This field cannot be blank';
                    }
                    return null;
                  },
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ],
                  initialValue: dataMap['restock_reminder'] ?? '',
                  onTextFieldChanged: (value) {
                    dataMap['restock_reminder'] = value;
                  })
        ]))
      ]),
      const SizedBox(height: 70),
      Text(StringConstants.kGST,
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
                child: Text(
                    '${(dataMap['CGST'] + dataMap['SGST']).toInt().toString()} %'),
              ))
          : CustomDropdownWidget(
              canEdit: !(dataMap['enableGST'] ?? true),
              onChanges: () {
                dataMap['CGST'] = int.parse(dataMap['GST']) / 2;
                dataMap['SGST'] = int.parse(dataMap['GST']) / 2;
                context
                    .read<ProductBloc>()
                    .add(LoadForm(categoryList: categoryList));
              },
              initialValue: (dataMap['CGST'] != null)
                  ? (dataMap['CGST'] + dataMap['SGST']).toInt().toString()
                  : '0',
              listItems: const ['0', '5', '12', '18', '28'],
              dataMap: dataMap,
              mapKey: 'GST'),
      const SizedBox(height: spacingXXSmall),
      (isProductDetail == true)
          ? Text(
              'CGST : ${(dataMap['CGST'] != null) ? dataMap['CGST'] : '0'} % and SGST : ${(dataMap['SGST'] != null) ? dataMap['SGST'] : '0'} %',
              style: Theme.of(context).textTheme.xxxTiniest)
          : Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                  'CGST : ${(dataMap['CGST'] != null) ? dataMap['CGST'] : '0'} % and SGST : ${(dataMap['SGST'] != null) ? dataMap['SGST'] : '0'} %',
                  style: Theme.of(context).textTheme.xxxTiniest),
            ),
      Row(
        children: [
          Text(StringConstants.kWantToDisableGST,
              style: Theme.of(context)
                  .textTheme
                  .xxTiniest
                  .copyWith(fontWeight: FontWeight.w700)),
          const SizedBox(width: spacingLarge),
          (isProductDetail == true)
              ? Text((dataMap['enableGST'] == true) ? 'Yes' : 'No')
              : ToggleSwitchWidget(
                  activeColor: AppColor.saasifyLightDeepBlue,
                  value: dataMap['enableGST'] ?? true,
                  onChanged: (value) {
                    dataMap['enableGST'] = value;
                    context
                        .read<ProductBloc>()
                        .add(LoadForm(categoryList: categoryList));
                  })
        ],
      ),
      const SizedBox(height: spacingHuge),
    ]);
  }
}
