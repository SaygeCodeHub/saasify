import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';
import 'package:saasify/widgets/generalWidgets/status_chip.dart';

class TableAvatar extends DataCell {
  const TableAvatar()
      : super(const Center(child: Icon(Icons.person)), showEditIcon: false);
}

class TableText extends DataCell {
  TableText({required String text})
      : super(Text(text,
            maxLines: 2,
            softWrap: false,
            overflow: TextOverflow.fade,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)));
}

class TableButton extends DataCell {
  TableButton(
      {required String title,
      required void Function()? onPressed,
      TextStyle? textStyle})
      : super(Padding(
          padding: const EdgeInsets.all(spacingMedium),
          child: PrimaryButton(
            buttonWidth: 50,
            onPressed: onPressed,
            buttonTitle: title,
            textStyle: textStyle,
          ),
        ));
}

class TableStatusChips extends DataCell {
  TableStatusChips({required String status, required Color color})
      : super(StatusChip(text: status, color: color));
}
