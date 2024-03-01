import 'package:saasify/data/models/form/form_structure_model.dart';
import 'package:saasify/repositories/form/form_repository.dart';

class FormRepositoryImpl implements FormRepository {
  @override
  Future<FormStructureModel> fetchFormStructure() async {
    try {
      final formData = {
        "status": 200,
        "message": "Form Structure Fetched Successfully",
        "data": {
          "form_name": "Add Customer",
          "sections": [
            {
              "section_name": "Customer Details",
              "row": [
                {
                  "fields": [
                    {
                      "column_name": "first_name",
                      "label": "First Name",
                      "field_type": "textField",
                      "flex": 1,
                      "placeholder": null,
                      "required": true,
                      "error_text": null,
                      "user_selection": {
                        "text_value": "",
                        "user_selected_option_id": null,
                        "user_selected_date": null
                      },
                      "text_field": {
                        "max_lines": 1,
                        "max_length": null,
                        "obscure_text": false,
                        "readOnly": false,
                        "input_type": "text",
                        "validator": "Please fill the empty field"
                      },
                      "dropdown_field": null,
                      "radio_field": null,
                      "checkbox_field": null,
                      "date_picker_field": null
                    },
                    {
                      "column_name": "middle_name",
                      "label": "Middle Name",
                      "field_type": "textField",
                      "flex": 1,
                      "placeholder": null,
                      "required": true,
                      "error_text": null,
                      "user_selection": {
                        "text_value": "",
                        "user_selected_option_id": null,
                        "user_selected_date": null
                      },
                      "text_field": {
                        "max_lines": 1,
                        "max_length": null,
                        "obscure_text": false,
                        "readOnly": false,
                        "input_type": "text",
                        "validator": "Please fill the empty field"
                      },
                      "dropdown_field": null,
                      "radio_field": null,
                      "checkbox_field": null,
                      "date_picker_field": null
                    },
                    {
                      "column_name": "last_name",
                      "label": "Last Name",
                      "field_type": "textField",
                      "flex": 1,
                      "placeholder": null,
                      "required": true,
                      "error_text": null,
                      "user_selection": {
                        "text_value": "",
                        "user_selected_option_id": null,
                        "user_selected_date": null
                      },
                      "text_field": {
                        "max_lines": 1,
                        "max_length": null,
                        "obscure_text": false,
                        "readOnly": false,
                        "input_type": "text",
                        "validator": "Please fill the empty field"
                      },
                      "dropdown_field": null,
                      "radio_field": null,
                      "checkbox_field": null,
                      "date_picker_field": null
                    },
                  ]
                },
                {
                  "fields": [
                    {
                      "column_name": "email_address",
                      "label": "Email Address",
                      "field_type": "textField",
                      "flex": 1,
                      "placeholder": null,
                      "required": true,
                      "error_text": null,
                      "user_selection": {
                        "text_value": "",
                        "user_selected_option_id": null,
                        "user_selected_date": null
                      },
                      "text_field": {
                        "max_lines": 1,
                        "max_length": null,
                        "obscure_text": false,
                        "readOnly": false,
                        "input_type": "text",
                        "validator": "Please fill the empty field"
                      },
                      "dropdown_field": null,
                      "radio_field": null,
                      "checkbox_field": null,
                      "date_picker_field": null
                    },
                    {
                      "column_name": "phone_number",
                      "label": "Phone Number",
                      "field_type": "textField",
                      "flex": 1,
                      "placeholder": null,
                      "required": true,
                      "error_text": null,
                      "user_selection": {
                        "text_value": "",
                        "user_selected_option_id": null,
                        "user_selected_date": null
                      },
                      "text_field": {
                        "max_lines": 1,
                        "max_length": null,
                        "obscure_text": false,
                        "readOnly": false,
                        "input_type": "text",
                        "validator": "Please fill the empty field"
                      },
                      "dropdown_field": null,
                      "radio_field": null,
                      "checkbox_field": null,
                      "date_picker_field": null
                    },
                  ]
                },
                {
                  "fields": [
                    {
                      "column_name": "address",
                      "label": "Address",
                      "field_type": "textField",
                      "flex": 1,
                      "placeholder": null,
                      "required": true,
                      "error_text": null,
                      "user_selection": {
                        "text_value": "",
                        "user_selected_option_id": null,
                        "user_selected_date": null
                      },
                      "text_field": {
                        "max_lines": 5,
                        "max_length": null,
                        "obscure_text": false,
                        "readOnly": false,
                        "input_type": "text",
                        "validator": "Please fill the empty field"
                      },
                      "dropdown_field": null,
                      "radio_field": null,
                      "checkbox_field": null,
                      "date_picker_field": null
                    }
                  ]
                }
              ]
            },
            {
              "section_name": "Customer Additional Details",
              "row": [
                {
                  "fields": [
                    {
                      "column_name": "city",
                      "label": "City",
                      "field_type": "textField",
                      "flex": 2,
                      "placeholder": null,
                      "required": true,
                      "error_text": null,
                      "user_selection": {
                        "text_value": "",
                        "user_selected_option_id": null,
                        "user_selected_date": null
                      },
                      "text_field": {
                        "max_lines": 1,
                        "max_length": null,
                        "obscure_text": false,
                        "readOnly": false,
                        "input_type": "text",
                        "validator": "Please fill the empty field"
                      },
                      "dropdown_field": null,
                      "radio_field": null,
                      "checkbox_field": null,
                      "date_picker_field": null
                    },
                    {
                      "column_name": "country",
                      "label": "Country",
                      "field_type": "dropdown",
                      "flex": 1,
                      "placeholder": null,
                      "required": true,
                      "error_text": null,
                      "user_selection": {
                        "text_value": "",
                        "user_selected_option_id": null,
                        "user_selected_date": null
                      },
                      "text_field": null,
                      "dropdown_field": {
                        "default_value": "Select",
                        "options": [
                          {"value": "1", "label": "India"},
                          {"value": "2", "label": "USA"},
                          {"value": "3", "label": "UK"},
                          {"value": "4", "label": "Canada"},
                          {"value": "5", "label": "Australia"},
                        ]
                      },
                      "radio_field": null,
                      "checkbox_field": null,
                      "date_picker_field": null
                    },
                    {
                      "column_name": "postal_code",
                      "label": "Postal Code",
                      "field_type": "textField",
                      "flex": 1,
                      "placeholder": null,
                      "required": true,
                      "error_text": null,
                      "user_selection": {
                        "text_value": "",
                        "user_selected_option_id": null,
                        "user_selected_date": null
                      },
                      "text_field": {
                        "max_lines": 1,
                        "max_length": null,
                        "obscure_text": false,
                        "readOnly": false,
                        "input_type": "text",
                        "validator": "Please fill the empty field"
                      },
                      "dropdown_field": null,
                      "radio_field": null,
                      "checkbox_field": null,
                      "date_picker_field": null
                    },
                  ]
                },
                {
                  "fields": [
                    {
                      "column_name": "email_address",
                      "label": "Email Address",
                      "field_type": "textField",
                      "flex": 1,
                      "placeholder": null,
                      "required": true,
                      "error_text": null,
                      "user_selection": {
                        "text_value": "",
                        "user_selected_option_id": null,
                        "user_selected_date": null
                      },
                      "text_field": {
                        "max_lines": 1,
                        "max_length": null,
                        "obscure_text": false,
                        "readOnly": false,
                        "input_type": "text",
                        "validator": "Please fill the empty field"
                      },
                      "dropdown_field": null,
                      "radio_field": null,
                      "checkbox_field": null,
                      "date_picker_field": null
                    },
                    {
                      "column_name": "phone_number",
                      "label": "Phone Number",
                      "field_type": "textField",
                      "flex": 1,
                      "placeholder": null,
                      "required": true,
                      "error_text": null,
                      "user_selection": {
                        "text_value": "",
                        "user_selected_option_id": null,
                        "user_selected_date": null
                      },
                      "text_field": {
                        "max_lines": 1,
                        "max_length": null,
                        "obscure_text": false,
                        "readOnly": false,
                        "input_type": "text",
                        "validator": "Please fill the empty field"
                      },
                      "dropdown_field": null,
                      "radio_field": null,
                      "checkbox_field": null,
                      "date_picker_field": null
                    },
                  ]
                },
                {
                  "fields": [
                    {
                      "column_name": "address",
                      "label": "Address",
                      "field_type": "textField",
                      "flex": 1,
                      "placeholder": null,
                      "required": true,
                      "error_text": null,
                      "user_selection": {
                        "text_value": "",
                        "user_selected_option_id": null,
                        "user_selected_date": null
                      },
                      "text_field": {
                        "max_lines": 5,
                        "max_length": null,
                        "obscure_text": false,
                        "readOnly": false,
                        "input_type": "text",
                        "validator": "Please fill the empty field"
                      },
                      "dropdown_field": null,
                      "radio_field": null,
                      "checkbox_field": null,
                      "date_picker_field": null
                    }
                  ]
                }
              ]
            }
          ],
          "buttons": [
            {
              "button_name": "Add Announcement",
              "button_type": "primaryButton",
              "end_point": "/addAnnouncements",
              "api_method_type": "post"
            }
          ],
          "utility_buttons": [
            {"button_icon": "", "end_point": "", "api_method_type": ""}
          ]
        }
      };
      return FormStructureModel.fromJson(formData);
    } catch (e) {
      rethrow;
    }
  }
}
