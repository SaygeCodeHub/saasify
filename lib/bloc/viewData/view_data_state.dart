import 'package:saasify/data/models/viewData/view_data_model.dart';

abstract class ViewDataStates {}

class ViewDataInitial extends ViewDataStates {}

class FetchingData extends ViewDataStates {}

class DataFetched extends ViewDataStates {
  final ViewData viewData;
  final List<ViewPOSData> viewPosData;

  DataFetched(this.viewData, this.viewPosData);
}

class ErrorFetchingData extends ViewDataStates {
  final String error;

  ErrorFetchingData(this.error);
}
