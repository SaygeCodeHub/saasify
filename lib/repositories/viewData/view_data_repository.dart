import 'package:saasify/data/models/viewData/view_data_model.dart';

abstract class ViewDataRepository {
  Future<ViewDataModel> fetchData(String endpoint, Map data);
}
