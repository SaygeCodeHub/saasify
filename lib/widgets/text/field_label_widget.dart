import 'package:flutter/material.dart';
import 'package:saasify/widgets/text/label_text_widget.dart';
import '../../configs/app_colors.dart';
import '../../configs/app_spacing.dart';

class LabelAndFieldWidget extends StatelessWidget {
  final String? label;
  final String? hintText;
  final String? errorText;
  final void Function(String)? onTextFieldChanged;
  final bool? readOnly;
  final bool? enabled;
  final TextEditingController? controller;
  final bool? obscureText;
  final Widget? suffix;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? autofocus;
  final dynamic initialValue;
  final TextInputType? keyboardType;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLines;
  final double? textFieldSize;

  const LabelAndFieldWidget(
      {super.key,
      this.label,
      this.hintText,
      this.onTextFieldChanged,
      this.readOnly,
      this.enabled,
      this.controller,
      this.obscureText,
      this.suffix,
      this.prefixIcon,
      this.suffixIcon,
      this.autofocus,
      this.initialValue,
      this.keyboardType,
      this.contentPadding,
      this.maxLines = 1,
      this.textFieldSize,
      this.errorText = ''});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    if (initialValue != null && controller.text.isEmpty) {
      controller.text = initialValue.toString();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) LabelTextWidget(label: label),
        if (label != null) const SizedBox(height: spacingMedium),
        SizedBox(
          width: textFieldSize ?? MediaQuery.sizeOf(context).width,
          child: TextFormField(
              maxLines: maxLines,
              obscureText: obscureText ?? false,
              cursorColor: AppColors.orange,
              decoration: InputDecoration(
                focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12)),
                enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12)),
                errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.errorRed)),
                focusedErrorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: AppColors.errorRed)),
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black12)),
                suffix: suffix,
                hintText: hintText,
                prefixIcon: prefixIcon,
                suffixIcon: suffixIcon,
                counterText: "",
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 15, horizontal: 15), // Adjust padding as needed
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return errorText;
                }
                return null;
              },
              readOnly: readOnly ?? false,
              controller: controller,
              onChanged: onTextFieldChanged,
              enabled: enabled ?? true,
              autofocus: autofocus ?? false,
              keyboardType: keyboardType,
              textAlign: TextAlign.start),
        ),
        const SizedBox(height: spacingXSmall)
      ],
    );
  }
}
