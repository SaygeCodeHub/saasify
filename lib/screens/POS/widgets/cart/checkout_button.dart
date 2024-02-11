import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/POS/pos_bloc.dart';
import 'package:saasify/bloc/POS/pos_event.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';

class CheckoutButton extends StatelessWidget {
  final GlobalKey<FormState> formKey;

  const CheckoutButton({
    super.key,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    List<String> paymentMethods = [
      "Cash",
      "Card",
      "UPI",
      "Net Banking",
      "Wallet"
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: spacingXSmall, vertical: spacingStandard),
      child: PrimaryButton(
          onPressed: () {
            if (formKey.currentState!.validate()) {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                        title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Select Payment Method"),
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: const Icon(Icons.close),
                              )
                            ]),
                        content: SizedBox(
                            height: 300,
                            width: 300,
                            child: GridView.builder(
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10),
                                itemCount: paymentMethods.length,
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      context.read<POSBloc>().add(Checkout(
                                          paymentMethod:
                                              paymentMethods[index]));
                                      Navigator.pop(context);
                                    },
                                    child: Card(
                                        child: Center(
                                          child: Text(paymentMethods[index],
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelTextStyle
                                                  .copyWith(
                                                      color:
                                                          AppColors.darkBlue)),
                                        )),
                                  );
                                })));
                  });
            }
          },
          buttonTitle: 'Checkout'),
    );
  }
}
