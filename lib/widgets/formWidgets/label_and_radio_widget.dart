import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/form/form_structure_model.dart';

class LabelAndRadioWidget extends StatefulWidget {
  final List<OptionData> options;
  final String? label;
  final bool isRequired;
  final String? errorText;
  final String? initialValue;
  final void Function(String?)? onChanged;

  const LabelAndRadioWidget(
      {super.key,
      required this.options,
      this.initialValue,
      this.onChanged,
      this.label,
      this.errorText,
      this.isRequired = false});

  @override
  State<LabelAndRadioWidget> createState() => _LabelAndRadioWidgetState();
}

class _LabelAndRadioWidgetState extends State<LabelAndRadioWidget> {
  String groupValue = "";

  @override
  void initState() {
    groupValue = widget.initialValue ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FormField(
        initialValue: groupValue,
        validator: (value) {
          if (widget.isRequired && value == "") {
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
                        Radio<String>(
                            activeColor: AppColors.blue,
                            value: widget.options[index].value,
                            groupValue: groupValue,
                            onChanged: (String? value) {
                              setState(() {
                                state.didChange(value);
                                widget.onChanged!(value);
                                groupValue = value!;
                              });
                            }),
                        Text(widget.options[index].label ?? "")
                      ]));
                }))
              ]);
        });
  }
}
