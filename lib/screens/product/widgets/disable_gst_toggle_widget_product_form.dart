import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/configs/app_theme.dart';
import '../../../bloc/product/product_bloc.dart';
import '../../../bloc/product/product_event.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_spacing.dart';
import 'package:saasify/data/models/products/fetch_all_categories_model.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../widgets/toggle_switch_widget.dart';

class DisableGstToggleWidgetProductForm extends StatelessWidget {
  final List<ProductCategory> categoryList;
  final Map dataMap;
  final bool isProductDetail;

  const DisableGstToggleWidgetProductForm(
      {super.key,
      required this.isProductDetail,
      required this.categoryList,
      required this.dataMap});

  @override
  Widget build(BuildContext context) {
    return Row(children: [
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
    ]);
  }
}
