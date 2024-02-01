import 'dart:convert';

GetMyLeavesModel getMyLeavesModelFromJson(String str) => GetMyLeavesModel.fromJson(json.decode(str));

String getMyLeavesModelToJson(GetMyLeavesModel data) => json.encode(data.toJson());

class GetMyLeavesModel {
  int status;
  String message;
  List<GetMyLeavesData> data;

  GetMyLeavesModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetMyLeavesModel.fromJson(Map<String, dynamic> json) => GetMyLeavesModel(
    status: json["status"],
    message: json["message"] ?? "",
    data: List<GetMyLeavesData>.from(json["data"].map((x) => GetMyLeavesData.fromJson(x)) ?? []),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
  };
}

class GetMyLeavesData {
  dynamic userId;
  String leaveType;
  dynamic leaveId;
  String leaveReason;
  DateTime startDate;
  DateTime endDate;
  List<String> approvers;
  String leaveStatus;

  GetMyLeavesData({
    required this.userId,
    required this.leaveType,
    required this.leaveId,
    required this.leaveReason,
    required this.startDate,
    required this.endDate,
    required this.approvers,
    required this.leaveStatus,
  });

  factory GetMyLeavesData.fromJson(Map<String, dynamic> json) => GetMyLeavesData(
    userId: json["user_id"] ?? "",
    leaveType: json["leave_type"] ?? "",
    leaveId: json["leave_id"] ?? "",
    leaveReason: json["leave_reason"] ?? "",
    startDate: DateTime.parse(json["start_date"] ?? ""),
    endDate: DateTime.parse(json["end_date"] ?? ""),
    approvers: List<String>.from(json["approvers"].map((x) => x) ?? []),
    leaveStatus: json["leave_status"] ?? "",
  );

  Map<String, dynamic> toJson() => {
    "user_id": userId,
    "leave_type": leaveType,
    "leave_id": leaveId,
    "leave_reason": leaveReason,
    "start_date": "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
    "end_date": "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
    "approvers": List<dynamic>.from(approvers.map((x) => x)),
    "leave_status": leaveStatus,
  };
}
