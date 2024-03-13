import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/screens/POS/widgets/cart/payments_dialogue.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';

class CartActions extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const CartActions({
    super.key,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: PrimaryButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {}
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
                        return const PaymentsDialogue();
                      });
                }
              },
              buttonTitle: 'Checkout'),
        ),
      ],
    );
  }
}
