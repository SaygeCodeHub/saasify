import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';

class CustomDropDown extends StatefulWidget {
  final List<String> items;
  final String? defaultValue;
  final IconData? icon;
  final void Function(dynamic value) onChanged;

  const CustomDropDown(
      {super.key,
      required this.items,
      required this.defaultValue,
      required this.onChanged,
      this.icon});

  @override
  State<CustomDropDown> createState() => _CustomDropDownState();
}

class _CustomDropDownState extends State<CustomDropDown> {
  String selectedValue = '';

  @override
  void initState() {
    selectedValue = widget.defaultValue ?? '';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: AppColors.darkGrey, width: 1.0),
      ),
      child: Row(
        children: [
          widget.icon != null
              ? Padding(
                  padding: const EdgeInsets.only(right: spacingSmallest),
                  child: Icon(widget.icon),
                )
              : const SizedBox(),
          DropdownButton2(
              underline: const SizedBox(),
              isDense: true,
              value: selectedValue,
              hint: const Text('Select'),
              iconStyleData: IconStyleData(
                  icon: Icon(Icons.keyboard_arrow_down),
                  iconEnabledColor: AppColors.black,
                  iconSize: 20),
              dropdownStyleData: DropdownStyleData(
                  offset: const Offset(0, -2),
                  maxHeight: 200,
                  elevation: 2,
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                  )),
              menuItemStyleData: MenuItemStyleData(
                padding: EdgeInsets.only(left: spacingMedium),
                height: 28,
              ),
              buttonStyleData: ButtonStyleData(
                  padding: EdgeInsets.only(left: spacingXSmall),
                  height: 28,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                  )),
              items: List.generate(
                  widget.items.length,
                  (index) => DropdownMenuItem(
                      value: widget.items[index],
                      child: Text(widget.items[index]))),
              onChanged: (value) {
                setState(() {
                  selectedValue = value.toString();
                });
                widget.onChanged(value);
              }),
        ],
      ),
    );
  }
}
