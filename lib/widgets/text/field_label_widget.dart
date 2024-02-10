import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/widgets/text/custom_text_field.dart';
import 'package:saasify/widgets/text/label_text_widget.dart';

class LabelAndFieldWidget extends StatelessWidget {
  final String? label;
  final String? hintText;
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
  final CustomTextField? textField;

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
      this.validator,
      this.isRequired = false,
      this.onTap,
      this.inputFormatters,
      this.textField});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      if (label != null) LabelTextWidget(label: label),
      if (label != null) const SizedBox(height: spacingMedium),
      textField ?? CustomTextField(
          maxLines: maxLines,
          suffix: suffix,
          width: textFieldSize ?? double.maxFinite,
          isRequired: isRequired,
          initialValue: initialValue,
          hintText: hintText,
          prefixIcon: prefixIcon,
          contentPadding: contentPadding,
          inputFormatters: inputFormatters,
          onTap: onTap,
          suffixIcon: suffixIcon,
          obscureText: obscureText ?? false,
          validator: validator,
          readOnly: readOnly ?? false,
          textFieldController: textFieldController,
          onTextFieldChanged: onTextFieldChanged,
          enabled: enabled ?? true,
          autofocus: autofocus ?? false,
          keyboardType: keyboardType)
    ]);
  }
}
