import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/POS/pos_bloc.dart';
import 'package:saasify/bloc/POS/pos_event.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/POS/cart_product_model.dart';
import 'package:saasify/data/models/POS/product_with_categories_model.dart';
import 'package:saasify/screens/POS/widgets/variants_dialogue.dart';
import 'package:saasify/utils/formatters.dart';
import 'package:saasify/utils/globals.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({
    super.key,
    required this.products,
    required this.selectedCategory,
    required this.productsWithCategories,
    required this.cartItems,
  });

  final List<Product> products;
  final List<ProductsWithCategories> productsWithCategories;
  final int selectedCategory;
  final List<CartItemModel> cartItems;

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < mobileBreakPoint;
    bool isTab = MediaQuery.of(context).size.width < tabBreakPoint;
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: spacingStandard),
        child: GridView.extent(
            maxCrossAxisExtent: isMobile
                ? MediaQuery.of(context).size.width / 2
                : isTab
                    ? MediaQuery.of(context).size.width / 5
                    : MediaQuery.of(context).size.width / 7,
            childAspectRatio: isMobile ? 1.5 : 1.7,
            crossAxisSpacing: spacingSmall,
            mainAxisSpacing: spacingSmall,
            shrinkWrap: true,
            children: List.generate(
                products.length,
                (index) => InkWell(
                    onTap: () {
                      if (products[index].variants.length > 1) {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return VariantsDialogue(
                                  products: products,
                                  index: index,
                                  productsWithCategories:
                                      productsWithCategories);
                            });
                      } else {
                        context.read<POSBloc>().add(AddCartItem(
                            productsWithCategories: productsWithCategories,
                            variant: products[index].variants.first,
                            id: products[index].variants.first.variantId,
                            productName: products[index].productName));
                      }
                    },
                    child: Card(
                        child: Padding(
                            padding: const EdgeInsets.all(spacingSmall),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            child: SizedBox.square(
                                              child: Image.network(
                                                products[index]
                                                    .variants
                                                    .first
                                                    .image,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(width: spacingSmall),
                                          Expanded(
                                            flex: 7,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                    products[index].productName,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .productNameTextStyle,
                                                    maxLines: 1,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    textScaler:
                                                        TextScaler.linear(
                                                            isMobile
                                                                ? 0.8
                                                                : 1)),
                                                Text(
                                                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .descriptionTextStyle,
                                                    textScaler:
                                                        TextScaler.linear(
                                                            isMobile
                                                                ? 0.8
                                                                : 1)),
                                              ],
                                            ),
                                          ),
                                        ]),
                                  ),
                                  const SizedBox(height: spacingSmall),
                                  Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        formatAmount(
                                            products[index]
                                                .variants
                                                .first
                                                .cost
                                                .toDouble(),
                                            context),
                                        Text(
                                            "${products[index].variants.first.quantity} ${products[index].variants.first.unit}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .productCostTextStyle,
                                            textScaler: TextScaler.linear(
                                                isMobile ? 0.8 : 1))
                                      ])
                                ])))))));
  }
}
