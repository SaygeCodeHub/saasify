import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:saasify/configs/app_theme.dart';

import '../../configs/app_colors.dart';
import '../../configs/app_spacing.dart';
import '../../models/cart_model.dart';
import '../../models/category/product_categories.dart';
import '../../models/product/products.dart';
import 'cart_screen.dart';

class BillingScreen extends StatefulWidget {
  const BillingScreen({super.key});

  @override
  State<BillingScreen> createState() => _BillingScreenState();
}

class _BillingScreenState extends State<BillingScreen> {
  late String _selectedCategory;
  late List<ProductCategories> _categories;
  List<Cart> cart = [];
  Map<String, dynamic> cartDetailsMap = {};
  final productsBox = Hive.box<Products>('products');
  final TextEditingController _searchController = TextEditingController();
  List<Products> filteredProducts = [];

  Map getAmountAndQuantity(cart) {
    Map map = {'cost': 0.00};
    for (var cartItem in cart) {
      map['cost'] += cartItem.cost;
    }
    return map;
  }

  void filterProducts(String query) {
    setState(() {
      if (query.isEmpty) {
        filteredProducts = productsBox.values.toList();
      } else {
        filteredProducts = productsBox.values
            .where((product) =>
                product.name.toLowerCase().contains(query.toLowerCase()))
            .toList();
      }
    });
  }

