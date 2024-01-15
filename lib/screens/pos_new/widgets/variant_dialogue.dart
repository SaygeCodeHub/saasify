import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/pos/billing_bloc.dart';
import 'package:saasify/bloc/pos/billing_event.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/billing/fetch_products_by_category_model.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_spacing.dart';

class VariantDialogue extends StatelessWidget {
  const VariantDialogue({
    super.key,
    required this.productsByCategories,
    required this.productIndex,
  });

  final int productIndex;
  final List<CategoryWithProductsDatum> productsByCategories;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(spacingXMedium)),
        contentPadding: const EdgeInsets.all(spacingXHuge),
        content: SizedBox(
            height: kDialogueWidth,
            width: kDialogueWidth,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(StringConstants.kChooseVariant,
                    style: Theme.of(context).textTheme.tiniest),
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.close))
              ]),
              const SizedBox(height: spacingXLarge),
              Expanded(
                  child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: GridView.builder(
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 1.2),
                          itemCount: productsByCategories[context
                                  .read<BillingBloc>()
                                  .selectedCategoryIndex]
                              .products[productIndex]
                              .variants
                              .length,
                          itemBuilder: (context, index) {
                            return Padding(
                                padding: const EdgeInsets.all(spacingXMedium),
                                child: InkWell(
                                  onTap: () {
                                    context.read<BillingBloc>().add(
                                        SelectProduct(
                                            variantIndex: index,
                                            productsByCategories:
                                                productsByCategories,
                                            product: productsByCategories[
                                                    context
                                                        .read<BillingBloc>()
                                                        .selectedCategoryIndex]
                                                .products[productIndex]));
                                    Navigator.pop(context);
                                  },
                                  child: Container(
                                      padding:
                                          const EdgeInsets.all(spacingSmallest),
                                      decoration: BoxDecoration(
                                          color: AppColor.saasifyCementGrey,
                                          borderRadius: BorderRadius.circular(
                                              spacingXMedium)),
                                      child: Column(
                                        children: [
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.all(
                                                  spacingSmall),
                                              child: Image.network(
                                                  productsByCategories[context
                                                          .read<BillingBloc>()
                                                          .selectedCategoryIndex]
                                                      .products[productIndex]
                                                      .variants[index]
                                                      .images[0]),
                                            ),
                                          ),
                                          const SizedBox(height: spacingXSmall),
                                          Center(
                                              child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                Text(
                                                    productsByCategories[context
                                                            .read<BillingBloc>()
                                                            .selectedCategoryIndex]
                                                        .products[productIndex]
                                                        .variants[index]
                                                        .quantity
                                                        .toString(),
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.center,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .xxTiniest),
                                                const SizedBox(
                                                    width: spacingXSmall),
                                                Text(
                                                    productsByCategories[context
                                                            .read<BillingBloc>()
                                                            .selectedCategoryIndex]
                                                        .products[productIndex]
                                                        .variants[index]
                                                        .unit
                                                        .toString(),
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textAlign: TextAlign.center,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .xxTiniest),
                                              ])),
                                          const SizedBox(height: spacingXSmall),
                                          Text(
                                              '${productsByCategories[context.read<BillingBloc>().selectedCategoryIndex].products[productIndex].variants[index].currency} ${productsByCategories[context.read<BillingBloc>().selectedCategoryIndex].products[productIndex].variants[index].cost.toString()}',
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              textAlign: TextAlign.center,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .xxTiniest),
                                          const SizedBox(height: spacingSmall)
                                        ],
                                      )),
                                ));
                          })))
            ])));
  }
}
