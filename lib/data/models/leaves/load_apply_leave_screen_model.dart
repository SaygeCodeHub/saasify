import 'dart:convert';

LoadApplyLeaveScreenModel loadApplyLeaveScreenModelFromJson(String str) => LoadApplyLeaveScreenModel.fromJson(json.decode(str));

String loadApplyLeaveScreenModelToJson(LoadApplyLeaveScreenModel data) => json.encode(data.toJson());

class LoadApplyLeaveScreenModel {
  int status;
  String message;
  ApplyLeaveData data;

  LoadApplyLeaveScreenModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory LoadApplyLeaveScreenModel.fromJson(Map<String, dynamic> json) => LoadApplyLeaveScreenModel(
    status: json["status"],
    message: json["message"] ?? "",
    data: ApplyLeaveData.fromJson(json["data"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class ApplyLeaveData {
  int casualLeaves;
  int medicalLeaves;
  List<Approver> approvers;

  ApplyLeaveData({
    required this.casualLeaves,
    required this.medicalLeaves,
    required this.approvers,
  });

  factory ApplyLeaveData.fromJson(Map<String, dynamic> json) => ApplyLeaveData(
    casualLeaves: json["casual_leaves"] ?? "",
    medicalLeaves: json["medical_leaves"] ?? "",
    approvers: List<Approver>.from(json["approvers"].map((x) => Approver.fromJson(x)) ?? []),
  );

  Map<String, dynamic> toJson() => {
    "casual_leaves": casualLeaves,
    "medical_leaves": medicalLeaves,
    "approvers": List<dynamic>.from(approvers.map((x) => x.toJson())),
  };
}

class Approver {
  int id;
  String approverName;

  Approver({
    required this.id,
    required this.approverName,
  });

  factory Approver.fromJson(Map<String, dynamic> json) => Approver(
    id: json["id"],
    approverName: json["approver_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "approver_name": approverName,
  };
}
