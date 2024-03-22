import 'package:flutter/material.dart';
import 'package:saasify/configs/app_spacing.dart';
import 'package:saasify/widgets/buttons/back_button.dart';
import 'package:saasify/widgets/formWidgets/label_and_textfield_widget.dart';
import 'package:saasify/widgets/layoutWidgets/screen_skeleton.dart';
import 'package:saasify/widgets/text/module_heading.dart';

class PosAddProduct extends StatelessWidget {
  static const routeName = 'PosAddProduct';

  PosAddProduct({super.key});

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
                        const ModuleHeading(label: 'Add Product'),
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
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Expanded(
                                  //   child: LabelAndDropdownWidget(
                                  //       label: 'Select Category',
                                  //       errorText: '',
                                  //       isRequired: true,
                                  //       initialValue: 'Coffee',
                                  //       items: [
                                  //         CustomDropDownItem(label: 'Coffee'),
                                  //         CustomDropDownItem(label: 'Maggie'),
                                  //         CustomDropDownItem(label: 'Donuts')
                                  //       ],
                                  //       onChanged: (value) {}),
                                  // ),
                                  Expanded(
                                    child: LabelAndTextFieldWidget(
                                        label: "Product Name",
                                        errorText: "",
                                        initialValue: "",
                                        maxLines: 1,
                                        isRequired: true,
                                        hintText: "",
                                        onTextFieldChanged: (value) {}),
                                  ),
                                  const SizedBox(width: spacingSmall),
                                  Expanded(
                                    child: LabelAndTextFieldWidget(
                                        label: "Description",
                                        errorText: "",
                                        initialValue: "",
                                        maxLines: 1,
                                        isRequired: true,
                                        hintText: "",
                                        onTextFieldChanged: (value) {}),
                                  ),
                                  const SizedBox(width: spacingSmall),
                                  Expanded(
                                    child: LabelAndTextFieldWidget(
                                        label: "Unit",
                                        errorText: "",
                                        initialValue: "",
                                        maxLines: 1,
                                        isRequired: true,
                                        hintText: "",
                                        onTextFieldChanged: (value) {}),
                                  ),
                                ],
                              ),
                              const SizedBox(height: spacingStandard),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: LabelAndTextFieldWidget(
                                        label: "Quantity",
                                        errorText: "",
                                        initialValue: "",
                                        maxLines: 1,
                                        isRequired: true,
                                        hintText: "",
                                        onTextFieldChanged: (value) {}),
                                  ),
                                  const SizedBox(width: spacingSmall),
                                  Expanded(
                                    child: LabelAndTextFieldWidget(
                                        label: "Price",
                                        errorText: "",
                                        initialValue: "",
                                        maxLines: 1,
                                        isRequired: true,
                                        hintText: "",
                                        onTextFieldChanged: (value) {}),
                                  ),
                                  const SizedBox(width: spacingSmall),
                                  Expanded(
                                    child: LabelAndTextFieldWidget(
                                        label: "Stock Quantity",
                                        errorText: "",
                                        initialValue: "",
                                        maxLines: 1,
                                        isRequired: true,
                                        hintText: "",
                                        onTextFieldChanged: (value) {}),
                                  ),
                                ],
                              )
                            ]),
                      ),
                    ),
                  ])));
    });
  }
}
