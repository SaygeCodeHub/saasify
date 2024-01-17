import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';

class ChangeBranch extends StatefulWidget {
  const ChangeBranch({super.key});

  @override
  State<ChangeBranch> createState() => _ChangeBranchState();
}

class _ChangeBranchState extends State<ChangeBranch> {
  String? selectedValue;
  List<String> items = [
    'Gorewada',
    'Narendra Nagar',
    'Dharampeth',
    'Civil Lines'
  ];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(Icons.store, color: AppColors.darkBlue),
        DropdownButtonHideUnderline(
          child: DropdownButton2(
            hint: const Text('Khamla'),
            items: items
                .map((item) => DropdownMenuItem<String>(
                      value: item,
                      child: Text(item),
                    ))
                .toList(),
            value: selectedValue,
            onChanged: (value) {
              setState(() {
                selectedValue = value as String;
              });
            },
          ),
        ),
      ],
    );
  }
}
