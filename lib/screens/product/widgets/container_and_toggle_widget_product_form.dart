import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/configs/app_theme.dart';
import '../../../bloc/product/product_bloc.dart';
import '../../../bloc/product/product_event.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/products/fetch_all_categories_model.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../widgets/toggle_switch_widget.dart';

class ContainerAndToggleWidgetProductForm extends StatelessWidget {
  final Map dataMap;
  final bool isEdit;
  final List<ProductCategory> categoryList;

  const ContainerAndToggleWidgetProductForm(
      {super.key,
      required this.dataMap,
      required this.isEdit,
      required this.categoryList});

  @override
  Widget build(BuildContext context) {
    return Visibility(
        visible: isEdit,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(children: [
            Container(
                padding: const EdgeInsets.symmetric(
                    vertical: spacingXSmall, horizontal: spacingXXSmall),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kCircularRadius),
                    color: (dataMap['draft'] ?? false)
                        ? AppColor.saasifyLightWhiteGrey
                        : AppColor.saasifyLighterGreen),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Icon(Icons.circle,
                      size: kCircleIconSize,
                      color: (dataMap['draft'] ?? false)
                          ? AppColor.saasifyLightGrey
                          : AppColor.saasifyGreen),
                  const SizedBox(width: spacingXXSmall),
                  Text((dataMap['draft'] ?? false) ? 'Draft' : 'Published',
                      style: Theme.of(context).textTheme.xxTiniest.copyWith(
                          color: (dataMap['draft'] ?? false)
                              ? AppColor.saasifyLightGrey
                              : AppColor.saasifyGreen))
                ]))
          ]),
          Row(children: [
            const Text(StringConstants.kWantToDeactivateProduct),
            ToggleSwitchWidget(
                activeColor: AppColor.saasifyLightDeepBlue,
                value: dataMap['variant_active'] ?? true,
                onChanged: (value) {
                  dataMap['variant_active'] = value;
                  context
                      .read<ProductBloc>()
                      .add(LoadForm(categoryList: categoryList));
                })
          ])
        ]));
  }
}
