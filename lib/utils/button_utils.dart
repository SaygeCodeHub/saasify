import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/buttonAction/button_action_bloc.dart';
import 'package:saasify/bloc/buttonAction/button_action_event.dart';
import 'package:saasify/data/models/form/form_structure_model.dart';

class ButtonUtils {
  static IconData getButtonIconFromType(String type) {
    switch (type) {
      case 'close':
        return Icons.close;
      default:
        return Icons.add;
    }
  }

  static void buttonAction(
      BuildContext context, Button buttonData, Map<String, dynamic> data) {
    switch (buttonData.buttonAction) {
      case 'api_call':
        context.read<ButtonActionBloc>().add(ButtonClicked(
            data: data,
            endpoint: buttonData.endPoint ?? "",
            apiMethod: buttonData.apiMethodType ?? "post"));
        break;
      case 'navigate':
        break;
      default:
        context.read<ButtonActionBloc>().add(ButtonClicked(
            data: data,
            endpoint: buttonData.endPoint ?? "",
            apiMethod: buttonData.apiMethodType ?? "post"));
        break;
    }
  }
}
