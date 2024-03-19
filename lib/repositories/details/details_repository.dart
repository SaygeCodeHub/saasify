import 'package:saasify/data/models/details/fetch_details_model.dart';

abstract class DetailsRepository {
  Future<FetchDetailsModel> fetchDetails(String endpoint);
}
