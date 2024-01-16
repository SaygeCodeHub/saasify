import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/new_app_theme.dart';

class CustomCheckbox extends StatefulWidget {
  const CustomCheckbox({super.key});

  @override
  CustomCheckboxState createState() => CustomCheckboxState();
}

class CustomCheckboxState extends State<CustomCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(spacingXSmall),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(spacingXXSmall),
        color: Colors.white, // Container background color
        border: Border.all(
          color: Colors.black12,
          width: 1.0, // Border width
        ),
      ),
      child: Row(
        children: [
          Checkbox(
            value: isChecked,
            onChanged: (value) {
              setState(() {
                isChecked = value!;
              });
            },
          ),
          Text(
            'Manager',
            style: Theme.of(context).textTheme.drawerModuleTextStyle,
          ),
        ],
      ),
    );
  }
}
