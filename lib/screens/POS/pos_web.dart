import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/POS/pos_bloc.dart';
import 'package:saasify/bloc/POS/pos_event.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/POS/cart_product_model.dart';
import 'package:saasify/data/models/POS/product_with_categories_model.dart';
import 'package:saasify/screens/POS/widgets/products_grid.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';

class POSWeb extends StatelessWidget {
  final List<ProductsWithCategories> productsWithCategories;
  final List<CartItemModel> cartItems;
  final int selectedCategory;

  const POSWeb(
      {super.key,
      required this.productsWithCategories,
      required this.selectedCategory,
      required this.cartItems});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(spacingStandard),
        child: Row(children: [
          Expanded(
            flex: 5,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Wrap(
                  children: productsWithCategories
                      .map((e) => Padding(
                          padding: const EdgeInsets.only(right: spacingSmall),
                          child: InkWell(
                              onTap: () {
                                context.read<POSBloc>().selectedCategory =
                                    e.categoryId;
                                context.read<POSBloc>().add(ReloadPOS(
                                    productsWithCategories:
                                        productsWithCategories));
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: spacingSmall,
                                    vertical: spacingXXSmall),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: e.categoryId == selectedCategory
                                            ? AppColors.orange
                                            : AppColors.darkBlue),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Text(e.categoryName,
                                    style: Theme.of(context)
                                        .textTheme
                                        .categoryTextStyle
                                        .copyWith(
                                          color:
                                              e.categoryId == selectedCategory
                                                  ? AppColors.orange
                                                  : AppColors.darkBlue,
                                        )),
                              ))))
                      .toList()),
              Expanded(
                  child: ProductsGrid(
                      products: productsWithCategories
                          .firstWhere((element) =>
                              element.categoryId == selectedCategory)
                          .products,
                      selectedCategory: selectedCategory,
                      productsWithCategories: productsWithCategories,
                      cartItems: cartItems))
            ]),
          ),
          cartItems.isEmpty
              ? const SizedBox.shrink()
              : Expanded(
                  flex: 2,
                  child: Cart(
                      cartItems: cartItems,
                      productsWithCategories: productsWithCategories))
        ]));
  }
}

class Cart extends StatelessWidget {
  const Cart({
    super.key,
    required this.cartItems,
    required this.productsWithCategories,
  });

  final List<CartItemModel> cartItems;
  final List<ProductsWithCategories> productsWithCategories;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: spacingStandard, vertical: spacingStandard),
        child: const Text('Cart'),
      ),
      const Divider(),
      Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: spacingStandard, vertical: spacingStandard),
            child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final cartItem = cartItems[index];
                  return ListTile(
                    title: Text(cartItem.name),
                    subtitle: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              context.read<POSBloc>().add(RemoveCartItem(
                                  variantId: cartItem.id,
                                  productsWithCategories:
                                      productsWithCategories));
                            },
                            icon: const Icon(Icons.remove)),
                        Text(cartItem.count.toString()),
                        IconButton(
                            onPressed: () {
                              context.read<POSBloc>().add(AddCartItem(
                                  productName: cartItem.name,
                                  id: cartItem.id,
                                  productsWithCategories:
                                      productsWithCategories));
                            },
                            icon: const Icon(Icons.add)),
                      ],
                    ),
                    trailing: Text('₹${cartItem.cost}'),
                  );
                }),
          )),
      Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: spacingXSmall, vertical: spacingStandard),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: spacingXSmall, vertical: spacingStandard),
            child: Column(
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('Total: '),
                    Text(context.read<POSBloc>().billModel.totalAmount.toStringAsFixed(2)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      const SizedBox(height: spacingStandard),
      Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: spacingStandard, vertical: spacingStandard),
        child: PrimaryButton(onPressed: () {}, buttonTitle: 'Checkout'),
      )
    ]));
  }
}
