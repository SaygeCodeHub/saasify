import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/data/models/buttonAction/action_response_model.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/repositories/buttonAction/button_action_repository.dart';

import 'button_action_event.dart';
import 'button_action_state.dart';

class ButtonActionBloc extends Bloc<ButtonActionEvents, ButtonActionStates> {
  final ButtonActionRepository _buttonActionRepository =
      getIt<ButtonActionRepository>();

  ButtonActionBloc() : super(ButtonActionInitial()) {
    on<ButtonClicked>(_buttonClicked);
  }

  void _buttonClicked(
      ButtonClicked event, Emitter<ButtonActionStates> emit) async {
    emit(ButtonActionLoading());
    try {
      ActionResponseModel actionResponseModel =
          await _buttonActionRepository.performButtonAction(
              endpoint: event.endpoint,
              data: event.data,
              apiMethod: event.apiMethod);
      if (actionResponseModel.status == 200) {
        emit(ButtonActionSuccess());
      } else {
        emit(ButtonActionFailure(error: actionResponseModel.message));
      }
    } catch (e) {
      emit(ButtonActionFailure(error: e.toString()));
    }
  }
}
