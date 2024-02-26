import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/utils/constants/string_constants.dart';
import 'package:saasify/widgets/text/field_label_widget.dart';
import 'package:saasify/widgets/text/module_heading.dart';

class DetailsScreen extends StatelessWidget {
  final String title;
  final List<Widget> details;
  final bool showComments;
  final bool commentsEditable;
  final String? initialComments;
  final bool commentsRequired;
  final List<Widget> Function(GlobalKey<FormState>) actionsBuilder;
  final void Function(String?)? onCommentsChanged;
  final GlobalKey<FormState> updateKey = GlobalKey<FormState>();

  DetailsScreen({
    super.key,
    required this.title,
    required this.actionsBuilder,
    this.showComments = true,
    this.onCommentsChanged,
    this.commentsEditable = false,
    required this.details,
    required this.commentsRequired,
    this.initialComments,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ModuleHeading(label: title),
      ),
      bottomNavigationBar: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(spacingStandard),
        child: Row(
          children: actionsBuilder(updateKey)
              .map((e) => Expanded(
                      child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: spacingSmallest),
                    child: e,
                  )))
              .toList(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(mobileBodyPadding),
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
                          initialValue: initialComments,
                          label: StringConstants.kComments,
                          maxLines: 5,
                          onTextFieldChanged: onCommentsChanged,
                        )
                      ]
                    : []),
          ),
        ),
      ),
    );
  }
}
