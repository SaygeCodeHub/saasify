import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/pos/billing_bloc.dart';
import 'package:saasify/bloc/pos/billing_event.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/billing/fetch_products_by_category_model.dart';
import 'package:saasify/data/models/billing/selected_product_model.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';

class BillingProductTileBody extends StatelessWidget {
  final SelectedProductModel selectedProduct;
  final List<CategoryWithProductsDatum> productsByCategories;

  const BillingProductTileBody(
      {super.key,
      required this.selectedProduct,
      required this.productsByCategories});

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Text(
                selectedProduct.product.productName,
                maxLines: 2,
                style: Theme.of(context).textTheme.xTiniest,
              )),
              Text(
                  '${selectedProduct.product.variants[0].currency} ${selectedProduct.product.variants[0].cost}',
                  style: Theme.of(context)
                      .textTheme
                      .xTiniest
                      .copyWith(color: AppColor.saasifyPaleBlue))
            ],
          ),
          const SizedBox(height: spacingXXSmall),
          Text(
              '${selectedProduct.product.variants[0].quantity} ${selectedProduct.product.variants[0].unit}',
              style: Theme.of(context)
                  .textTheme
                  .xxTiniest
                  .copyWith(color: AppColor.saasifyPaleBlack)),
          const SizedBox(height: spacingXXSmall),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            InkWell(
                onTap: () {
                  context.read<BillingBloc>().add(RemoveProduct(
                      productsByCategories: productsByCategories,
                      product: selectedProduct.product));
                },
                child: Container(
                    height: kCounterContainerSize,
                    width: kCounterContainerSize,
                    decoration: BoxDecoration(
                        color: AppColor.saasifyLightGreyBlue,
                        border:
                            Border.all(color: AppColor.saasifyLightPaleGrey)),
                    child: const Center(
                        child: Icon(Icons.remove, size: kGeneralRadius)))),
            SizedBox(
              height: kCounterContainerSize,
              width: kStockContainerSize,
              child: Center(
                  child: Text(selectedProduct.count.toString(),
                      style: Theme.of(context).textTheme.xTiniest)),
            ),
            InkWell(
                onTap: () {
                  context.read<BillingBloc>().add(SelectProduct(
                      variantIndex: 0,
                      productsByCategories: productsByCategories,
                      product: selectedProduct.product));
                },
                child: Container(
                    height: kCounterContainerSize,
                    width: kCounterContainerSize,
                    decoration: BoxDecoration(
                      color: AppColor.saasifyLightGreyBlue,
                      border: Border.all(color: AppColor.saasifyLightPaleGrey),
                    ),
                    child: const Center(
                        child: Icon(
                      Icons.add,
                      size: kGeneralRadius,
                    ))))
          ])
        ]);
  }
}
