import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/utils/text_validation_util.dart';
import 'package:saasify/widgets/text/field_label_widget.dart';

class EmailTextField extends LabelAndFieldWidget {
  EmailTextField({
    super.key,
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
    super.key,
    super.onTextFieldChanged,
    super.isRequired,
  }) : super(
            label: StringConstants.kMobileNumber,
            keyboardType: TextInputType.phone,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            prefixIcon: const Icon(Icons.phone_android_outlined),
            validator: (String? contact) {
              if (!isPhoneNumberValid(contact!)) {
                return StringConstants.kEnterValidMobileNumber;
              }
              return null;
            });
}

class DatePickerField extends LabelAndFieldWidget {
  DatePickerField({
    super.key,
    required BuildContext context,
    super.label,
    required super.onTextFieldChanged,
    super.isRequired,
  }) : super(
            readOnly: true,
            onTap: () {
              showDatePicker(
                context: context,
                firstDate: DateTime(DateTime.now().year - 100),
                lastDate: DateTime(DateTime.now().year + 100),
                initialDate: DateTime.now(),
              ).then((value) => onTextFieldChanged!((value == null)
                  ? null
                  : DateFormat('dd-MM-yyyy').format(value)));
            },
            suffixIcon: const Icon(Icons.calendar_today_outlined));
}

class TimePickerField extends LabelAndFieldWidget {
  TimePickerField({
    super.key,
    required BuildContext context,
    super.label,
    super.onTextFieldChanged,
    super.isRequired,
  }) : super(
            readOnly: true,
            onTap: () {
              showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
              ).then((value) => onTextFieldChanged!((value == null)
                  ? null
                  : DateFormat('hh:mm a').format(DateTime(
                      DateTime.now().year,
                      DateTime.now().month,
                      DateTime.now().day,
                      value.hour,
                      value.minute,
                    ))));
            },
            suffixIcon: const Icon(Icons.timer_outlined));
}
