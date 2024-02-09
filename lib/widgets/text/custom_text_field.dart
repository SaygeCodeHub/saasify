import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import '../../configs/app_colors.dart';

class CustomTextField extends StatelessWidget {
  final int? maxLines;
  final TextInputAction? textInputAction;
  final int? maxLength;
  final bool isRequired;
  final String? hintText;
  final String? getText;
  final bool? firstCall;
  final void Function(String)? onTextFieldChanged;
  final bool? readOnly;
  final bool? enabled;
  final TextEditingController? textFieldController;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Widget? suffix;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final double width;
  final bool autofocus;
  final String? initialValue;
  final TextInputType? keyboardType;
  final void Function()? onTap;
  final List<TextInputFormatter>? inputFormatters;
  final EdgeInsetsGeometry? contentPadding;
  final TextStyle? hintStyle;

  const CustomTextField(
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
      this.onTextFieldChanged,
      this.inputFormatters,
      this.prefixIcon,
      this.obscureText = false,
      this.hintStyle,
      this.suffixIcon,
      this.autofocus = false,
      this.enabled,
      this.textFieldController,
      this.onTap,
      this.isRequired = false,
      this.width = double.maxFinite});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller =
        textFieldController ?? TextEditingController();

    if (initialValue != null && controller.text.isEmpty) {
      controller.text = initialValue.toString();
    }

    return TextFormField(
        key: key,
        enabled: enabled,
        autofocus: autofocus,
        obscureText: obscureText,
        obscuringCharacter: "*",
        cursorColor: AppColors.orange,
        onTap: onTap,
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
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            suffix: suffix,
            hintText: hintText,
            hintStyle: hintStyle,
            prefixIcon: prefixIcon,
            constraints: BoxConstraints(
              maxWidth: width,
            ),
            suffixIcon: suffixIcon),
        inputFormatters: inputFormatters,
        validator: (value) {
          if ((value == null || value.isEmpty) && isRequired) {
            return StringConstants.kFieldCannotBeEmpty;
          }
          if (validator != null && ((value == null || value.isEmpty) && isRequired)) {
            return validator!(value);
          }
          return null;
        },
        readOnly: readOnly!,
        controller: controller,
        onChanged: onTextFieldChanged,
        textInputAction: textInputAction,
        maxLines: maxLines ?? 1,
        maxLength: maxLength,
        keyboardType: keyboardType,
        textAlign: TextAlign.start);
  }
}
