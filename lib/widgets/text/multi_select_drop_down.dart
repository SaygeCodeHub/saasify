import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/utils/globals.dart';
import 'package:saasify/widgets/text/custom_dropdown_widget.dart';
import 'package:saasify/widgets/text/custom_text_field.dart';

class MultiSelectDropDown extends StatefulWidget {
  final List<CustomDropDownItem> items;
  final List<dynamic>? initialSelectedValues;
  final void Function(dynamic) onChanged;

  const MultiSelectDropDown(
      {super.key,
      required this.items,
      this.initialSelectedValues,
      required this.onChanged});

  @override
  State<MultiSelectDropDown> createState() => _MultiSelectDropDownState();
}

class _MultiSelectDropDownState extends State<MultiSelectDropDown> {
  List<dynamic> selectedValues = [];

  @override
  void didUpdateWidget(covariant MultiSelectDropDown oldWidget) {
    selectedValues = widget.initialSelectedValues ?? [];
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      readOnly: true,
      initialValue: valuesToLabel(widget.items, selectedValues),
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return DropDownDialogue(
                items: widget.items,
                selectedValues: selectedValues,
                onChanged: (values) {
                  widget.onChanged(values);
                  selectedValues = values;
                  setState(() {});
                });
          },
        );
      },
    );
  }
}

valuesToLabel(List<CustomDropDownItem> items, List<dynamic> values) {
  List<String> labels = [];
  for (var value in values) {
    var item = items.firstWhere((element) => element.value == value);
    labels.add(item.label);
  }
  return labels.join(", ");
}

class DropDownDialogue extends StatefulWidget {
  final List<CustomDropDownItem> items;
  final List<dynamic> selectedValues;
  final void Function(List<dynamic>) onChanged;

  const DropDownDialogue(
      {super.key,
      required this.items,
      required this.onChanged,
      required this.selectedValues});

  @override
  State<DropDownDialogue> createState() => _DropDownDialogueState();
}

class _DropDownDialogueState extends State<DropDownDialogue> {
  List<dynamic> selectedValues = [];

  @override
  void initState() {
    selectedValues = widget.selectedValues;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isMobile = MediaQuery.of(context).size.width < mobileBreakPoint;
    return AlertDialog(
      title: const Text('Select'),
      content: SizedBox(
        width: isMobile
            ? MediaQuery.of(context).size.width * 0.8
            : MediaQuery.of(context).size.width * 0.3,
        child: ListView.builder(
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
                    onChanged: (bool? value) {},
                  ),
                  Text(widget.items[index].label),
                ],
              ),
            );
          },
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }
}
