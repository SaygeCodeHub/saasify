import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/POS/pos_bloc.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/data/models/POS/cart_product_model.dart';
import 'package:saasify/screens/POS/widgets/cart/payments_dialogue.dart';
import 'package:saasify/utils/pdf/pdfFormats/cafe_bill_pdf.dart';
import 'package:saasify/utils/pdf/utils/bill_utils.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';

class CartActions extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final List<CartItemModel> cartItems;

  const CartActions({
    super.key,
    required this.formKey,
    required this.cartItems,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: PrimaryButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  generateCafePDF(context,
                      items: cartItems.map((e) {
                        return MenuItem(
                            itemName: e.name,
                            quantity: e.count,
                            price: e.variantCost,
                            gstRate: 0,
                            totalCost: e.cost);
                      }).toList(),
                      billModel: context.read<POSBloc>().billModel);
                }
              },
              buttonTitle: 'Print KOT'),
        ),
        const SizedBox(width: spacingSmall),
        Expanded(
          child: PrimaryButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return PaymentsDialogue(cartItems: cartItems);
                      });
                }
              },
              buttonTitle: 'Checkout'),
        ),
      ],
    );
  }
}
