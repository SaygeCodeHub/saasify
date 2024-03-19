import 'dart:convert';

FormStructureModel formStructureModelFromJson(String str) =>
    FormStructureModel.fromJson(json.decode(str));

String formStructureModelToJson(FormStructureModel data) =>
    json.encode(data.toJson());

class FormStructureModel {
  final int? status;
  final String? message;
  final Data? data;

  FormStructureModel({this.status, this.message, this.data});

  factory FormStructureModel.fromJson(Map<String, dynamic> json) =>
      FormStructureModel(
          status: json["status"],
          message: json["message"],
          data: json["data"] == null ? null : Data.fromJson(json["data"]));

  Map<String, dynamic> toJson() =>
      {"status": status, "message": message, "data": data?.toJson()};
}

class Data {
  final String? formName;
  final List<Section>? sections;
  final List<Button>? buttons;
  final List<UtilityButton>? utilityButtons;

  Data({this.formName, this.sections, this.buttons, this.utilityButtons});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
      formName: json["form_name"],
      sections: (json["sections"] as List<dynamic>?)
              ?.map((x) => Section.fromJson(x))
              .toList() ??
          [],
      buttons: (json["buttons"] as List<dynamic>?)
              ?.map((x) => Button.fromJson(x))
              .toList() ??
          [],
      utilityButtons: (json["utility_buttons"] as List<dynamic>?)
              ?.map((x) => UtilityButton.fromJson(x))
              .toList() ??
          []);

  Map<String, dynamic> toJson() => {
        "form_name": formName,
        "sections": sections?.map((x) => x.toJson()).toList(),
        "buttons": buttons?.map((x) => x.toJson()).toList(),
        "utility_buttons": utilityButtons?.map((x) => x.toJson()).toList()
      };
}

class Section {
  final dynamic sectionName;
  final List<FieldRow>? rows;

  Section({this.sectionName, this.rows});

  factory Section.fromJson(Map<String, dynamic> json) => Section(
      sectionName: json["section_name"],
      rows: (json["row"] as List<dynamic>?)
              ?.map((x) => FieldRow.fromJson(x))
              .toList() ??
          []);

  Map<String, dynamic> toJson() => {
        "section_name": sectionName,
        "row": rows?.map((x) => x.toJson()).toList()
      };
}

class FieldRow {
  final List<Field>? fields;

  FieldRow({this.fields});

  factory FieldRow.fromJson(Map<String, dynamic> json) => FieldRow(
      fields: (json["fields"] as List<dynamic>?)
              ?.map((x) => Field.fromJson(x))
              .toList() ??
          []);

  Map<String, dynamic> toJson() =>
      {"fields": fields?.map((x) => x.toJson()).toList()};
}

class Field {
  final String? columnName;
  final String? label;
  final String? fieldType;
  final int? flex;
  final dynamic placeholder;
  final bool? required;
  final dynamic errorText;
  final UserSelection? userSelection;
  final TextFieldData? textField;
  final DropdownFieldData? dropdownField;
  final RadioFieldData? radioField;
  final CheckboxData? checkboxField;
  final DatePickerFieldData? datePickerField;

  Field(
      {this.flex,
      this.columnName,
      this.label,
      this.fieldType,
      this.placeholder,
      this.required,
      this.errorText,
      this.userSelection,
      this.textField,
      this.dropdownField,
      this.radioField,
      this.checkboxField,
      this.datePickerField});

  factory Field.fromJson(Map<String, dynamic> json) => Field(
      columnName: json["column_name"],
      label: json["label"],
      fieldType: json["field_type"],
      placeholder: json["placeholder"],
      required: json["required"],
      errorText: json["error_text"],
      flex: json["flex"],
      userSelection: json["user_selection"] == null
          ? null
          : UserSelection.fromJson(json["user_selection"]),
      textField: json["text_field"] == null
          ? null
          : TextFieldData.fromJson(json["text_field"]),
      dropdownField: json["dropdown_field"] == null
          ? null
          : DropdownFieldData.fromJson(json["dropdown_field"]),
      radioField: json["radio_field"] == null
          ? null
          : RadioFieldData.fromJson(json["radio_field"]),
      checkboxField: json["checkbox_field"] == null
          ? null
          : CheckboxData.fromJson(json["checkbox_field"]),
      datePickerField: json["date_picker_field"] == null
          ? null
          : DatePickerFieldData.fromJson(json["date_picker_field"]));

  Map<String, dynamic> toJson() => {
        "column_name": columnName,
        "label": label,
        "field_type": fieldType,
        "placeholder": placeholder,
        "flex": flex,
        "required": required,
        "error_text": errorText,
        "user_selection": userSelection?.toJson(),
        "text_field": textField?.toJson(),
        "dropdown_field": dropdownField?.toJson(),
        "radio_field": radioField?.toJson(),
        "checkbox_field": checkboxField,
        "date_picker_field": datePickerField?.toJson()
      };
}

class DatePickerFieldData {
  final String? placeholder;
  final dynamic minDate;
  final dynamic maxDate;

  DatePickerFieldData({this.placeholder, this.minDate, this.maxDate});

