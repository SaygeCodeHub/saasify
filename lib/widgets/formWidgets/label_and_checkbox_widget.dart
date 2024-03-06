import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/form/form_structure_model.dart';

class LabelAndCheckBoxWidget extends StatefulWidget {
  final List<OptionData> options;
  final String? label;
  final bool isRequired;
  final String? errorText;
  final List<String>? initialValue;
  final void Function(List<String>?)? onChanged;

  const LabelAndCheckBoxWidget(
      {super.key,
      required this.options,
      this.label,
      this.initialValue,
      this.onChanged,
      this.errorText,
      this.isRequired = false});

  @override
  State<LabelAndCheckBoxWidget> createState() => _LabelAndCheckBoxWidgetState();
}

class _LabelAndCheckBoxWidgetState extends State<LabelAndCheckBoxWidget> {
  List<String> groupValue = [];

  @override
  void initState() {
    groupValue = widget.initialValue ?? [];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormField(
      initialValue: groupValue,
      validator: (value) {
        if (widget.isRequired && value!.isEmpty) {
          return widget.errorText ?? "Please select an option";
        }
        return null;
      },
      builder: (FormFieldState state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (widget.label != null)
              Text(widget.label!,
                  style: Theme.of(context).textTheme.fieldLabelTextStyle),
            if (widget.label != null) const SizedBox(height: spacingSmall),
            Wrap(
                children: List.generate(widget.options.length, (index) {
              return Padding(
                padding: const EdgeInsets.only(right: spacingSmall),
                child: Row(mainAxisSize: MainAxisSize.min, children: [
                  Checkbox(
                      activeColor: AppColors.blue,
                      value: groupValue.contains(widget.options[index].value),
                      onChanged: (bool? value) {
                        setState(() {
                          state.didChange(groupValue);
                          if (value == true) {
                            groupValue.add(widget.options[index].value);
                          } else {
                            groupValue.remove(widget.options[index].value);
                          }
                          widget.onChanged!(groupValue);
                        });
                      }),
                  Text(widget.options[index].label ?? "")
                ]),
              );
            })),
          ],
        );
      },
    );
  }
}
