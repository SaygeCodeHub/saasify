abstract class ButtonActionEvents {}

class ButtonClicked extends ButtonActionEvents {
  final String endpoint;
  final Map<String, dynamic> data;
  final String apiMethod;

  ButtonClicked(
      {required this.data, required this.endpoint, required this.apiMethod});
}
