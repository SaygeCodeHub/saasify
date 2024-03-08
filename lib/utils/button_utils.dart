import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/buttonAction/button_action_bloc.dart';
import 'package:saasify/bloc/buttonAction/button_action_event.dart';
import 'package:saasify/configs/app_colors.dart';
import 'package:saasify/widgets/buttons/primary_button.dart';
import 'package:saasify/widgets/buttons/secondary_button.dart';

class ButtonUtils {
  static Icon getButtonIconFromType(String type) {
    switch (type) {
      case 'close':
        return Icon(Icons.close);
      case 'edit':
        return Icon(Icons.edit_outlined);
      case 'delete':
        return Icon(Icons.delete_outline, color: AppColors.errorRed);
      default:
        return Icon(Icons.add_outlined);
    }
  }

  static Widget getButtonFromType(BuildContext context,
      {required String buttonType,
      required void Function()? onPressed,
      required String buttonTitle,
      double? width}) {
    switch (buttonType) {
      case 'primary':
        return PrimaryButton(
            buttonWidth: width, onPressed: onPressed, buttonTitle: buttonTitle);
      case 'secondary':
        return SecondaryButton(
            buttonWidth: width, onPressed: onPressed, buttonTitle: buttonTitle);
      default:
        return PrimaryButton(
            buttonWidth: width, onPressed: onPressed, buttonTitle: buttonTitle);
    }
  }

  static void buttonAction(
    BuildContext context,
    Map<String, dynamic> data, {
    required String? buttonAction,
    required String? endPoint,
    required String? apiMethodType,
  }) {
    switch (buttonAction) {
      case 'api_call':
        context.read<ButtonActionBloc>().add(ButtonClicked(
            data: data,
            endpoint: endPoint ?? "",
            apiMethod: apiMethodType ?? "post"));
        break;
      case 'navigate':
        break;
      default:
        context.read<ButtonActionBloc>().add(ButtonClicked(
            data: data,
            endpoint: endPoint ?? "",
            apiMethod: apiMethodType ?? "post"));
        break;
    }
  }
}
