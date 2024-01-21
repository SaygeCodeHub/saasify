abstract class AttendanceStates {}

class AttendanceInitial extends AttendanceStates {}

class CheckingIn extends AttendanceStates {}

class CheckedIn extends AttendanceStates {}

class ErrorCheckingIn extends AttendanceStates {}

class CheckingOut extends AttendanceStates {}

class CheckedOut extends AttendanceStates {}

class ErrorCheckingOut extends AttendanceStates {}