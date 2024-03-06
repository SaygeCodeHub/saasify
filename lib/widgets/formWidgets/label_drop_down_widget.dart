import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';

class LabelDropdownWidget extends StatefulWidget {
  final String? label;
  final double? textFieldSize;
  final String hint;
  final List<CustomDropDownItem> items;
  final dynamic initialValue;
  final bool? enabled;
  final bool isRequired;
  final String? errorText;
  final ValueChanged<dynamic> onChanged;

  const LabelDropdownWidget({
    super.key,
    this.label,
    this.textFieldSize,
    this.hint = "",
    required this.items,
    this.isRequired = false,
    required this.onChanged,
    this.errorText,
    this.initialValue,
    this.enabled,
  });

  @override
  State<LabelDropdownWidget> createState() => _LabelDropdownWidgetState();
}

class _LabelDropdownWidgetState extends State<LabelDropdownWidget> {
  dynamic selectedValue;

  @override
  void initState() {
    selectedValue = widget.initialValue == ""
        ? null
        : widget.items.map((e) => e.value).contains(widget.initialValue)
            ? widget.initialValue
            : null;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant LabelDropdownWidget oldWidget) {
    selectedValue = widget.initialValue == ""
        ? null
        : widget.items.map((e) => e.value).contains(widget.initialValue)
            ? widget.initialValue
            : null;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      if (widget.label != null)
        Text(widget.label!,
            style: Theme.of(context).textTheme.fieldLabelTextStyle),
      if (widget.label != null) const SizedBox(height: spacingSmall),
      SizedBox(
          width: widget.textFieldSize ?? MediaQuery.sizeOf(context).width,
          child: DropdownButtonFormField2(
              isExpanded: true,
              value: selectedValue,
              style: MaterialStateTextStyle.resolveWith(
                  (Set<MaterialState> states) {
                if (states.contains(MaterialState.disabled)) {
                  return const TextStyle(
                    color: AppColors.black,
                  );
                } else {
                  return const TextStyle(
                    color: AppColors.black,
                  );
                }
              }),
              decoration: const InputDecoration(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: spacingMedium)),
              items: widget.items.map((item) {
                return DropdownMenuItem(
                  value: item.value,
                  child: Text(item.label,
                      style: const TextStyle(
                          fontSize: spacingMedium, color: AppColors.black)),
                );
              }).toList(),
              validator: (value) {
                if (value == null && widget.isRequired) {
                  return 'Please select a value';
                }
                return null;
              },
              onChanged: widget.enabled ?? true ? widget.onChanged : null,
              buttonStyleData: const ButtonStyleData(
                  padding: EdgeInsets.only(right: spacingXSmall)),
              iconStyleData: IconStyleData(
                  icon: Icon(Icons.arrow_drop_down,
                      color: widget.enabled ?? true
                          ? AppColors.darkBlue
                          : AppColors.transparent),
                  iconSize: kBackIconSize),
              dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(spacingStandard))),
              menuItemStyleData: const MenuItemStyleData(
                  padding: EdgeInsets.symmetric(horizontal: spacingStandard))))
    ]);
  }
}

class CustomDropDownItem {
  final dynamic value;
  final String label;

  CustomDropDownItem({this.value, required this.label});
}
