import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/announcemnet/announcement_bloc.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/widgets/form/form_input_fields.dart';
import 'package:saasify/widgets/text/field_label_widget.dart';

class AddAnnouncementForm extends StatelessWidget {
  const AddAnnouncementForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DatePickerField(
            label: 'Due Date',
            isRequired: true,
            initialDate: context
                .read<AnnouncementBloc>()
                .announcementDetails['due_date'],
            onTextFieldChanged: (date) {
              context.read<AnnouncementBloc>().announcementDetails['due_date'] =
                  date;
            }),
        const SizedBox(height: spacingLarge),
        LabelAndFieldWidget(
            label: 'Description',
            isRequired: true,
            initialValue: context
                    .read<AnnouncementBloc>()
                    .announcementDetails['description'] ??
                '',
            maxLines: 7,
            onTextFieldChanged: (text) {
              context
                  .read<AnnouncementBloc>()
                  .announcementDetails['description'] = text;
            })
      ],
    );
  }
}
