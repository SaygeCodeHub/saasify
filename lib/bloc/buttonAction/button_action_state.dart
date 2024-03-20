abstract class ButtonActionStates {}

class ButtonActionInitial extends ButtonActionStates {}

class ButtonActionLoading extends ButtonActionStates {}

class ButtonActionSuccess extends ButtonActionStates {
  final Map<String, dynamic>? data;
  final String message;
  ButtonActionSuccess({required this.message, this.data});
}

class ButtonActionFailure extends ButtonActionStates {
  final String error;

  ButtonActionFailure({required this.error});
}
