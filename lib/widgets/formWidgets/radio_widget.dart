import 'package:flutter/material.dart';

class RadioWidget extends StatefulWidget {
  final List<String> options;
  final String? initialValue;
  final void Function(String?)? onChanged;
  const RadioWidget(
      {super.key, required this.options, this.initialValue, this.onChanged});
  @override
  State<RadioWidget> createState() => _RadioWidgetState();
}

class _RadioWidgetState extends State<RadioWidget> {
  String groupValue = "";

  @override
  void initState() {
    groupValue = widget.initialValue ?? "";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(
        widget.options.length,
        (index) {
          return Row(
            children: [
              Radio<String>(
                value: widget.options[index],
                groupValue: groupValue,
                onChanged: (String? value) {
                  setState(() {
                    widget.onChanged!(value);
                    groupValue = value!;
                  });
                },
              ),
              Text(widget.options[index]),
            ],
          );
        },
      ),
    );
  }
}
