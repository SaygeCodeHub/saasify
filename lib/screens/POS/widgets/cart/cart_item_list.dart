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
                                const SizedBox(height: spacingXXSmall),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: AppColors.darkGrey)),
                                          child: IntrinsicHeight(
                                              child: Row(children: [
                                            IconButton(
                                                constraints:
                                                    const BoxConstraints(),
                                                padding: EdgeInsets.zero,
                                                onPressed: () {
                                                  context.read<POSBloc>().add(
                                                      RemoveCartItem(
                                                          variantId:
                                                              cartItem.id,
                                                          productsWithCategories:
                                                              productsWithCategories));
                                                },
                                                icon: const Icon(Icons.remove,
                                                    size: 20)),
                                            const VerticalDivider(
                                                color: AppColors.darkGrey,
                                                width: 0),
                                            SizedBox(
                                                width: 30,
                                                child: Center(
                                                    child: Text(cartItem.count
                                                        .toString()))),
                                            const VerticalDivider(
                                                color: AppColors.darkGrey,
                                                width: 0),
                                            IconButton(
                                                constraints:
                                                    const BoxConstraints(),
                                                padding: EdgeInsets.zero,
                                                onPressed: () {
                                                  context.read<POSBloc>().add(
                                                      AddCartItem(
                                                          productName:
                                                              cartItem.name,
                                                          id: cartItem.id,
                                                          productsWithCategories:
                                                              productsWithCategories));
                                                },
                                                icon: const Icon(Icons.add,
                                                    size: 20)),
                                          ]))),
                                      formatAmount(
                                          cartItem.cost.toDouble(), context,
                                          count: cartItem.count),

                                      // Text(cartItem.quantity.toString() + cartItem.unit,
                                      //     style: Theme.of(context)
                                      //         .textTheme
                                      //         .descriptionTextStyle)
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
