import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/models/POS/cart_product_model.dart';
import 'package:saasify/data/models/POS/product_with_categories_model.dart';
import 'package:saasify/screens/POS/widgets/cart/cart_bill_section.dart';
import 'package:saasify/screens/POS/widgets/cart/cart_header.dart';
import 'package:saasify/screens/POS/widgets/cart/cart_item_list.dart';
import 'package:saasify/screens/POS/widgets/cart/checkout_button.dart';

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
      const CartHeader(),
      const Divider(),
      Expanded(
          child: CartItemList(
              cartItems: cartItems,
              productsWithCategories: productsWithCategories)),
      const CartBillSection(),
      const SizedBox(height: spacingStandard),
      const CheckoutButton()
    ]));
  }
}
