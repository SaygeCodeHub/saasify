import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/payment/payments_event.dart';
import 'package:saasify/configs/app_theme.dart';
import '../../../bloc/payment/payments_bloc.dart';
import '../../../configs/app_color.dart';
import '../../../configs/app_dimensions.dart';
import '../../../configs/app_spacing.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../widgets/custom_text_field.dart';
import '../../../widgets/primary_button.dart';
import '../../../widgets/secondary_button.dart';
import '../../../widgets/toggle_switch_widget.dart';

class AddNewPaymentTypePopup extends StatefulWidget {
  const AddNewPaymentTypePopup(
      {super.key, required this.savePaymentDetailsMap, required this.isEdit});
  final Map savePaymentDetailsMap;
  final bool isEdit;

  @override
  State<AddNewPaymentTypePopup> createState() => _AddNewPaymentTypePopupState();
}

class _AddNewPaymentTypePopupState extends State<AddNewPaymentTypePopup> {
  @override
  void initState() {
    widget.savePaymentDetailsMap['is_active'] =
        widget.savePaymentDetailsMap['is_active'] ?? true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        content: SizedBox(
            width: kDialogueWidth,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(StringConstants.kAddNewPaymentMethod,
                          style: Theme.of(context)
                              .textTheme
                              .xTiniest
                              .copyWith(fontWeight: FontWeight.w700)),
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Align(
                            alignment: Alignment.topRight,
                            child:
                                Icon(Icons.close, color: AppColor.saasifyGrey),
                          )),
                    ],
                  ),
                  const SizedBox(height: spacingMedium),
                  CustomTextField(
                      initialValue:
                          widget.savePaymentDetailsMap["payment_name"],
                      onTextFieldChanged: (value) {
                        widget.savePaymentDetailsMap['payment_name'] = value;
                      }),
                  const SizedBox(height: spacingSmall),
                  Row(
                    children: [
                      Text(StringConstants.kIsActive,
                          style: Theme.of(context).textTheme.xTiniest),
                      ToggleSwitchWidget(
                          value: widget.savePaymentDetailsMap['is_active'],
                          onChanged: (value) {
                            widget.savePaymentDetailsMap['is_active'] = value;
                            setState(() {});
                          }),
                    ],
                  ),
                  const SizedBox(
                    height: spacingXMedium,
                  ),
                  Row(children: [
                    Expanded(
                        child: SecondaryButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            buttonTitle: StringConstants.kCancel)),
                    const SizedBox(
                      width: spacingXXSmall,
                    ),
                    Expanded(
                        child: PrimaryButton(
                            onPressed: () {
                              Navigator.pop(context);
                              (widget.isEdit)
                                  ? context.read<PaymentBloc>().add(EditPayment(
                                      paymentDetailsMap:
                                          widget.savePaymentDetailsMap))
                                  : context.read<PaymentBloc>().add(SavePayment(
                                      paymentDetailsMap:
                                          widget.savePaymentDetailsMap));
                            },
                            buttonTitle: (widget.isEdit)
                                ? StringConstants.kEdit
                                : StringConstants.kAdd))
                  ])
                ])));
  }
}
