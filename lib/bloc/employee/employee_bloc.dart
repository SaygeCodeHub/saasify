import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saasify/bloc/employee/employee_event.dart';
import 'package:saasify/bloc/employee/employee_states.dart';
import 'package:saasify/data/models/employee/get_all_employees_model.dart';
import 'package:saasify/data/models/employee/invite_employee_model.dart';
import 'package:saasify/di/app_module.dart';
import 'package:saasify/repositories/employee/employee_repository.dart';

class EmployeeBloc extends Bloc<EmployeeEvents, EmployeeStates> {
  final Map inviteDetails = {};
  final EmployeeRepository _employeeRepository = getIt<EmployeeRepository>();

  EmployeeStates get initialState => InitialisingEmployeeStates();

  EmployeeBloc() : super(InitialisingEmployeeStates()) {
    on<InviteEmployee>(_inviteUser);
    on<GetAllEmployees>(_getAllEmployees);
  }

  FutureOr<void> _inviteUser(
      InviteEmployee event, Emitter<EmployeeStates> emit) async {
    emit(InvitingEmployee());
    try {
      InviteEmployeeModel inviteEmployeeModel =
          await _employeeRepository.inviteEmployee(event.inviteDetails);
      if (inviteEmployeeModel.status == 200) {
        emit(InvitationSent(inviteEmployeeModel: inviteEmployeeModel));
      } else {
        emit(InvitingFailed(
            errorMessage: inviteEmployeeModel.message.toString()));
      }
    } catch (e) {
      emit(InvitingFailed(errorMessage: e.toString()));
    }
  }

  FutureOr<void> _getAllEmployees(
      GetAllEmployees event, Emitter<EmployeeStates> emit) async {
    emit(LoadingEmployees());
    try {
      GetAllEmployeesModel getAllEmployeesModel =
          await _employeeRepository.getAllEmployees();
      if (getAllEmployeesModel.data.isNotEmpty) {
        emit(EmployeesLoaded(employees: getAllEmployeesModel.data));
      } else {
        emit(LoadingEmployeesFailed(errorMessage: 'No employees found'));
      }
    } catch (e) {
      emit(InvitingFailed(errorMessage: e.toString()));
    }
  }
}
