import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/POS/pos_bloc.dart';
import 'package:saasify/bloc/POS/pos_event.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/POS/cart_product_model.dart';
import 'package:saasify/data/models/POS/product_with_categories_model.dart';
import 'package:saasify/screens/POS/widgets/variants_dialogue.dart';
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
    return Visibility(
      visible: products.isNotEmpty,
      replacement: const Center(child: Text('No Products!')),
      child: Padding(
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
                                                  "https://media.istockphoto.com/id/1398630614/photo/bacon-cheeseburger-on-a-toasted-bun.jpg?s=1024x1024&w=is&k=20&c=rXM2ry9bme764bKBGagwq4jYdjr7q98UiJLyHrl6BUU=",
                                                  fit: BoxFit.cover,
                                                  height: (isMobile) ? 50 : 100,
                                                  width: (isMobile) ? 50 : 100,
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
                                                      products[index]
                                                          .productName,
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
                                                  const SizedBox(
                                                      height: spacingSmallest),
                                                  Text(
                                                      products[index]
                                                          .description,
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
                                          RichText(
                                              text: TextSpan(
                                                  text: '₹ ',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .descriptionTextStyle,
                                                  children: <TextSpan>[
                                                TextSpan(
                                                    text: products[index]
                                                        .variants
                                                        .first
                                                        .cost
                                                        .toString(),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .productCostTextStyle)
                                              ]))
                                        ])
                                  ]))))))),
    );
  }
}
