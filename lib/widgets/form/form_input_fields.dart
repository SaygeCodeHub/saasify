import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/utils/text_validation_util.dart';
import 'package:saasify/widgets/text/custom_text_field.dart';
import 'package:saasify/widgets/text/field_label_widget.dart';
import 'package:saasify/widgets/text/label_text_widget.dart';

class EmailTextField extends LabelAndFieldWidget {
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

class PasswordTextField extends LabelAndFieldWidget {
  PasswordTextField({
    super.key,
    super.onTextFieldChanged,
    super.isRequired = true,
  }) : super(
            label: StringConstants.kPassword,
            keyboardType: TextInputType.visiblePassword,
            prefixIcon: const Icon(Icons.password_outlined),
            validator: (String? password) {
              if (!isPasswordValid(password!)) {
                return StringConstants.kEnterValidPassword;
              }
              return null;
            },
            obscureText: true);
}

class ContactTextField extends LabelAndFieldWidget {
  ContactTextField({
    super.label,
    super.key,
    super.enabled,
    dynamic initialValue,
    int maxLength = 10,
    super.onTextFieldChanged,
    super.isRequired,
  }) : super(
            initialValue: initialValue?.toString(),
            // keyboardType: TextInputType.phone,
            inputFormatters: [
              LengthLimitingTextInputFormatter(maxLength),
              FilteringTextInputFormatter.digitsOnly
            ],
            prefixIcon: const Icon(Icons.phone_android_outlined),
            validator: (String? contact) {
              if (!isPhoneNumberValid(contact!)) {
                return StringConstants.kEnterValidMobileNumber;
              }
              return null;
            });
}

class DatePickerField extends StatelessWidget {
  final String? label;
  final void Function(String) onTextFieldChanged;
  final DateTime? initialDate;
  final String? Function(String?)? validator;
  final bool isRequired;
  final bool? enabled;
  final TextEditingController _dateController = TextEditingController();
  final DateTime? firstDate;
  final DateTime? lastDate;

  DatePickerField(
      {super.key,
      this.enabled,
      this.label,
      required this.onTextFieldChanged,
      this.initialDate,
      this.isRequired = false,
      this.validator,
      this.firstDate,
      this.lastDate});

  @override
  Widget build(BuildContext context) {
    if (initialDate != null) {
      _dateController.value =
          TextEditingValue(text: DateFormat('dd-MM-yyyy').format(initialDate!));
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label != null) LabelTextWidget(label: label),
        if (label != null) const SizedBox(height: spacingMedium),
        CustomTextField(
          textFieldController: _dateController,
          readOnly: true,
          enabled: enabled,
          isRequired: isRequired,
          validator: validator,
          suffixIcon: const Icon(Icons.date_range_outlined),
          onTap: () {
            showDatePicker(
              context: context,
              initialDate: initialDate ?? DateTime.now(),
              firstDate: firstDate ?? DateTime(DateTime.now().year - 100),
              lastDate: lastDate ?? DateTime(DateTime.now().year + 100),
            ).then((value) {
              String? textValue =
                  (value == null) ? '' : DateFormat('dd-MM-yyyy').format(value);
              _dateController.value = TextEditingValue(text: textValue);
              onTextFieldChanged((value == null)
                  ? ''
                  : DateFormat('yyyy-MM-dd').format(value));
            });
          },
        ),
      ],
    );
  }
}

class TimePickerField extends LabelAndFieldWidget {
  static final TextEditingController _timeController = TextEditingController();

  TimePickerField({
    super.key,
    required BuildContext context,
    super.label,
    super.onTextFieldChanged,
    super.isRequired,
  }) : super(
            textFieldController: _timeController,
            readOnly: true,
            onTap: () {
              showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              ).then((value) {
                String? textValue = (value == null)
                    ? ''
                    : DateFormat('hh:mm a').format(DateTime(
                        DateTime.now().year,
                        DateTime.now().month,
                        DateTime.now().day,
                        value.hour,
                        value.minute,
                      ));
                _timeController.value = TextEditingValue(text: textValue);
                onTextFieldChanged!(textValue);
              });
            },
            suffixIcon: const Icon(Icons.timer_outlined));
}

class NumberTextField extends LabelAndFieldWidget {
  NumberTextField({
    super.label,
    super.key,
    super.enabled,
    super.textFieldSize,
    dynamic initialValue,
    int maxLength = 10,
    super.onTextFieldChanged,
    super.isRequired,
  }) : super(
            initialValue: initialValue?.toString(),
            // keyboardType: TextInputType.number,
            inputFormatters: [
              LengthLimitingTextInputFormatter(maxLength),
              FilteringTextInputFormatter.digitsOnly
            ]);
}
