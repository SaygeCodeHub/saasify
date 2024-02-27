import 'dart:convert';

FetchSalaryRolloutModel fetchSalaryRolloutModelFromJson(String str) =>
    FetchSalaryRolloutModel.fromJson(json.decode(str));

String fetchSalaryRolloutModelToJson(FetchSalaryRolloutModel data) =>
    json.encode(data.toJson());

class FetchSalaryRolloutModel {
  final int status;
  final String message;
  final SalaryRolloutData data;

  FetchSalaryRolloutModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory FetchSalaryRolloutModel.fromJson(Map<String, dynamic> json) =>
      FetchSalaryRolloutModel(
        status: json["status"],
        message: json["message"],
        data: SalaryRolloutData.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class SalaryRolloutData {
  final int totalSalaryRollout;
  final bool allRolledOut;
  final List<SalaryRollout> salaryRollout;

  SalaryRolloutData({
    required this.totalSalaryRollout,
    required this.allRolledOut,
    required this.salaryRollout,
  });

  factory SalaryRolloutData.fromJson(Map<String, dynamic> json) =>
      SalaryRolloutData(
        totalSalaryRollout: json["total_salary_rollout"],
        allRolledOut: json["all_rolled_out"],
        salaryRollout: List<SalaryRollout>.from(
            json["salary_rollout"].map((x) => SalaryRollout.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "total_salary_rollout": totalSalaryRollout,
        "all_rolled_out": allRolledOut,
        "salary_rollout":
            List<dynamic>.from(salaryRollout.map((x) => x.toJson())),
      };
}

class SalaryRollout {
  final int employeeId;
  final String name;
  final dynamic userContact;
  final String userEmail;
  final dynamic currentAddress;
  final int payroll;
  final bool isRolledOut;

  SalaryRollout({
    required this.employeeId,
    required this.name,
    required this.userContact,
    required this.userEmail,
    required this.currentAddress,
    required this.payroll,
    required this.isRolledOut,
  });

  factory SalaryRollout.fromJson(Map<String, dynamic> json) => SalaryRollout(
        employeeId: json["employee_id"],
        name: json["name"],
        userContact: json["user_contact"],
        userEmail: json["user_email"],
        currentAddress: json["current_address"],
        payroll: json["payroll"],
        isRolledOut: json["is_rolled_out"],
      );

  Map<String, dynamic> toJson() => {
        "employee_id": employeeId,
        "name": name,
        "user_contact": userContact,
        "user_email": userEmail,
        "current_address": currentAddress,
        "payroll": payroll,
        "is_rolled_out": isRolledOut,
      };
}
