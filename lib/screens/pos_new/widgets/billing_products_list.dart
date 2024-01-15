import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/pos/billing_bloc.dart';
import 'package:saasify/bloc/pos/billing_event.dart';
import 'package:saasify/configs/app_color.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/billing/fetch_products_by_category_model.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import 'billing_product_tile_body.dart';

class BillingProductsList extends StatelessWidget {
  final List<CategoryWithProductsDatum> productsByCategories;

  const BillingProductsList({super.key, required this.productsByCategories});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.end, children: [
          TextButton(
              onPressed: () {
                context.read<BillingBloc>().add(RemoveAllProduct(
                    productsByCategories: productsByCategories));
              },
              child: Text('Clear All',
                  style: Theme.of(context)
                      .textTheme
                      .xxTiniest
                      .copyWith(color: AppColor.saasifyRed))),
        ]),
        Expanded(
          child: Container(
              padding: const EdgeInsets.only(bottom: spacingStandard),
              decoration: BoxDecoration(
                  color: AppColor.saasifyWhite,
                  borderRadius: BorderRadius.circular(kCircularRadius)),
              child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  itemCount:
                      context.read<BillingBloc>().customer.productList.length,
                  shrinkWrap: true,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: spacingXSmall),
                  itemBuilder: (context, index) {
                    return Padding(
                        padding: const EdgeInsets.only(
                            right: spacingLarge,
                            top: spacingXLarge,
                            left: spacingSmall),
                        child: Row(children: [
                          SizedBox(
                            height: kImageHeight,
                            width: kImageHeight,
                            child: Image.network(
                              context
                                  .read<BillingBloc>()
                                  .customer
                                  .productList[index]
                                  .product
                                  .variants[0]
                                  .images[0],
                            ),
                          ),
                          const SizedBox(width: spacingLarge),
                          Expanded(
                              child: BillingProductTileBody(
                            selectedProduct: context
                                .read<BillingBloc>()
                                .customer
                                .productList[index],
                            productsByCategories: productsByCategories,
                          ))
                        ]));
                  })),
        ),
      ],
    ));
  }
}
