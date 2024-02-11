import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/POS/pos_bloc.dart';
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: spacingSmall),
            child:
                Text('Cart', style: Theme.of(context).textTheme.labelTextStyle),
          ),
          const SizedBox(width: spacingStandard),
          Expanded(child: ContactTextField(
            onTextFieldChanged: (value) {
              context.read<POSBloc>().billModel.customerPhone = value ?? "";
            },
          ))
        ],
      ),
    );
  }
}
