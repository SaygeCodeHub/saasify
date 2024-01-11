import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saasify/configs/app_theme.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import 'package:saasify/data/models/products/fetch_all_categories_model.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../widgets/custom_text_field.dart';

class BarcodeWidgetProductForm extends StatelessWidget {
  final List<ProductCategory> categoryList;
  final bool isVariant;
  final bool isEdit;
  final Map dataMap;
  final bool isProductDetail;

  const BarcodeWidgetProductForm(
      {super.key,
      required this.isProductDetail,
      required this.categoryList,
      required this.isVariant,
      required this.isEdit,
      required this.dataMap});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
              })
    ]);
  }
}
