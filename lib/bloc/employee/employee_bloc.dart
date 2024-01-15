import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/employee/employee_event.dart';
import 'package:saasify/bloc/employee/employee_state.dart';

class EmployeeBloc extends Bloc<EmployeeEvents, EmployeeStates> {
  EmployeeBloc() : super(EmployeeInitial()) {
    on<GetEmployees>(_getEmployees);
  }

  FutureOr<void> _getEmployees(
      GetEmployees event, Emitter<EmployeeStates> emit) {
    emit(EmployeesLoaded());
  }
}
