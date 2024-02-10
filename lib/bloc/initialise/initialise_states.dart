import 'package:saasify/data/models/initialise/initialise_app_model.dart';

abstract class InitialiseAppStates {}

class InitialiseStates extends InitialiseAppStates {}

class InitialisingApp extends InitialiseAppStates {}

class AppInitialised extends InitialiseAppStates {
  final bool isGeoFencing;
  final InitialiseAppModel initialiseAppModel;

  AppInitialised(
      {required this.isGeoFencing, required this.initialiseAppModel});
}

class InitialisingAppFailed extends InitialiseAppStates {
  final String errorMessage;

  InitialisingAppFailed({required this.errorMessage});
}
