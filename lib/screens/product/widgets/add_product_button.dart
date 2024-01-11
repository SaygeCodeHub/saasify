import 'package:flutter/material.dart';
import 'package:saasify/utils/custom_dialogue_util.dart';
import '../../../configs/app_dimensions.dart';
import '../../../utils/constants/string_constants.dart';
import '../../../widgets/primary_button.dart';

class AddProductButton extends StatelessWidget {
  const AddProductButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PrimaryButton(
        buttonWidth: kGeneralActionButtonWidth,
        onPressed: () {
          CustomDialogueUtils.addNewProductDialogue(context);
        },
        buttonTitle: StringConstants.kAddProduct);
  }
}
