import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/widgets/buttons/back_button.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';
import 'package:saasify/widgets/formWidgets/label_and_textfield_widget.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';
import 'package:saasify/widgets/text/module_heading.dart';

class PosAddCategory extends StatelessWidget {
  static const routeName = 'PosAddCategory';

  PosAddCategory({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ScreenSkeleton(childScreenBuilder: (isMobile) {
      return Form(
          key: _formKey,
          child: Padding(
              padding: const EdgeInsets.only(
                  left: spacingStandard,
                  right: spacingStandard,
                  top: spacingStandard),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        isMobile
                            ? const SizedBox.shrink()
                            : CustomBackButton(onPressed: () {
                                Navigator.pop(context);
                              }),
                        const ModuleHeading(label: 'Add Category'),
                        const Spacer()
                      ],
                    ),
                    const SizedBox(height: spacingStandard),
                    Card(
                      margin: const EdgeInsets.only(bottom: spacingStandard),
                      child: Padding(
                        padding: const EdgeInsets.all(spacingStandard),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              LabelAndTextFieldWidget(
                                  label: "Category Name",
                                  errorText: "",
                                  initialValue: "",
                                  maxLines: 1,
                                  isRequired: true,
                                  hintText: "",
                                  onTextFieldChanged: (value) {}),
                              const SizedBox(height: spacingStandard),
                              LabelAndTextFieldWidget(
                                  label: "Description",
                                  errorText: "",
                                  initialValue: "",
                                  maxLines: 1,
                                  isRequired: true,
                                  hintText: "",
                                  onTextFieldChanged: (value) {}),
                              const SizedBox(height: spacingStandard),
                            ]),
                      ),
                    ),
                    const SizedBox(height: spacingStandard),
                    (isMobile)
                        ? PrimaryButton(
                            buttonWidth: double.maxFinite,
                            onPressed: () {},
                            buttonTitle: 'Add Category')
                        : Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              PrimaryButton(
                                  buttonWidth: 50,
                                  onPressed: () {},
                                  buttonTitle: 'Add Category')
                            ],
                          ),
                    const SizedBox(height: spacingStandard)
                  ])));
    });
  }
}
