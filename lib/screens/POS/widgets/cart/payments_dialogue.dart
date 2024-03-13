import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/POS/pos_bloc.dart';
import 'package:saasify/bloc/POS/pos_event.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/POS/cart_product_model.dart';
import 'package:saasify/utils/pdf/pdfFormats/cafe_bill_pdf.dart';
import 'package:saasify/utils/pdf/utils/bill_utils.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';
import 'package:saasify/widgets/formWidgets/label_and_textfield_widget.dart';

class PaymentsDialogue extends StatefulWidget {
  final List<CartItemModel> cartItems;

  const PaymentsDialogue({super.key, required this.cartItems});

  @override
  State<PaymentsDialogue> createState() => _PaymentsDialogueState();
}

class _PaymentsDialogueState extends State<PaymentsDialogue> {
  String selectedPaymentMethod = "";
  List<String> paymentMethods = ["Cash", "Card", "UPI"];
  String totalAmountReceived = "";

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          selectedPaymentMethod == ""
              ? const SizedBox.shrink()
              : IconButton(
                  onPressed: () {
                    setState(() {
                      selectedPaymentMethod = "";
                    });
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
          Text(selectedPaymentMethod == ""
              ? 'Select Payment Method'
              : selectedPaymentMethod),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close))
        ]),
        content: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 300, maxHeight: 300),
            child: selectedPaymentMethod == "Cash"
                ? Center(
                    child: Column(mainAxisSize: MainAxisSize.min, children: [
                      LabelAndTextFieldWidget(
                          label: 'Total Amount Received',
                          initialValue: totalAmountReceived,
                          onTextFieldChanged: (value) {
                            setState(() {
                              totalAmountReceived = value!;
                            });
                          }),
                      const SizedBox(height: spacingStandard),
                      Text("Change: ${getChange()}",
                          style: Theme.of(context)
                              .textTheme
                              .labelTextStyle
                              .copyWith(
                                  color: AppColors.darkBlue, fontSize: 16)),
                      const SizedBox(height: spacingStandard),
                      PrimaryButton(
                          onPressed: () {
                            context.read<POSBloc>().add(
                                Checkout(paymentMethod: selectedPaymentMethod));
                            generateCafePDF(context,
                                items: widget.cartItems
                                    .map((e) => MenuItem(
                                        itemName: e.name,
                                        quantity: e.quantity,
                                        price: e.cost.toDouble(),
                                        gstRate: 0))
                                    .toList(),
                                billModel: context.read<POSBloc>().billModel);
                            Navigator.pop(context);
                          },
                          buttonTitle: 'Checkout')
                    ]),
                  )
                : GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10),
                    itemCount: paymentMethods.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {
                            if (selectedPaymentMethod == "") {
                              setState(() {
                                selectedPaymentMethod = paymentMethods[index];
                              });
                            } else {
                              context.read<POSBloc>().add(Checkout(
                                  paymentMethod: paymentMethods[index]));
                              generateCafePDF(context,
                                  items: widget.cartItems
                                      .map((e) => MenuItem(
                                          itemName: e.name,
                                          quantity: e.quantity,
                                          price: e.cost.toDouble(),
                                          gstRate: 0))
                                      .toList(),
                                  billModel: context.read<POSBloc>().billModel);
                              Navigator.pop(context);
                            }
                          },
                          child: Card(
                              child: Center(
                                  child: Text(paymentMethods[index],
                                      style: Theme.of(context)
                                          .textTheme
                                          .labelTextStyle
                                          .copyWith(
                                              color: AppColors.darkBlue)))));
                    })));
  }

  String getChange() {
    double totalAmount = context.read<POSBloc>().billModel.totalAmount;
    double totalAmountReceived = double.parse(this.totalAmountReceived);
    return (totalAmountReceived - totalAmount).sign == -1
        ? "0.00"
        : (totalAmountReceived - totalAmount).toStringAsFixed(2);
  }
}
