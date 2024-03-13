import 'package:saasify/data/models/details/fetch_details_model.dart';

abstract class DetailsState {}

class DetailsInitial extends DetailsState {}

class FetchingDetails extends DetailsState {}

class DetailsFetched extends DetailsState {
  final FetchDetailsModel fetchDetailsModel;

  DetailsFetched({required this.fetchDetailsModel});
}

class DetailsCouldNotFetch extends DetailsState {
  final String errorMessage;

  DetailsCouldNotFetch({required this.errorMessage});
}
