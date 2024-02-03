import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';
import 'package:saasify/widgets/generalWidgets/status_chip.dart';
import 'package:saasify/widgets/text/custom_text_field.dart';

class TableAvatar extends DataCell {
  TableAvatar({String? avatarUrl})
      : super(
            Center(
              child: CircleAvatar(
                backgroundImage:
                    (avatarUrl != null) ? NetworkImage(avatarUrl) : null,
                backgroundColor: AppColors.black,
              ),
            ),
            showEditIcon: false);
}

class TableText extends DataCell {
  TableText({required String text})
      : super(Text(text,
            maxLines: 2,
            softWrap: false,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)));
}

class TableButton extends DataCell {
  TableButton({required String title, required void Function()? onPressed})
      : super(PrimaryButton(
          onPressed: onPressed,
          buttonTitle: title,
        ));
}

class TableTextField extends DataCell {
  TableTextField(
      {required void Function(String)? onTextFieldChanged,
      String? Function(String?)? validator,
      String? hintText, int? maxLines})
      : super(CustomTextField(
            onTextFieldChanged: onTextFieldChanged,
            validator: validator,
            hintText: hintText,
            maxLines: 5));
}

class TableStatusChips extends DataCell {
  TableStatusChips({required String status, required Color color})
      : super(StatusChip(text: status, color: color));
}

class TableRows extends DataCell {
  TableRows(
      {required List<Widget> children,
      MainAxisAlignment mainAxisAlignment = MainAxisAlignment.start})
      : super(Row(mainAxisAlignment: mainAxisAlignment, children: children));
}
