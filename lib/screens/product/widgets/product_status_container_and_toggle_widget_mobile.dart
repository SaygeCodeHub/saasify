import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/configs/app_theme.dart';
import '../../../bloc/product/product_bloc.dart';
import '../../../bloc/product/product_event.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/products/product_list_model.dart';
import '../../../widgets/toggle_switch_widget.dart';

class ProductStatusContainerAndToggleWidgetMobile extends StatelessWidget {
  final ProductWithVariant productList;

  const ProductStatusContainerAndToggleWidgetMobile(
      {super.key, required this.productList});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Container(
          padding: const EdgeInsets.symmetric(
              vertical: spacingXSmall, horizontal: spacingXXSmall),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kGeneralRadius),
              color: (productList.draft)
                  ? AppColor.saasifyLightWhiteGrey
                  : AppColor.saasifyLighterGreen),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            Icon(Icons.circle,
                size: kCircleIcon,
                color: (productList.draft)
                    ? AppColor.saasifyLightGrey
                    : AppColor.saasifyGreen),
            const SizedBox(width: spacingXXSmall),
            Text((productList.draft) ? 'Draft' : 'Published',
                style: Theme.of(context).textTheme.xxTiniest.copyWith(
                    color: (productList.draft)
                        ? AppColor.saasifyLightGrey
                        : AppColor.saasifyGreen))
          ])),
      ToggleSwitchWidget(
          activeColor: AppColor.saasifyLightDeepBlue,
          value: (productList.draft) ? false : productList.variantActive,
          onChanged: (productList.draft)
              ? null
              : (value) {
                  Map productDetails = productList.toJson();
                  productDetails['variant_active'] = value;
                  context
                      .read<ProductBloc>()
                      .add(EditProduct(productDetailsMap: productDetails));
                })
    ]);
  }
}
