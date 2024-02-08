
abstract class InitialiseAppStates {}

class InitialiseStates extends InitialiseAppStates {}

class InitialisingApp extends InitialiseAppStates {}

class AppInitialised extends InitialiseAppStates {
  final bool isGeoFencing;

  AppInitialised({required this.isGeoFencing});
}

class InitialisingAppFailed extends InitialiseAppStates {
  final String errorMessage;

  InitialisingAppFailed({required this.errorMessage});
}
