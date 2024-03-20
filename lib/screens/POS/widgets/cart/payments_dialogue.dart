import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/POS/pos_bloc.dart';
import 'package:saasify/bloc/POS/pos_event.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/POS/cart_product_model.dart';
import 'package:saasify/utils/globals.dart';
import 'package:saasify/utils/pdf/pdfFormats/cafe_bill_pdf.dart';
import 'package:saasify/utils/pdf/utils/bill_utils.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';
import 'package:saasify/widgets/formWidgets/label_and_textfield_widget.dart';
import 'package:saasify/widgets/num_pad.dart';

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
    final isMobile = MediaQuery.of(context).size.width < mobileBreakPoint;
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
          Text(
              selectedPaymentMethod == ""
                  ? 'Select Payment Method'
                  : selectedPaymentMethod,
              textScaler: TextScaler.linear(isMobile ? 0.8 : 1)),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close))
        ]),
        content: SizedBox(
            width: 300,
            height: selectedPaymentMethod == "Cash" ? 450 : 300,
            child: selectedPaymentMethod == "Cash"
                ? Column(mainAxisSize: MainAxisSize.min, children: [
                    LabelAndTextFieldWidget(
                        label: 'Total Amount Received',
                        initialValue: totalAmountReceived,
                        onTextFieldChanged: (value) {
                          setState(() {
                            totalAmountReceived = value!;
                          });
                        }),
                    isMobile
                        ? const SizedBox(height: spacingStandard)
                        : const SizedBox(height: spacingStandard),
                    Text(
                        "Amount to return: ${(totalAmountReceived.isEmpty) ? '0.00' : getChange()}",
                        style: Theme.of(context)
                            .textTheme
                            .labelTextStyle
                            .copyWith(color: AppColors.darkBlue, fontSize: 16)),
                    const SizedBox(height: spacingStandard),
                    NumPad(
                        onKeyPressed: (value) {
                          setState(() {
                            totalAmountReceived = value;
                          });
                        },
                        value: totalAmountReceived,
                        isMobile: isMobile),
                    const Spacer(),
                    PrimaryButton(
                        onPressed: () {
                          context.read<POSBloc>().add(
                              Checkout(paymentMethod: selectedPaymentMethod));
                          generateCafePDF(context,
                              items: widget.cartItems.map((e) {
                                return MenuItem(
                                    itemName: e.name,
                                    quantity: e.count,
                                    price: e.variantCost,
                                    gstRate: 0,
                                    totalCost: e.cost);
                              }).toList(),
                              billModel: context.read<POSBloc>().billModel);
                          Navigator.pop(context);
                        },
                        buttonTitle: 'Settle bill')
                  ])
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
                                          quantity: e.count,
                                          price: e.variantCost,
                                          gstRate: 0,
                                          totalCost: e.cost))
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
    double totalAmountReceived =
        double.tryParse(this.totalAmountReceived) ?? 0.0;
    setState(() {});
    return (totalAmountReceived - totalAmount).sign == -1
        ? "0.00"
        : (totalAmountReceived - totalAmount).toStringAsFixed(2);
  }
}
