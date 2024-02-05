import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/text/custom_text_field.dart';
import 'package:saasify/widgets/text/label_text_widget.dart';

class LabelAndFieldWidget extends StatelessWidget {
  final String? label;
  final String? hintText;
  final String? errorText;
  final void Function()? onTap;
  final bool isRequired;
  final void Function(String?)? onTextFieldChanged;
  final bool? readOnly;
  final String? Function(String?)? validator;
  final bool? enabled;
  final TextEditingController? textFieldController;
  final bool? obscureText;
  final Widget? suffix;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool? autofocus;
  final dynamic initialValue;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLines;
  final double? textFieldSize;

  const LabelAndFieldWidget(
      {super.key,
      this.label,
      this.hintText,
      this.onTextFieldChanged,
      this.readOnly = false,
      this.enabled,
      this.textFieldController,
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
      this.errorText = '',
      this.validator,
      this.isRequired = false,
      this.onTap,
      this.inputFormatters});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller =
        textFieldController ?? TextEditingController();

    if (initialValue != null && controller.text.isEmpty) {
      controller.text = initialValue.toString();
    }

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      if (label != null) LabelTextWidget(label: label),
      if (label != null) const SizedBox(height: spacingMedium),
      SizedBox(
          width: textFieldSize ?? MediaQuery.sizeOf(context).width,
          child: CustomTextField(
              maxLines: maxLines,
              suffix: suffix,
              hintText: hintText,
              prefixIcon: prefixIcon,
              contentPadding: contentPadding,
              inputFormatters: inputFormatters,
              onTap: onTap,
              suffixIcon: suffixIcon,
              obscureText: obscureText ?? false,
              validator: (value) {
                if ((value == null || value.isEmpty) && isRequired) {
                  return StringConstants.kFieldCannotBeEmpty;
                }
                if (validator != null) {
                  return validator!(value);
                }
                return null;
              },
              readOnly: readOnly ?? false,
              controller: controller,
              onTextFieldChanged: onTextFieldChanged,
              enabled: enabled ?? true,
              autofocus: autofocus ?? false,
              keyboardType: keyboardType))
    ]);
  }
}
