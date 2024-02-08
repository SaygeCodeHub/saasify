abstract class InitialiseAppStates {}

class InitialiseStates extends InitialiseAppStates {}

class InitialisingApp extends InitialiseAppStates {}

class AppInitialised extends InitialiseAppStates {}

class InitialisingAppFailed extends InitialiseAppStates {
  final String errorMessage;
  InitialisingAppFailed({required this.errorMessage});
}
