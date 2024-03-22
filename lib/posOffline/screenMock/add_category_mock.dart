var addCategory = {
  "status": 200,
  "message": "Form plotted!",
  "data": {
    "form_name": "Add Category",
    "sections": [
      {
        "section_name": "Category",
        "row": [
          {
            "fields": [
              {
                "column_name": "name",
                "label": "Category Name",
                "field_type": "textField",
                "placeholder": null,
                "required": true,
                "error_text": null,
                "user_selection": {
                  "text_value": "",
                  "user_selected_value": null,
                  "user_selected_date": null
                },
                "text_field": {
                  "max_lines": 1,
                  "max_length": null,
                  "obscure_text": false,
                  "read_only": false,
                  "input_type": "email",
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
                "column_name": "description",
                "label": "Description",
                "field_type": "textField",
                "placeholder": null,
                "required": false,
                "error_text": null,
                "user_selection": {
                  "text_value": "",
                  "user_selected_value": null,
                  "user_selected_date": null
                },
                "text_field": {
                  "max_lines": 1,
                  "max_length": null,
                  "obscure_text": false,
                  "read_only": false,
                  "input_type": "number",
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
        "button_name": "Add Category",
        "button_type": "primaryButton",
        "end_point": "/addCategory",
        "button_action": "api_call",
        "api_method_type": "post"
      }
    ],
    "utility_buttons": []
  }
};
