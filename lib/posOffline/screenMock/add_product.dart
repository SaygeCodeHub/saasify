var addProduct = {
  "status": 200,
  "message": "Form plotted!",
  "data": {
    "form_name": "Add Product",
    "sections": [
      {
        "section_name": "Product",
        "row": [
          {
            "fields": [
              {
                "column_name": "product_name",
                "label": "Product Name",
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
                "label": "Sescription",
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
                  "input_type": "text",
                  "validator": "Please fill the empty field"
                },
                "dropdown_field": null,
                "radio_field": null,
                "checkbox_field": null,
                "date_picker_field": null
              },
              {
                "column_name": "unit",
                "label": "Unit",
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
                  "input_type": "text",
                  "validator": "Please fill the empty field"
                },
                "dropdown_field": null,
                "radio_field": null,
                "checkbox_field": null,
                "date_picker_field": null
              }
            ]
          },
          {
            "fields": [
              {
                "column_name": "measuring_qty",
                "label": "Quantity",
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
              {
                "column_name": "price",
                "label": "Price",
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
              },
              {
                "column_name": "stock_qty",
                "label": "Stock Quantity",
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
        "button_name": "Add Product",
        "button_type": "primaryButton",
        "end_point": "/addProduct",
        "button_action": "api_call",
        "api_method_type": "post"
      }
    ],
    "utility_buttons": []
  }
};
