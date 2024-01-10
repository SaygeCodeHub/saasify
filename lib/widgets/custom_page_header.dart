import 'package:flutter/material.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/utils/responsive.dart';
import 'package:saasify/widgets/primary_button.dart';
import '../configs/app_color.dart';
import '../configs/app_dimensions.dart';
import '../configs/app_spacing.dart';
import '../data/models/pdf/invoice_customer.dart';
import '../screens/product/widgets/delete_product_button.dart';
import '../services/pdf_service.dart';
import '../utils/constants/string_constants.dart';
import 'custom_text_field.dart';

class CustomPageHeader extends StatelessWidget {
  const CustomPageHeader(
      {super.key,
      required this.titleText,
      this.textFieldVisible = true,
      this.buttonVisible = false,
      this.onPressed,
      this.buttonTitle = '',
      this.onBack,
      this.backIconVisible = false,
      this.deleteIconVisible = false,
      this.utilityVisible = false});

  final String titleText;
  final String buttonTitle;
  final bool textFieldVisible;
  final bool buttonVisible;
  final bool deleteIconVisible;
  final bool backIconVisible;
  final bool utilityVisible;
  final void Function()? onPressed;
  final void Function()? onBack;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Visibility(
          visible: backIconVisible,
          child: InkWell(
              onTap: onBack,
              child: context.responsive(const SizedBox(),
                  desktop: const Icon(Icons.arrow_back_ios_new)))),
      const SizedBox(width: spacingSmall),
      context.responsive(const SizedBox(),
          desktop: Text(titleText,
              style: Theme.of(context)
                  .textTheme
                  .xxTiny
                  .copyWith(fontWeight: FontWeight.w700))),
      context.responsive(const SizedBox(),
          desktop: const SizedBox(width: spacingStandard)),
      Expanded(
          flex: 5,
          child: Visibility(
              visible: textFieldVisible,
              child: CustomTextField(
                  prefixIcon: const Icon(Icons.search),
                  hintText: StringConstants.kSearchHere,
                  onTextFieldChanged: (value) {}))),
      const Spacer(),
      Visibility(
          visible: utilityVisible,
          child: Row(children: [
            Visibility(
                visible: deleteIconVisible, child: const DeleteProductButton()),
            const SizedBox(width: spacingLarge),
            IconButton(
                icon: const Icon(Icons.share,
                    color: AppColor.saasifyBlack, size: kHeaderIconsSize),
                onPressed: () {}),
            const SizedBox(width: spacingLarge),
            IconButton(
              onPressed: () async {
                PdfService().printOrdersPdf(invoiceCustomersList);
              },
              icon: const Icon(Icons.download,
                  color: AppColor.saasifyBlack, size: kHeaderIconsSize),
            ),
            const SizedBox(width: spacingLarge),
            IconButton(
                icon: const Icon(Icons.print,
                    color: AppColor.saasifyBlack, size: kHeaderIconsSize),
                onPressed: () {})
          ])),
      Visibility(
          visible: buttonVisible, child: const SizedBox(width: spacingLarge)),
      Visibility(
          visible: buttonVisible,
          child: PrimaryButton(
              buttonWidth: kGeneralActionButtonWidth,
              onPressed: onPressed,
              buttonTitle: buttonTitle)),
    ]);
  }
}
