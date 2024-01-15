import 'package:flutter/material.dart';

import 'package:saasify/widgets/custom_text_field.dart';
import '../configs/app_color.dart';
import '../configs/app_spacing.dart';

typedef StringCallBack = Function(String textField);

class CustomDropdownWidget extends StatefulWidget {
  final String? Function(String?)? validator;
  final bool canEdit;
  final String? initialValue;
  final List<String> listItems;
  final Map dataMap;
  final String mapKey;
  final bool addOption;
  final String hintText;
  final Widget? disabledHint;
  final void Function()? onChanges;

  const CustomDropdownWidget({
    Key? key,
    this.validator,
    this.initialValue,
    this.canEdit = true,
    required this.listItems,
    required this.dataMap,
    required this.mapKey,
    this.disabledHint,
    this.addOption = false,
    this.hintText = '',
    this.onChanges,
  }) : super(key: key);

  @override
  DropdownScreenState createState() => DropdownScreenState();
}

class DropdownScreenState extends State<CustomDropdownWidget> {
  String? selectedValue;

  @override
  void initState() {
    widget.dataMap[widget.mapKey] = widget.initialValue ?? widget.listItems[0];
    selectedValue = widget.initialValue ?? widget.listItems[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            width: double.maxFinite,
            decoration: BoxDecoration(
              color: AppColor.saasifyLighterGrey,
              border: Border.all(color: AppColor.saasifyWhite),
              borderRadius: BorderRadius.circular(spacingMedium),
            ),
            child: DropdownButtonHideUnderline(
                child: DropdownButton(
                    isDense: true,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    borderRadius: BorderRadius.circular(12),
                    value: selectedValue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: List.generate(
                        widget.listItems.length,
                        (index) => DropdownMenuItem(
                            value: widget.listItems[index],
                            child: Text(widget.listItems[index]))),
                    onChanged: (widget.canEdit)
                        ? (value) {
                            setState(() {
                              selectedValue = value.toString();
                            });
                            widget.dataMap[widget.mapKey] = value;
                            if (widget.onChanges != null) {
                              widget.onChanges!();
                            }
                          }
                        : null))),
        Visibility(
            visible: widget.addOption,
            child: const SizedBox(height: spacingSmall)),
        Visibility(
          visible: widget.addOption,
          child: CustomTextField(
              enabled: selectedValue == widget.listItems.last,
              hintText: 'Add New Category',
              onTextFieldChanged: (value) {
                widget.dataMap[widget.mapKey] = value;
              }),
        )
      ],
    );
  }
}
