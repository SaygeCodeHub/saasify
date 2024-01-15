import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/pos/billing_bloc.dart';
import 'package:saasify/bloc/pos/billing_event.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/billing/fetch_products_by_category_model.dart';
import 'package:saasify/screens/pos_new/widgets/variant_dialogue.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_spacing.dart';

class ProductGrid extends StatelessWidget {
  const ProductGrid({
    super.key,
    required this.productsByCategories,
  });

  final List<CategoryWithProductsDatum> productsByCategories;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: productsByCategories[
                context.read<BillingBloc>().selectedCategoryIndex]
            .products
            .length,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount:
                context.read<BillingBloc>().customer.productList.isNotEmpty
                    ? 5
                    : 7,
            childAspectRatio: 172 / 146),
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.all(spacingXSmall),
              child: InkWell(
                  onTap: () {
                    if (productsByCategories[context
                                .read<BillingBloc>()
                                .selectedCategoryIndex]
                            .products[index]
                            .variants
                            .length >
                        1) {
                      showDialog(
                          context: context,
                          builder: (context) => VariantDialogue(
                              productsByCategories: productsByCategories,
                              productIndex: index));
                    } else {
                      context.read<BillingBloc>().add(SelectProduct(
                          variantIndex: 0,
                          productsByCategories: productsByCategories,
                          product: productsByCategories[context
                                  .read<BillingBloc>()
                                  .selectedCategoryIndex]
                              .products[index]));
                    }
                  },
                  child: Container(
                      height: spacingXXXXHuge,
                      padding: const EdgeInsets.all(spacingXXSmall),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(spacingXMedium),
                        color: AppColor.saasifyLighterGrey,
                      ),
                      child: Column(children: [
                        Expanded(
                            child: Image.network(
                                productsByCategories[context
                                        .read<BillingBloc>()
                                        .selectedCategoryIndex]
                                    .products[index]
                                    .variants[0]
                                    .images[0],
                                fit: BoxFit.fill)),
                        const SizedBox(height: spacingXSmall),
                        Center(
                            child: Text(
                                productsByCategories[context
                                        .read<BillingBloc>()
                                        .selectedCategoryIndex]
                                    .products[index]
                                    .productName,
                                textAlign: TextAlign.center,
                                style: Theme.of(context).textTheme.xxTiniest,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2)),
                        const SizedBox(height: spacingXSmall),
                        Text(
                            '${productsByCategories[context.read<BillingBloc>().selectedCategoryIndex].products[index].variants[0].currency} ${productsByCategories[context.read<BillingBloc>().selectedCategoryIndex].products[index].variants[0].cost}',
                            style: Theme.of(context)
                                .textTheme
                                .xxTiniest
                                .copyWith(color: AppColor.saasifyLightDeepBlue))
                      ]))));
        });
  }
}