  @override
  void initState() {
    _categories = Hive.box<ProductCategories>('categories').values.toList();
    _selectedCategory = _categories.isNotEmpty ? _categories.first.name : '';
    filteredProducts = productsBox.values.toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(labelText: 'Search'),
              onChanged: (value) {
                setState(() {
                  filterProducts(value);
                });
              },
            ),
          ),
          const SizedBox(height: spacingStandard),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: mobileBodyPadding),
            child: DropdownButtonFormField<String>(
              value: _selectedCategory,
              items: _categories.map((category) {
                return DropdownMenuItem<String>(
                  value: category.name,
                  child: Text(category.name),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedCategory = value!;
                });
              },
            ),
          ),
          const SizedBox(height: spacingLarger),
          Visibility(
            visible: productsBox.isNotEmpty,
            replacement: const Text('No Products!'),
            child: Expanded(
              child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: spacingStandard, horizontal: mobileBodyPadding),
                  child: WatchBoxBuilder(
                      box: productsBox,
                      builder: (context, box) {
                        final filteredProducts = box.values.where((product) {
                          return (product as Products).category ==
                              _selectedCategory;
                        }).toList();
                        return GridView.extent(
                            maxCrossAxisExtent:
                                MediaQuery.of(context).size.width / 2,
                            childAspectRatio: 1.5,
                            crossAxisSpacing: spacingSmall,
                            mainAxisSpacing: spacingSmall,
                            shrinkWrap: true,
                            children:
                                List.generate(filteredProducts.length, (index) {
                              final product =
                                  filteredProducts[index] as Products;
                              return InkWell(
                                  onTap: () {
                                    setState(() {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                                title: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(product.name),
                                                      IconButton(
                                                        onPressed: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        icon: const Icon(
                                                            Icons.close),
                                                      )
                                                    ]),
                                                content: SizedBox(
                                                    height: 300,
                                                    width: 300,
                                                    child: GridView.builder(
                                                        gridDelegate:
                                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                                                crossAxisCount:
                                                                    2,
                                                                crossAxisSpacing:
                                                                    10,
                                                                mainAxisSpacing:
                                                                    10),
                                                        itemCount: product
                                                            .variants.length,
                                                        itemBuilder: (context,
                                                            variantIndex) {
                                                          return InkWell(
                                                            onTap: () {
                                                              // setState(() {
                                                              //   bool
                                                              //       variantExistsInCart =
                                                              //       false;
                                                              //   int cartIndex =
                                                              //       0;
                                                              //   for (int i = 0;
                                                              //       i < cart.length;
                                                              //       i++) {
                                                              //     if (cart[i].name ==
                                                              //             product
                                                              //                 .name &&
                                                              //         cart[i].quantity ==
                                                              //             product
                                                              //                 .variants[variantIndex]
                                                              //                 .size) {
                                                              //       variantExistsInCart =
                                                              //           true;
                                                              //       cartIndex =
                                                              //           i;
                                                              //       break;
                                                              //     }
                                                              //   }
                                                              //   if (variantExistsInCart) {
                                                              //     (cart[cartIndex]
                                                              //         .count += 1);
                                                              //     cart[cartIndex]
                                                              //         .cost = (cart[
                                                              //                 index]
                                                              //             .count *
                                                              //         product
                                                              //             .variants[
                                                              //                 variantIndex]
                                                              //             .cost);
                                                              //   } else {
                                                              //     cartDetailsMap[
                                                              //         'count'] = 1;
                                                              //     cart.add(Cart(
                                                              //         cost: product
                                                              //             .variants[
                                                              //                 variantIndex]
                                                              //             .cost,
                                                              //         name: product
                                                              //             .name,
                                                              //         quantity: product
                                                              //             .variants[
                                                              //                 variantIndex]
                                                              //             .size,
                                                              //         count: 1,
                                                              //         variantCost: product
                                                              //             .variants[
                                                              //                 variantIndex]
                                                              //             .cost));
                                                              //   }
                                                              //   Navigator.pop(
                                                              //       context);
                                                              // });
                                                            },
                                                            child: Card(
                                                                child: Center(
                                                                    child:
                                                                        Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                // Text(
                                                                //     product
                                                                //         .variants[
                                                                //             variantIndex]
                                                                //         .size,
                                                                //     style: Theme.of(
                                                                //             context)
                                                                //         .textTheme
                                                                //         .labelTextStyle
                                                                //         .copyWith(
                                                                //             color:
                                                                //                 AppColors.darkBlue,
                                                                //             fontSize: 16)),
                                                                Text(
                                                                    "₹ ${product.variants[variantIndex].cost.toString()}",
                                                                    style: Theme.of(
                                                                            context)
                                                                        .textTheme
                                                                        .labelTextStyle
                                                                        .copyWith(
                                                                            color:
                                                                                AppColors.orange,
                                                                            fontSize: 14))
                                                              ],
                                                            ))),
                                                          );
                                                        })));
                                          });
                                    });
                                  },
                                  child: Card(
                                      child: Padding(
                                          padding: const EdgeInsets.all(
                                              spacingSmall),
                                          child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                  child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(4),
                                                          child:
                                                              SizedBox.square(
                                                            child:
                                                                Image.network(
                                                              "https://media.istockphoto.com/id/1398630614/photo/bacon-cheeseburger-on-a-toasted-bun.jpg?s=1024x1024&w=is&k=20&c=rXM2ry9bme764bKBGagwq4jYdjr7q98UiJLyHrl6BUU=",
                                                              fit: BoxFit.cover,
                                                              height: 50,
                                                              width: 50,
                                                            ),
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            width:
                                                                spacingSmall),
                                                        Expanded(
                                                          flex: 7,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Text(product.name,
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .productNameTextStyle,
                                                                  maxLines: 1,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  textScaler:
                                                                      const TextScaler
                                                                          .linear(
                                                                          0.8)),
                                                              const SizedBox(
                                                                  height:
                                                                      spacingSmallest),
                                                              Text("",
                                                                  maxLines: 2,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  style: Theme.of(
                                                                          context)
                                                                      .textTheme
                                                                      .descriptionTextStyle,
                                                                  textScaler:
                                                                      const TextScaler
                                                                          .linear(
                                                                          0.8)),
                                                            ],
                                                          ),
                                                        ),
                                                      ]),
                                                ),
                                                const SizedBox(
                                                    height: spacingSmall),
                                                Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      RichText(
                                                          text: TextSpan(
                                                              text: '₹ ',
                                                              style: Theme.of(
                                                                      context)
                                                                  .textTheme
                                                                  .descriptionTextStyle,
                                                              children: <TextSpan>[
                                                            TextSpan(
                                                                text: '200',
                                                                style: Theme.of(
                                                                        context)
                                                                    .textTheme
                                                                    .productCostTextStyle)
                                                          ]))
                                                    ])
                                              ]))));
                            }));
                      })),
            ),
          ),
          const Divider(height: 0),
          Visibility(
            visible: cart.isNotEmpty,
            child: Container(
              padding: const EdgeInsets.all(spacingSmallest),
              child: Row(
                children: [
                  Text('Total: ${getAmountAndQuantity(cart)['cost'] ?? 0.00}'),
                  const Spacer(),
                  TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CartScreen(cart: cart)));
                      },
                      child: const Text('Settle Bill'))
                ],
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
