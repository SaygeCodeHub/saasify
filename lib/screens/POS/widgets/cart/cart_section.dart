import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/models/POS/cart_product_model.dart';
import 'package:saasify/data/models/POS/product_with_categories_model.dart';
import 'package:saasify/screens/POS/widgets/cart/cart_bill_section.dart';
import 'package:saasify/screens/POS/widgets/cart/cart_header.dart';
import 'package:saasify/screens/POS/widgets/cart/cart_item_list.dart';
import 'package:saasify/screens/POS/widgets/cart/cart_actions.dart';
import 'package:saasify/utils/globals.dart';

class Cart extends StatelessWidget {
  Cart({
    super.key,
    required this.cartItems,
    required this.productsWithCategories,
  });

  final List<CartItemModel> cartItems;
  final List<ProductsWithCategories> productsWithCategories;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < mobileBreakPoint;
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: isMobile ? mobileBodyPadding : spacingStandard,
                vertical: spacingStandard),
            child: const CartHeader(),
          )),
      const Divider(),
      Expanded(
          child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: isMobile ? mobileBodyPadding : spacingStandard),
        child: CartItemList(
            cartItems: cartItems,
            productsWithCategories: productsWithCategories),
      )),
      const SizedBox(height: spacingXXXLarge),
      Padding(
        padding: EdgeInsets.symmetric(
            horizontal: isMobile ? mobileBodyPadding : spacingStandard),
        child: CartBillSection(productsWithCategories: productsWithCategories),
      ),
      Padding(
        padding: EdgeInsets.symmetric(
            horizontal: isMobile ? mobileBodyPadding : spacingStandard,
            vertical: spacingXSmall),
        child: CartActions(formKey: _formKey, cartItems: cartItems),
      )
    ]);
  }
}
