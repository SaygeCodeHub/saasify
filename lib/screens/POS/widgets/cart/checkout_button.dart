import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';

class CheckoutButton extends StatelessWidget {
  const CheckoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: spacingXSmall, vertical: spacingStandard),
      child: PrimaryButton(onPressed: () {}, buttonTitle: 'Checkout'),
    );
  }
}
