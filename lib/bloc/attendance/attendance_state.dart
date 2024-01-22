abstract class AttendanceStates {}

class AttendanceInitial extends AttendanceStates {}

class CheckingIn extends AttendanceStates {}

class CheckedIn extends AttendanceStates {}

class ErrorCheckingIn extends AttendanceStates {
  final String message;
  ErrorCheckingIn({required this.message});
}

class CheckingOut extends AttendanceStates {}

class CheckedOut extends AttendanceStates {}

class ErrorCheckingOut extends AttendanceStates {}
