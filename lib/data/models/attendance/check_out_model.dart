class CheckOutModel {
  CheckOutModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final int status;
  final String message;
  final Data data;

  factory CheckOutModel.fromJson(Map<String, dynamic> json) => CheckOutModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  Data({
    required this.attendance,
  });

  final Attendance attendance;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        attendance: Attendance.fromJson(json["attendance"]),
      );
}

class Attendance {
  Attendance({
    required this.id,
    required this.employeeId,
    required this.branchId,
    required this.checkIn,
    this.checkOut,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final int employeeId;
  final int branchId;
  final DateTime checkIn;
  final dynamic checkOut;
  final DateTime createdAt;
  final DateTime updatedAt;

  factory Attendance.fromJson(Map<String, dynamic> json) => Attendance(
        id: json["id"],
        employeeId: json["employee_id"],
        branchId: json["branch_id"],
        checkIn: DateTime.parse(json["check_in"]),
        checkOut: json["check_out"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );
}
