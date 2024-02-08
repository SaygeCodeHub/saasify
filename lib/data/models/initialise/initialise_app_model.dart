import 'dart:convert';

InitialiseAppModel initialiseAppModelFromJson(String str) =>
    InitialiseAppModel.fromJson(json.decode(str));

String initialiseAppModelToJson(InitialiseAppModel data) =>
    json.encode(data.toJson());

class InitialiseAppModel {
  final int? status;
  final String? message;
  final Data? data;

  InitialiseAppModel({
    this.status,
    this.message,
    this.data,
  });

  factory InitialiseAppModel.fromJson(Map<String, dynamic> json) =>
      InitialiseAppModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
      };
}

class Data {
  final List<Branch>? branches;
  final int? totalEmployees;
  final int? pendingLeaves;
  final int? monthlySalaryRollout;

  Data({
    this.branches,
    this.totalEmployees,
    this.pendingLeaves,
    this.monthlySalaryRollout,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        branches: json["branches"] == null
            ? []
            : List<Branch>.from(
                json["branches"]!.map((x) => Branch.fromJson(x))),
        totalEmployees: json["total_employees"],
        pendingLeaves: json["pending_leaves"],
        monthlySalaryRollout: json["monthly_salary_rollout"],
      );

  Map<String, dynamic> toJson() => {
        "branches": branches == null
            ? []
            : List<dynamic>.from(branches!.map((x) => x.toJson())),
        "total_employees": totalEmployees,
        "pending_leaves": pendingLeaves,
        "monthly_salary_rollout": monthlySalaryRollout,
      };
}

class Branch {
  final String? branchName;
  final int? branchId;
  final List<int>? accessibleModules;
  final List<double>? accessibleFeatures;
  final bool? geoFencing;

  Branch({
    this.branchName,
    this.branchId,
    this.accessibleModules,
    this.accessibleFeatures,
    this.geoFencing,
  });

  factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        branchName: json["branch_name"],
        branchId: json["branch_id"],
        accessibleModules: json["accessible_modules"] == null
            ? []
            : List<int>.from(json["accessible_modules"]!.map((x) => x)),
        accessibleFeatures: json["accessible_features"] == null
            ? []
            : List<double>.from(
                json["accessible_features"]!.map((x) => x?.toDouble())),
        geoFencing: json["geo_fencing"],
      );

  Map<String, dynamic> toJson() => {
        "branch_name": branchName,
        "branch_id": branchId,
        "accessible_modules": accessibleModules == null
            ? []
            : List<dynamic>.from(accessibleModules!.map((x) => x)),
        "accessible_features": accessibleFeatures == null
            ? []
            : List<dynamic>.from(accessibleFeatures!.map((x) => x)),
        "geo_fencing": geoFencing,
      };
}
