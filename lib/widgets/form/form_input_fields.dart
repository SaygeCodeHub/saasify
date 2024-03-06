import 'package:flutter/material.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/utils/text_validation_util.dart';
import 'package:saasify/widgets/formWidgets/label_and_textfield_widget.dart';

class EmailTextField extends LabelAndTextFieldWidget {
  EmailTextField({
    super.key,
    super.enabled,
    super.initialValue,
    super.onTextFieldChanged,
    super.isRequired,
  }) : super(
            label: StringConstants.kEmailAddress,
            keyboardType: TextInputType.emailAddress,
            prefixIcon: const Icon(Icons.email_outlined),
            validator: (String? email) {
              if (!isEmailValid(email!)) {
                return StringConstants.kEnterValidEmail;
              }
              return null;
            });
}

class PasswordTextField extends LabelAndTextFieldWidget {
  const PasswordTextField({
    super.key,
    super.onTextFieldChanged,
    super.validator,
    super.isRequired = true,
  }) : super(
            label: StringConstants.kPassword,
            keyboardType: TextInputType.visiblePassword,
            prefixIcon: const Icon(Icons.password_outlined),
            obscureText: true);
}
