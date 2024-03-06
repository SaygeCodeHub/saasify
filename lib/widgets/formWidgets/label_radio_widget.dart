import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/data/models/form/form_structure_model.dart';

class LabelRadioWidget extends StatefulWidget {
  final List<OptionData> options;
  final String? label;
  final String? initialValue;
  final void Function(String?)? onChanged;

  const LabelRadioWidget(
      {super.key,
      required this.options,
      this.initialValue,
      this.onChanged,
      this.label});

  @override
  State<LabelRadioWidget> createState() => _LabelRadioWidgetState();
}

class _LabelRadioWidgetState extends State<LabelRadioWidget> {
  String groupValue = "";

  @override
  void initState() {
    groupValue = widget.initialValue ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                      widget.onChanged!(value);
                      groupValue = value!;
                    });
                  }),
              Text(widget.options[index].label ?? "")
            ]),
          );
        })),
      ],
    );
  }
}
