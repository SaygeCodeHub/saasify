import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/pos/billing_bloc.dart';
import 'package:saasify/bloc/pos/billing_event.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/billing/fetch_products_by_category_model.dart';
import 'package:saasify/screens/pos_new/widgets/product_grid.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/custom_text_field.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';

class ProductsSection extends StatelessWidget {
  const ProductsSection(
      {super.key,
      required this.productsByCategories,
      required this.categoryList});

  final List<CategoryWithProductsDatum> productsByCategories;
  final List<String> categoryList;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(
            top: spacingLarger,
            bottom: spacingHuge,
            right: spacingLarger,
            left: spacingXXLarge),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        color: AppColor.saasifyCementGrey,
                        border: Border.all(color: AppColor.saasifyWhite),
                        borderRadius: BorderRadius.circular(spacingMedium),
                      ),
                      child: DropdownButtonHideUnderline(
                          child: DropdownButton(
                              isDense: true,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: spacingStandard,
                                  vertical: spacingSmall),
                              borderRadius:
                                  BorderRadius.circular(spacingXMedium),
                              icon: const Icon(Icons.keyboard_arrow_down),
                              value: categoryList[context
                                  .read<BillingBloc>()
                                  .selectedCategoryIndex],
                              items: List.generate(
                                  categoryList.length,
                                  (index) => DropdownMenuItem(
                                      value: categoryList[index],
                                      child: Text(categoryList[index]))),
                              onChanged: (value) {
                                context
                                        .read<BillingBloc>()
                                        .selectedCategoryIndex =
                                    categoryList.indexOf(value!);
                                context.read<BillingBloc>().add(SelectCategory(
                                    productsByCategories:
                                        productsByCategories));
                              })))),
              const SizedBox(width: kGeneralButtonHeight),
              Expanded(
                flex:
                    context.read<BillingBloc>().customer.productList.isNotEmpty
                        ? 3
                        : 5,
                child: CustomTextField(
                    hintText: StringConstants.kSearchProduct,
                    onTextFieldChanged: (value) {}),
              )
            ],
          ),
          const SizedBox(height: spacingLarger),
          Wrap(
              direction: Axis.horizontal,
              children: List.generate(productsByCategories.length, (index) {
                return InkWell(
                  onTap: () {
                    context.read<BillingBloc>().selectedCategoryIndex = index;
                    context.read<BillingBloc>().add(SelectCategory(
                        productsByCategories: productsByCategories));
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(
                        right: spacingHuge, bottom: spacingLarge),
                    child: Text(
                        productsByCategories[index]
                                .categoryName
                                .trim()
                                .substring(0, 1)
                                .toUpperCase() +
                            productsByCategories[index]
                                .categoryName
                                .trim()
                                .substring(1)
                                .toLowerCase(),
                        style: Theme.of(context).textTheme.xTiniest.copyWith(
                            fontWeight: FontWeight.w600,
                            color: (index ==
                                    context
                                        .read<BillingBloc>()
                                        .selectedCategoryIndex)
                                ? AppColor.saasifyRed
                                : AppColor.saasifyBlack,
                            decoration: (index ==
                                    context
                                        .read<BillingBloc>()
                                        .selectedCategoryIndex)
                                ? TextDecoration.underline
                                : TextDecoration.none)),
                  ),
                );
              })),
          const Divider(),
          const SizedBox(height: kGeneralButtonHeight),
          (productsByCategories[
                      context.read<BillingBloc>().selectedCategoryIndex]
                  .products
                  .isNotEmpty)
              ? ProductGrid(productsByCategories: productsByCategories)
              : Expanded(
                  child: Center(
                      child: Text(StringConstants.kNoDataAvailable,
                          style: Theme.of(context)
                              .textTheme
                              .tinier
                              .copyWith(color: AppColor.saasifyLightGrey))))
        ]));
  }
}
