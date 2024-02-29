import 'package:saasify/data/models/form/form_structure_model.dart';
import 'package:saasify/repositories/form/form_repository.dart';

class FormRepositoryImpl implements FormRepository {

  @override
  Future<FormStructureModel> fetchFormStructure() async {
    try {
      final formData = {
        "status": 200,
        "message": "Form Structure Fetched Successfully",
        "data":{
        "form_name": "Add New Announcements",
        "sections": [
          {
            "section_name": null,
            "fields": [
              {
                "row_fields": [
                  {
                    "column_name": "description",
                    "label": "Description",
                    "field_type": "textField",
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
                  },
                  {
                    "column_name": "description",
                    "label": "Description",
                    "field_type": "textField",
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
                  },
                  {
                    "column_name": "description",
                    "label": "Description",
                    "field_type": "textField",
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
      }};
      return FormStructureModel.fromJson(formData);
    } catch (e) {
      rethrow;
    }
  }
}
