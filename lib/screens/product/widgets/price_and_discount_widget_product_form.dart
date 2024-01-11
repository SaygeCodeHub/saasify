import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saasify/configs/app_theme.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import 'package:saasify/data/models/products/fetch_all_categories_model.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../widgets/custom_text_field.dart';

class PriceAndDiscountWidgetProductForm extends StatelessWidget {
  final List<ProductCategory> categoryList;
  final bool isVariant;
  final bool isEdit;
  final Map dataMap;
  final bool isProductDetail;

  const PriceAndDiscountWidgetProductForm(
      {super.key,
      required this.isProductDetail,
      required this.categoryList,
      required this.isVariant,
      required this.isEdit,
      required this.dataMap});

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
    ]);
  }
}