  factory DatePickerFieldData.fromJson(Map<String, dynamic> json) =>
      DatePickerFieldData(
          placeholder: json["placeholder"],
          minDate: json["min_date"],
          maxDate: json["max_date"]);

  Map<String, dynamic> toJson() =>
      {"placeholder": placeholder, "min_date": minDate, "max_date": maxDate};
}

class DropdownFieldData {
  final List<OptionData>? options;
  final dynamic defaultValue;

  DropdownFieldData({this.options, this.defaultValue});

  factory DropdownFieldData.fromJson(Map<String, dynamic> json) =>
      DropdownFieldData(
          options: (json["options"] as List<dynamic>?)
                  ?.map((x) => OptionData.fromJson(x))
                  .toList() ??
              [],
          defaultValue: json["default_value"] ?? '');

  Map<String, dynamic> toJson() => {
        "options": options?.map((x) => x.toJson()).toList(),
        "default_value": defaultValue
      };
}

class RadioFieldData {
  final List<OptionData>? options;
  final dynamic defaultValue;

  RadioFieldData({this.options, this.defaultValue});

  factory RadioFieldData.fromJson(Map<String, dynamic> json) => RadioFieldData(
      options: (json["options"] as List<dynamic>?)
              ?.map((x) => OptionData.fromJson(x))
              .toList() ??
          [],
      defaultValue: json["default_value"]);

  Map<String, dynamic> toJson() => {
        "options": options?.map((x) => x.toJson()).toList(),
        "default_value": defaultValue
      };
}

class CheckboxData {
  final List<OptionData>? options;
  final dynamic defaultValue;

  CheckboxData({this.options, this.defaultValue});

  factory CheckboxData.fromJson(Map<String, dynamic> json) => CheckboxData(
      options: (json["options"] as List<dynamic>?)
              ?.map((x) => OptionData.fromJson(x))
              .toList() ??
          [],
      defaultValue: json["default_value"]);

  Map<String, dynamic> toJson() => {
        "options": options?.map((x) => x.toJson()).toList(),
        "default_value": defaultValue
      };
}

class OptionData {
  final String? label;
  final dynamic value;

  OptionData({this.label, this.value});

  factory OptionData.fromJson(Map<String, dynamic> json) =>
      OptionData(label: json["label"], value: json["value"]);

  Map<String, dynamic> toJson() => {"label": label, "value": value};
}

class TextFieldData {
  final int? maxLines;
  final dynamic maxLength;
  final bool? obscureText;
  final bool? readOnly;
  final String? inputType;
  final String? validator;

  TextFieldData(
      {this.maxLines,
      this.maxLength,
      this.obscureText,
      this.readOnly,
      this.inputType,
      this.validator});

  factory TextFieldData.fromJson(Map<String, dynamic> json) => TextFieldData(
      maxLines: json["max_lines"],
      maxLength: json["max_length"],
      obscureText: json["obscure_text"],
      readOnly: json["read_only"],
      inputType: json["input_type"],
      validator: json["validator"]);

  Map<String, dynamic> toJson() => {
        "max_lines": maxLines,
        "max_length": maxLength,
        "obscure_text": obscureText,
        "readOnly": readOnly,
        "input_type": inputType,
        "validator": validator
      };
}

class UserSelection {
  String? textValue;
  dynamic userSelectedValue;
  dynamic userSelectedDate;

  UserSelection(
      {this.textValue, this.userSelectedValue, this.userSelectedDate});

  factory UserSelection.fromJson(Map<String, dynamic> json) => UserSelection(
      textValue: json["text_value"] ?? '',
      userSelectedValue: json["user_selected_value"],
      userSelectedDate: json["user_selected_date"]);

  Map<String, dynamic> toJson() => {
        "text_value": textValue,
        "user_selected_value": userSelectedValue,
        "user_selected_date": userSelectedDate
      };
}

class Button {
  final String? buttonName;
  final String? buttonAction;
  final String? buttonType;
  final String? endPoint;
  final String? apiMethodType;

  Button(
      {this.buttonAction,
      this.buttonName,
      this.buttonType,
      this.endPoint,
      this.apiMethodType});

  factory Button.fromJson(Map<String, dynamic> json) => Button(
      buttonAction: json["button_action"],
      buttonName: json["button_name"],
      buttonType: json["button_type"],
      endPoint: json["end_point"],
      apiMethodType: json["api_method_type"]);

  Map<String, dynamic> toJson() => {
        "button_action": buttonAction,
        "button_name": buttonName,
        "button_type": buttonType,
        "end_point": endPoint,
        "api_method_type": apiMethodType
      };
}

class UtilityButton {
  final String? buttonIcon;
  final String? buttonAction;
  final String? endPoint;
  final String? apiMethodType;

  UtilityButton(
      {this.buttonAction, this.buttonIcon, this.endPoint, this.apiMethodType});

  factory UtilityButton.fromJson(Map<String, dynamic> json) => UtilityButton(
      buttonAction: json["button_action"],
      buttonIcon: json["button_icon"],
      endPoint: json["end_point"],
      apiMethodType: json["api_method_type"]);

  Map<String, dynamic> toJson() => {
        "button_icon": buttonIcon,
        "end_point": endPoint,
        "api_method_type": apiMethodType,
        "button_action": buttonAction
      };
}
