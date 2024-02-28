import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';

class CustomCheckbox extends StatefulWidget {
  final String checkBoxTitle;
  final bool isChecked;
  final void Function(bool?)? onChanged;

  const CustomCheckbox(
      {super.key,
      required this.checkBoxTitle,
      this.onChanged,
      required this.isChecked});

  @override
  CustomCheckboxState createState() => CustomCheckboxState();
}

class CustomCheckboxState extends State<CustomCheckbox> {
  bool isChecked = false;

  @override
  initState() {
    super.initState();
    isChecked = widget.isChecked;
  }

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
          Expanded(
            child: Row(
              children: [
                Checkbox(
                  isError: true,
                  hoverColor: AppColors.grey,
                  activeColor: AppColors.orange,
                  value: isChecked,
                  onChanged: (value) {
                    widget.onChanged!(value);
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                Text(
                  widget.checkBoxTitle,
                  style: Theme.of(context).textTheme.drawerModuleTextStyle,
                ),
              ],
            ),
          ),
          const SizedBox(width: spacingXMedium),
          const Tooltip(
              message: 'Some Information',
              child: Icon(
                Icons.info,
                color: AppColors.darkBlue,
              )),
          SizedBox(width: spacingSmall)
        ],
      ),
    );
  }
}
