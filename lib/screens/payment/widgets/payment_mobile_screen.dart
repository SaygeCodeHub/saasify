import 'package:flutter/material.dart';
import 'package:saasify/screens/payment/widgets/payment_listview.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../data/models/payment/fetch_all_payment_method.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../widgets/custom_page_header.dart';
import '../../../widgets/primary_button.dart';
import '../../dashboard/dashboard_screen.dart';
import 'add_payment_method_popup.dart';

class PaymentMobileScreen extends StatelessWidget {
  const PaymentMobileScreen({
    super.key,
    required this.paymentType,
  });

  final List<PaymentData> paymentType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Padding(
            padding: const EdgeInsets.all(spacingLarge),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(kCircularRadius),
                    boxShadow: const [
                      BoxShadow(
                          color: AppColor.saasifyLightPaleGrey, blurRadius: 5.0)
                    ],
                    color: AppColor.saasifyWhite),
                child: PrimaryButton(
                    onPressed: () {
                      Map map = {};
                      showDialog(
                          context: context,
                          builder: (ctx) => AddNewPaymentTypePopup(
                              isEdit: false, savePaymentDetailsMap: map));
                    },
                    buttonTitle: StringConstants.kAddNewPaymentMethod))),
        body: Padding(
            padding: const EdgeInsets.all(spacingLarge),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              CustomPageHeader(
                  titleText: StringConstants.kPaymentType,
                  onBack: () {
                    Navigator.pushReplacementNamed(
                        context, DashboardsScreen.routeName);
                  },
                  backIconVisible: true,
                  buttonVisible: false,
                  textFieldVisible: false),
              const SizedBox(height: spacingStandard),
              PaymentTypeListView(paymentType: paymentType)
            ])));
  }
}
