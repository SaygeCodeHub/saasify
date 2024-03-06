import 'package:saasify/data/models/buttonAction/action_response_model.dart';

abstract class ButtonActionRepository {
  Future<ActionResponseModel> performButtonAction(
      {required String endpoint,
      required Map<String, dynamic> data,
      required String apiMethod});
}
