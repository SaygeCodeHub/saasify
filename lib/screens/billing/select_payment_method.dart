import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:saasify/configs/app_theme.dart';

import '../../configs/app_colors.dart';
import '../../configs/app_spacing.dart';
import '../home/home_screen.dart';
import 'number_pad.dart';

class SelectPaymentMethod extends StatefulWidget {
  final double totalAmount;
  final Map<String, dynamic> billDetailsMap;

  const SelectPaymentMethod(
      {super.key, required this.totalAmount, required this.billDetailsMap});

  @override
  State<SelectPaymentMethod> createState() => _SelectPaymentMethodState();
}

class _SelectPaymentMethodState extends State<SelectPaymentMethod> {
  String selectedPaymentMethod = "";
  List<String> paymentMethods = ["Cash", "Card", "UPI"];
  String totalAmountReceived = "";
  final TextEditingController _textEditingController = TextEditingController();

  String getChange() {
    double totalAmountReceived =
        double.tryParse(this.totalAmountReceived) ?? 0.0;
    setState(() {});
    return (totalAmountReceived - widget.totalAmount).sign == -1
        ? "0.00"
        : (totalAmountReceived - widget.totalAmount).toStringAsFixed(2);
  }

  @override
  Widget build(BuildContext context) {
    _textEditingController.selection = TextSelection.fromPosition(
        TextPosition(offset: _textEditingController.text.length));
    _textEditingController.text = totalAmountReceived;
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
              textScaler: const TextScaler.linear(0.8)),
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close))
        ]),
        content: SizedBox(
            width: 300,
            height: 450,
            child: (selectedPaymentMethod == "Cash")
                ? Column(mainAxisSize: MainAxisSize.min, children: [
                    TextField(
                      controller: _textEditingController,
                      decoration: const InputDecoration(
                        labelText: 'Total Amount Received',
                      ),
                      onChanged: (value) {
                        setState(() {
                          totalAmountReceived = value;
                          _textEditingController.text = totalAmountReceived;
                        });
                      },
                    ),
                    const SizedBox(height: spacingStandard),
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
                        isMobile: true),
                    const Spacer(),
                    ElevatedButton(
                        onPressed: () {
                          final chatDataBox =
                              Hive.box<Map<String, dynamic>>('cartData');
                          final chatMap = widget.billDetailsMap;
                          chatDataBox.put('chat', chatMap);
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const HomeScreen()));
                        },
                        child: const Text('Settle bill'))
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
}
