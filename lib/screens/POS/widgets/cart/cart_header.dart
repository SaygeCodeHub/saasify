import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/widgets/form/form_input_fields.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: spacingStandard, vertical: spacingStandard),
      child: Row(
        children: [
          Text('Cart', style: Theme.of(context).textTheme.labelTextStyle),
          const SizedBox(width: spacingStandard),
          Expanded(child: ContactTextField())
        ],
      ),
    );
  }
}
