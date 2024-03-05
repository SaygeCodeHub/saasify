import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';

import '../../configs/app_colors.dart';
import '../text/custom_dropdown_widget.dart';

class CustomCheckboxListTile extends StatefulWidget {
  final String? label;

  final List<CustomDropDownItem> items;
  final List<dynamic> selectedValues;
  final void Function(List<dynamic>) onChanged;

  const CustomCheckboxListTile({
    super.key,
    required this.onChanged,
    this.label,
    required this.items,
    required this.selectedValues,
  });

  @override
  State<CustomCheckboxListTile> createState() => _CustomCheckboxListTileState();
}

class _CustomCheckboxListTileState extends State<CustomCheckboxListTile> {
  List<dynamic> selectedValues = [];

  @override
  void initState() {
    selectedValues = widget.selectedValues;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null)
          Text(widget.label!,
              style: Theme.of(context).textTheme.subDetailTextStyle),
        if (widget.label != null) const SizedBox(height: spacingSmall),
        ListView.builder(
          shrinkWrap: true,
          itemCount: widget.items.length,
          itemBuilder: (BuildContext context, int index) {
            return InkWell(
              onTap: () {
                if (selectedValues.contains(widget.items[index].value)) {
                  selectedValues.remove(widget.items[index].value);
                } else {
                  selectedValues.add(widget.items[index].value);
                }
                widget.onChanged(selectedValues);
                setState(() {});
              },
              child: Row(
                children: [
                  Checkbox(
                    value: selectedValues.contains(widget.items[index].value),
                    activeColor: AppColors.orange,
                    onChanged: (bool? value) {
                      if (selectedValues.contains(widget.items[index].value)) {
                        selectedValues.remove(widget.items[index].value);
                      } else {
                        selectedValues.add(widget.items[index].value);
                      }
                      widget.onChanged(selectedValues);
                      setState(() {});
                    },
                  ),
                  Text(widget.items[index].label),
                ],
              ),
            );
          },
        ),
        // CheckboxListTile(
        //   value: widget.value,
        //   onChanged: (newValue) {
        //     setState(() {
        //       widget.onChanged(newValue);
        //     });
        //   },
        //   title: widget.title != null
        //       ? DefaultTextStyle(
        //           style: widget.titleStyle ??
        //               Theme.of(context).textTheme.subDetailTextStyle,
        //           child: widget.title!
        //         )
        //       : null,
        //   subtitle: widget.subtitle != null
        //       ? DefaultTextStyle(
        //           style: widget.subtitleStyle ??
        //               Theme.of(context).textTheme.subDetailTextStyle,
        //           child: widget.subtitle!,
        //         )
        //       : null,
        //   contentPadding: widget.contentPadding,
        //   activeColor: widget.activeColor,
        //   tileColor: widget.tileColor,
        //   dense: widget.dense,
        //   secondary: widget.secondary,
        //   controlAffinity: ListTileControlAffinity.leading,
        //   mouseCursor: widget.mouseCursor,
        // ),
      ],
    );
  }
}
