import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/configs/app_theme.dart';
import '../../../bloc/product/product_bloc.dart';
import '../../../bloc/product/product_event.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import 'package:saasify/data/models/products/fetch_all_categories_model.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../widgets/custom_dropdown.dart';
import '../../../widgets/custom_text_field.dart';

class QuantityAndUnitWidgetProductForm extends StatelessWidget {
  final List<ProductCategory> categoryList;
  final bool isVariant;
  final bool isEdit;
  final Map dataMap;
  final bool isProductDetail;

  const QuantityAndUnitWidgetProductForm(
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
    ]);
  }
}
