import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/POS/pos_bloc.dart';
import 'package:saasify/bloc/POS/pos_event.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/POS/cart_product_model.dart';
import 'package:saasify/data/models/POS/product_with_categories_model.dart';
import 'package:saasify/utils/formatters.dart';
import 'package:saasify/widgets/alertDialogs/warning_alert_dialogue.dart';

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        TextButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return WarningAlertDialogue(
                        description: "Are you sure you want to clear the cart?",
                        onPressed: () {
                          context.read<POSBloc>().showCart = false;
                          context.read<POSBloc>().add(ClearCart(
                              productsWithCategories: productsWithCategories));
                          Navigator.pop(context);
                        });
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
                return Padding(
                    padding: const EdgeInsets.all(spacingSmall),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: SizedBox.square(
                            dimension: 70,
                            child: Image.network(
                              cartItem.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(width: spacingSmall),
                        Expanded(
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(cartItem.name,
                                    style: Theme.of(context)
                                        .textTheme
                                        .productNameTextStyle),
                                Text("description",
                                    style: Theme.of(context)
                                        .textTheme
                                        .variantNameTextStyle),
                                const SizedBox(height: spacingXSmall),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            width: 80,
                                            height: 27,
                                            decoration: BoxDecoration(
                                                color: AppColors.lighterGrey,
                                                border: Border.all(
                                                    color: AppColors.grey),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Center(
                                                child: Text(
                                                    cartItem.count.toString())),
                                          ),
                                          Positioned(
                                            left: -0.3,
                                            child: InkWell(
                                              onTap: () {
                                                context.read<POSBloc>().add(
                                                    RemoveCartItem(
                                                        variantId: cartItem.id,
                                                        productsWithCategories:
                                                            productsWithCategories));
                                              },
                                              child: Container(
                                                height: 27,
                                                width: 27,
                                                decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: AppColors
                                                            .lighterGrey
                                                            .withOpacity(0.2),
                                                        offset: const Offset(
                                                            4.0, 4.0),
                                                        blurRadius: 2.0,
                                                        spreadRadius: 1.0,
                                                      )
                                                    ],
                                                    color: AppColors.white,
                                                    border: Border.all(
                                                        color:
                                                            AppColors.darkGrey),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25)),
                                                child: const Icon(Icons.remove,
                                                    size: 15),
                                              ),
                                            ),
                                          ),
                                          Positioned(
                                            left: 52,
                                            child: InkWell(
                                              onTap: () {
                                                context.read<POSBloc>().add(
                                                    AddCartItem(
                                                        productName:
                                                            cartItem.name,
                                                        id: cartItem.id,
                                                        productsWithCategories:
                                                            productsWithCategories));
                                              },
                                              child: Container(
                                                height: 27,
                                                width: 27,
                                                decoration: BoxDecoration(
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: AppColors
                                                            .lighterGrey
                                                            .withOpacity(0.2),
                                                        offset: const Offset(
                                                            4.0, 4.0),
                                                        blurRadius: 5.0,
                                                        spreadRadius: 1.0,
                                                      )
                                                    ],
                                                    color: AppColors.white,
                                                    border: Border.all(
                                                        color:
                                                            AppColors.darkGrey),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25)),
                                                child: const Icon(Icons.add,
                                                    size: 15,
                                                    color: AppColors.orange),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      formatAmount(
                                          cartItem.cost.toDouble(), context,
                                          count: cartItem.count)
                                    ])
                              ]),
                        ),
                      ],
                    ));
              }),
        ),
      ],
    );
  }
}
