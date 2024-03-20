import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/POS/pos_bloc.dart';
import 'package:saasify/widgets/formWidgets/label_and_textfield_widget.dart';

class CartHeader extends StatelessWidget {
  const CartHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return LabelAndTextFieldWidget(
      hintText: 'Enter Customer Contact ',
      prefixIcon: const Icon(Icons.phone_android),
      onTextFieldChanged: (value) {
        context.read<POSBloc>().billModel.customerPhone = value ?? "";
      },
      validator: (value) {
        if (!(value == null || value.isEmpty) && value.length < 10) {
          return 'Please enter a valid phone number';
        }
        return null;
      },
    );
  }
}
