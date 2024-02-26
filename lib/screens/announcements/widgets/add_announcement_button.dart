import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/announcemnet/announcement_bloc.dart';
import 'package:saasify/bloc/announcemnet/announcement_event.dart';
import 'package:saasify/bloc/announcemnet/announcement_state.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_dimensions.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/widgets/alertDialogs/error_alert_dialog.dart';
import 'package:saasify/widgets/alertDialogs/success_alert_dialog.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';

class AddAnnouncementButton extends StatelessWidget {
  final double buttonWidth;
  final bool isEdit;
  final GlobalKey<FormState> formKey;

  const AddAnnouncementButton(
      {super.key,
      required this.formKey,
      this.buttonWidth = kGeneralActionButtonWidth, required this.isEdit});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.white,
      child: Padding(
        padding: const EdgeInsets.all(spacingStandard),
        child: BlocConsumer<AnnouncementBloc, AnnouncementStates>(
          listener: (context, state) {
            if (state is AnnouncementAdded) {
              showDialog(
                  context: context,
                  builder: (context) => SuccessAlertDialog(
                        description: "Announcement Added successfully!",
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                      ));
            } else if (state is ErrorAddingAnnouncement) {
              showDialog(
                  context: context,
                  builder: (context) =>
                      ErrorAlertDialog(description: state.errorMessage));
            }
          },
          builder: (context, state) {
            if (state is AddingAnnouncement) {
              return const SizedBox(
                  width: kGeneralActionButtonWidth,
                  child: Center(child: CircularProgressIndicator()));
            }
            return PrimaryButton(
              buttonWidth: buttonWidth,
              onPressed: () {
                if (formKey.currentState?.validate() ?? false) {
                  context.read<AnnouncementBloc>().add(AddAnnouncement(isEdit: isEdit));
                }
              },
              buttonTitle:isEdit ? 'Edit Announcement' : 'Add Announcement',
            );
          },
        ),
      ),
    );
  }
}
