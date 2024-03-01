import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/text/custom_text_field.dart';

class TextFieldWidget extends StatelessWidget {
  final String? label;
  final String? hintText;
  final void Function()? onTap;
  final bool isRequired;
  final void Function(String?)? onTextFieldChanged;
  final bool readOnly;
  final String? Function(String?)? validator;
  final bool? enabled;
  final TextEditingController? textFieldController;
  final bool obscureText;
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

  const TextFieldWidget(
      {super.key,
      this.label,
      this.hintText,
      this.onTextFieldChanged,
      this.readOnly = false,
      this.enabled,
      this.textFieldController,
      this.obscureText = false,
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
    final TextEditingController controller =
        textFieldController ?? TextEditingController();

    if (initialValue != null) {
      controller.text = initialValue.toString();
    }

    controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length));

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      if (label != null)
        Text(label!, style: Theme.of(context).textTheme.fieldLabelTextStyle),
      if (label != null) const SizedBox(height: spacingSmall),
      TextFormField(
          key: key,
          onTap: onTap,
          enabled: enabled,
          readOnly: readOnly,
          obscuringCharacter: "*",
          obscureText: obscureText,
          onChanged: onTextFieldChanged,
          controller: controller,
          maxLines: maxLines ?? 1,
          keyboardType: keyboardType,
          inputFormatters: inputFormatters,
          cursorColor: AppColors.blue,
          cursorWidth: 0.6,
          validator: (value) {
            if ((value == null || value.isEmpty) && isRequired) {
              return StringConstants.kFieldCannotBeEmpty;
            }
            if (validator != null) {
              if (!(value == null || value.isEmpty)) {
                return validator!(value);
              }
            }
            return null;
          },
          style:
              MaterialStateTextStyle.resolveWith((Set<MaterialState> states) {
            if (states.contains(MaterialState.disabled)) {
              return const TextStyle(
                color: AppColors.black,
              );
            } else {
              return const TextStyle(
                color: AppColors.black,
              );
            }
          }),
          decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: prefixIcon,
              constraints:
                  BoxConstraints(maxWidth: textFieldSize ?? double.maxFinite),
              suffixIcon: suffixIcon,
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
              disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black12)),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 15, horizontal: 15)))
    ]);
  }
}
