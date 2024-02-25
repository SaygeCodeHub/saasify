import 'package:flutter/material.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/configs/app_theme.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/text/field_label_widget.dart';
import 'package:saasify/widgets/text/module_heading.dart';

class DetailsPopUp extends StatelessWidget {
  final String title;
  final List<Widget> details;
  final bool showComments;
  final bool commentsEditable;
  final bool commentsRequired;
  final List<Widget> Function(GlobalKey<FormState>) actionsBuilder;
  final void Function(String?)? onCommentsChanged;
  final GlobalKey<FormState> updateKey = GlobalKey<FormState>();

  DetailsPopUp({
    super.key,
    required this.title,
    required this.actionsBuilder,
    this.showComments = true,
    this.onCommentsChanged,
    this.commentsEditable = false,
    required this.details,
    required this.commentsRequired,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        icon: Align(
            alignment: Alignment.topRight,
            child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.close))),
        title: ModuleHeading(label: title),
        content: SizedBox(
            height: MediaQuery.sizeOf(context).height * 0.5,
            width: MediaQuery.sizeOf(context).width * 0.5,
            child: Padding(
                padding: const EdgeInsets.all(spacingMedium),
                child: Form(
                    key: updateKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: details +
                            (showComments
                                ? [
                                    const SizedBox(height: spacingSmall),
                                    LabelAndFieldWidget(
                                        isRequired: commentsRequired,
                                        enabled: commentsEditable,
                                        label: StringConstants.kComments,
                                        maxLines: 5,
                                        onTextFieldChanged: onCommentsChanged)
                                  ]
                                : []))))),
        actionsPadding: const EdgeInsets.only(bottom: spacingXXLarge),
        actionsAlignment: MainAxisAlignment.center,
        actions: actionsBuilder(updateKey));
  }
}

class DetailsField extends StatelessWidget {
  final String title;
  final String data;

  const DetailsField({
    super.key,
    required this.data,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Title(
        color: AppColors.black,
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("$title : ",
              style: Theme.of(context).textTheme.labelTextStyle.copyWith(
                  fontWeight: FontWeight.w600, color: AppColors.darkBlue)),
          Text(data, maxLines: 1)
        ]));
  }
}
