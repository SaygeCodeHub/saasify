import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../configs/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final int? maxLines;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final String? hintText;
  final String? getText;
  final bool? firstCall;
  final void Function(String)? onTextFieldChanged;
  final bool? readOnly;
  final bool? enabled;
  final TextEditingController controller = TextEditingController();
  final bool obscureText;
  final String? Function(String?)? validator;
  final Widget? suffix;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool autofocus;
  final dynamic initialValue;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? hintStyle;

  CustomTextField(
      {super.key,
      this.maxLines,
      this.textInputAction,
      this.maxLength,
      this.hintText,
      this.getText,
      this.firstCall,
      this.readOnly = false,
      this.validator,
      this.suffix,
      this.initialValue,
      this.keyboardType,
      this.contentPadding,
      required this.onTextFieldChanged,
      this.inputFormatters,
      this.prefixIcon,
      this.obscureText = false,
      this.hintStyle,
      this.suffixIcon,
      this.autofocus = false,
      this.enabled});

  @override
  Widget build(BuildContext context) {
    initialValue == null ? null : controller.text = initialValue.toString();
    return TextFormField(
      key: key,
      enabled: enabled,
      autofocus: autofocus,
      obscureText: obscureText,
      obscuringCharacter: "*",
      cursorColor: AppColors.orange,
      decoration: InputDecoration(
        suffix: suffix,
        hintText: hintText,
        hintStyle: hintStyle,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
      ),
      inputFormatters: inputFormatters,
      validator: validator,
      readOnly: readOnly!,
      controller: controller,
      onChanged: onTextFieldChanged,
      textInputAction: textInputAction,
      maxLines: maxLines ?? 1,
      maxLength: maxLength,
      keyboardType: keyboardType,
      textAlign: TextAlign.start,
    );
  }
}
