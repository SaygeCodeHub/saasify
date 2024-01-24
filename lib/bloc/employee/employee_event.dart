abstract class EmployeeEvents {}

class InviteEmployee extends EmployeeEvents {
  final Map inviteDetails;

  InviteEmployee({required this.inviteDetails});
}
