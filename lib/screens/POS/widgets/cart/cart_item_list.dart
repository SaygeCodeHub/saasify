import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/POS/pos_bloc.dart';
import 'package:saasify/bloc/POS/pos_event.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/POS/cart_product_model.dart';
import 'package:saasify/data/models/POS/product_with_categories_model.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({
    super.key,
    required this.cartItems,
    required this.productsWithCategories,
  });

  final List<CartItemModel> cartItems;
  final List<ProductsWithCategories> productsWithCategories;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: spacingXSmall, vertical: spacingStandard),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          icon: const Icon(Icons.warning,
                              color: AppColors.warningYellow),
                          content: const Text(
                              'Are you sure you want to clear the cart?'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                context.read<POSBloc>().add(ClearCart(
                                    productsWithCategories:
                                        productsWithCategories));
                                Navigator.pop(context);
                              },
                              child: const Text('Yes'),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('No'),
                            ),
                          ],
                        );
                      });
                },
                child: Text('Clear Cart',
                    style: Theme.of(context)
                        .textTheme
                        .errorSubtitleTextStyle
                        .copyWith(color: AppColors.errorRed))),
            Expanded(
              child: ListView.separated(
                  itemCount: cartItems.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: spacingXXSmall),
                  itemBuilder: (context, index) {
                    final cartItem = cartItems[index];
                    return Card(
                        child: Padding(
                            padding: const EdgeInsets.all(spacingSmall),
                            child: Column(children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(cartItem.name,
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelTextStyle
                                            .copyWith(
                                                color: AppColors.darkBlue,
                                                fontWeight: FontWeight.bold)),
                                    Text('₹${cartItem.cost}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .labelTextStyle
                                            .copyWith(color: AppColors.orange)),
                                  ]),
                              const SizedBox(height: spacingSmall),
                              Row(children: [
                                const Spacer(),
                                Container(
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: AppColors.darkBlue)),
                                    child: IntrinsicHeight(
                                        child: Row(children: [
                                      IconButton(
                                          constraints: const BoxConstraints(),
                                          padding: EdgeInsets.zero,
                                          onPressed: () {
                                            context.read<POSBloc>().add(
                                                RemoveCartItem(
                                                    variantId: cartItem.id,
                                                    productsWithCategories:
                                                        productsWithCategories));
                                          },
                                          icon: const Icon(Icons.remove,
                                              size: 20)),
                                      const VerticalDivider(
                                          color: AppColors.darkBlue, width: 0),
                                      SizedBox(
                                          width: 30,
                                          child: Center(
                                              child: Text(
                                                  cartItem.count.toString()))),
                                      const VerticalDivider(
                                          color: AppColors.darkBlue, width: 0),
                                      IconButton(
                                          constraints: const BoxConstraints(),
                                          padding: EdgeInsets.zero,
                                          onPressed: () {
                                            context.read<POSBloc>().add(
                                                AddCartItem(
                                                    productName: cartItem.name,
                                                    id: cartItem.id,
                                                    productsWithCategories:
                                                        productsWithCategories));
                                          },
                                          icon:
                                              const Icon(Icons.add, size: 20)),
                                    ])))
                              ])
                            ])));
                  }),
            ),
          ],
        ));
  }
}
