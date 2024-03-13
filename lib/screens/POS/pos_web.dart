import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/POS/pos_bloc.dart';
import 'package:saasify/bloc/POS/pos_event.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/POS/cart_product_model.dart';
import 'package:saasify/data/models/POS/product_with_categories_model.dart';
import 'package:saasify/screens/POS/widgets/cart/cart_section.dart';
import 'package:saasify/screens/POS/widgets/products_grid.dart';
import 'package:saasify/utils/globals.dart';

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
    bool isTab = MediaQuery.of(context).size.width < tabBreakPoint;
    return Padding(
        padding: const EdgeInsets.all(spacingStandard),
        child: Row(children: [
          Expanded(
            flex: isTab ? 3 : 5,
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
                                margin: const EdgeInsets.only(
                                    bottom: spacingXSmall),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: e.categoryId == selectedCategory
                                            ? AppColors.orange
                                            : AppColors.darkBlue),
                                    borderRadius: BorderRadius.circular(8)),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.network(e.categoryIconImage,
                                        width: 15, height: 15),
                                    const SizedBox(width: spacingXSmall),
                                    Text(e.categoryName,
                                        style: Theme.of(context)
                                            .textTheme
                                            .categoryTextStyle
                                            .copyWith(
                                              color: e.categoryId ==
                                                      selectedCategory
                                                  ? AppColors.orange
                                                  : AppColors.darkBlue,
                                            )),
                                  ],
                                ),
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
                  child: Card(
                    child: Cart(
                        cartItems: cartItems,
                        productsWithCategories: productsWithCategories),
                  ))
        ]));
  }
}
