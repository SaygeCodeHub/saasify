import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';

class CustomDropdownButton extends StatelessWidget {
  final bool? showBorder;
  final String hint;
  final List<String> items;
  final String? selectedValue;
  final ValueChanged<String?> onChanged;

  const CustomDropdownButton({
    super.key,
    required this.hint,
    required this.items,
    required this.selectedValue,
    required this.onChanged,
    this.showBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.15,
      child: DropdownButtonFormField2<String>(
        isExpanded: true,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    color: (showBorder == false)
                        ? AppColors.transparent
                        : AppColors.black12)),
            contentPadding:
            const EdgeInsets.symmetric(vertical: spacingStandard),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(kCardRadius))),
        hint: Text(hint, style: Theme.of(context).textTheme.titleSmall),
        items: items
            .map((item) => DropdownMenuItem<String>(
          value: item,
          child: Text(item,
              style: const TextStyle(fontSize: spacingMedium)),
        ))
            .toList(),
        validator: (value) {
          if (value == null) {
            return 'Please select Leave Type';
          }
          return null;
        },
        onChanged: (value) {},
        buttonStyleData: const ButtonStyleData(
          padding: EdgeInsets.only(right: spacingXSmall),
        ),
        iconStyleData: const IconStyleData(
            icon: Icon(Icons.arrow_drop_down, color: AppColors.darkBlue),
            iconSize: kBackIconSize),
        dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(spacingStandard))),
        menuItemStyleData: const MenuItemStyleData(
            padding: EdgeInsets.symmetric(horizontal: spacingStandard)),
      ),
    );
  }
}
