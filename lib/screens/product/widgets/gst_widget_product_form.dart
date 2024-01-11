import 'package:flutter/material.dart';
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

class GstWidgetProductForm extends StatelessWidget {
  final List<ProductCategory> categoryList;
  final Map dataMap;
  final bool isProductDetail;

  const GstWidgetProductForm(
      {super.key,
      required this.isProductDetail,
      required this.categoryList,
      required this.dataMap});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
            )
    ]);
  }
}
