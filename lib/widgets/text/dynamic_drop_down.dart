import 'package:flutter/material.dart';
import 'package:saasify/widgets/text/custom_dropdown_widget.dart';
import 'package:saasify/widgets/text/dropdown_label_widget.dart';

class DynamicDropDown extends StatefulWidget {
  final Future future;
  final bool enabled;
  final String label;
  final bool isRequired;
  final dynamic initialValue;
  final void Function(dynamic) onChanged;

  const DynamicDropDown(
      {super.key,
      required this.future,
      this.enabled = true,
      required this.label,
      this.isRequired = false,
      required this.initialValue,
      required this.onChanged});

  @override
  State<DynamicDropDown> createState() => _DynamicDropDownState();
}

class _DynamicDropDownState extends State<DynamicDropDown> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.future,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return InkWell(
                onTap: () {
                  setState(() {});
                },
                child: const Text('Tap to retry loading data'));
          } else if (snapshot.hasData) {
            return DropdownLabelWidget(
                label: widget.label,
                enabled: widget.enabled,
                isRequired: widget.isRequired,
                initialValue: widget.initialValue,
                items: List<CustomDropDownItem>.from(snapshot.data?.data.map(
                        (e) => CustomDropDownItem(
                            label: e.userEmail, value: e.employeeId)) ??
                    []),
                onChanged: widget.onChanged);
          }
          return const Text('Something went wrong');
        });
  }
}
