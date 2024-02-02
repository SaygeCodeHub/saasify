import 'dart:convert';

GetAllLeavesModel getMyLeavesModelFromJson(String str) => GetAllLeavesModel.fromJson(json.decode(str));

String getMyLeavesModelToJson(GetAllLeavesModel data) => json.encode(data.toJson());

class GetAllLeavesModel {
  int status;
  String message;
  GetMyLeavesData data;

  GetAllLeavesModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetAllLeavesModel.fromJson(Map<String, dynamic> json) => GetAllLeavesModel(
    status: json["status"],
    message: json["message"] ?? "",
    data: GetMyLeavesData.fromJson(json["data"] ?? {}),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "message": message,
    "data": data.toJson(),
  };
}

class GetMyLeavesData {
  List<Leaf> pendingLeaves;
  List<Leaf> myLeaves;

  GetMyLeavesData({
    required this.pendingLeaves,
    required this.myLeaves,
  });

  factory GetMyLeavesData.fromJson(Map<String, dynamic> json) => GetMyLeavesData(
    pendingLeaves: List<Leaf>.from(json["pending_leaves"].map((x) => Leaf.fromJson(x))),
    myLeaves: List<Leaf>.from(json["my_leaves"].map((x) => Leaf.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "pending_leaves": List<dynamic>.from(pendingLeaves.map((x) => x.toJson())),
    "my_leaves": List<dynamic>.from(myLeaves.map((x) => x.toJson())),
  };
}

class Leaf {
  int userId;
  String leaveType;
  int leaveId;
  String leaveReason;
  DateTime startDate;
  DateTime endDate;
  List<String> approvers;
  String leaveStatus;
  String name;

  Leaf({
    required this.userId,
    required this.leaveType,
    required this.leaveId,
    required this.leaveReason,
    required this.startDate,
    required this.endDate,
    required this.approvers,
    required this.leaveStatus,
    required this.name,
  });

  factory Leaf.fromJson(Map<String, dynamic> json) => Leaf(
    userId: json["user_id"],
    leaveType: json["leave_type"] ?? "",
    leaveId: json["leave_id"],
    leaveReason: json["leave_reason"] ?? "",
    startDate: DateTime.parse(json["start_date"] ?? ""),
    endDate: DateTime.parse(json["end_date"] ?? ""),
    approvers: List<String>.from(json["approvers"].map((x) => x) ?? []),
    leaveStatus: json["leave_status"] ?? "",
    name: json["name"] ?? "",
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
    "name": name,
  };
}
