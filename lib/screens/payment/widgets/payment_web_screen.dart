import 'package:flutter/material.dart';
import 'package:saasify/screens/payment/widgets/payment_type_gridview.dart';

import '../../../configs/app_spacing.dart';
import '../../../data/models/payment/fetch_all_payment_method.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../widgets/custom_page_header.dart';
import '../../dashboard/dashboard_screen.dart';
import 'add_payment_method_popup.dart';

class PaymentWebScreen extends StatelessWidget {
  const PaymentWebScreen({
    super.key,
    required this.paymentType,
  });

  final List<PaymentData> paymentType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          right: spacingXHuge,
          top: spacingXMedium,
          bottom: spacingXHuge,
          left: spacingXHuge),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomPageHeader(
            titleText: StringConstants.kPaymentType,
            onBack: () {
              Navigator.pushReplacementNamed(
                  context, DashboardsScreen.routeName);
            },
            backIconVisible: true,
            buttonTitle: StringConstants.kAddNewPaymentMethod,
            buttonVisible: true,
            textFieldVisible: false,
            onPressed: () {
              Map map = {};
              showDialog(
                  context: context,
                  builder: (ctx) => AddNewPaymentTypePopup(
                      isEdit: false, savePaymentDetailsMap: map));
            },
          ),
          const SizedBox(height: spacingStandard),
          PaymentTypeGridView(paymentType: paymentType)
        ],
      ),
    );
  }
}
