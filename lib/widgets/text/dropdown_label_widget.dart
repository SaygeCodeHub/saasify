import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/widgets/text/custom_dropdown_widget.dart';
import 'package:saasify/widgets/text/label_text_widget.dart';

class DropdownLabelWidget extends StatefulWidget {
  final String? label;
  final double? textFieldSize;
  final String hint;
  final List<CustomDropDownItem> items;
  final dynamic initialValue;
  final bool? enabled;
  final bool isRequired;
  final String? errorText;
  final ValueChanged<dynamic> onChanged;

  const DropdownLabelWidget({
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
  State<DropdownLabelWidget> createState() => _DropdownLabelWidgetState();
}

class _DropdownLabelWidgetState extends State<DropdownLabelWidget> {
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
  void didUpdateWidget(covariant DropdownLabelWidget oldWidget) {
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
      if (widget.label != null) LabelTextWidget(label: widget.label),
      if (widget.label != null) const SizedBox(height: spacingMedium),
      SizedBox(
          width: widget.textFieldSize ?? MediaQuery.sizeOf(context).width,
          child: CustomDropdownButton(
              hint: widget.hint,
              isRequired: widget.isRequired,
              items: widget.items,
              enabled: widget.enabled,
              selectedValue: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value;
                });
                widget.onChanged(selectedValue);
              }))
    ]);
  }
}
