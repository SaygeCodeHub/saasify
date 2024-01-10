import 'package:flutter/material.dart';
import '../widgets/alert_dialogue_box.dart';
import 'constants/string_constants.dart';

class CustomDialogueUtils {
  static void errorFetchingProductDialogue(
    context,
    final String message,
  ) {
    showDialog(
        context: context,
        builder: (ctx) => AlertDialogueBox(
            title: StringConstants.kSomethingWentWrong,
            message: message.toString(),
            primaryButtonTitle: StringConstants.kOk,
            checkMarkVisible: false,
            primaryOnPressed: () {
              Navigator.pop(ctx);
            }));
  }
}
