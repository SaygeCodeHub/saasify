import 'dart:convert';

GetAllLeavesModel getAllLeavesFromJson(String str) =>
    GetAllLeavesModel.fromJson(json.decode(str));

String getAllLeavesToJson(GetAllLeavesModel data) => json.encode(data.toJson());

class GetAllLeavesModel {
  final int status;
  final String message;
  final Data data;

  GetAllLeavesModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory GetAllLeavesModel.fromJson(Map<String, dynamic> json) => GetAllLeavesModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data.toJson(),
      };
}

class Data {
  final List<dynamic> pendingLeaves;
  final List<MyLeaf> myLeaves;

  Data({
    required this.pendingLeaves,
    required this.myLeaves,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        pendingLeaves: List<dynamic>.from(json["pending_leaves"].map((x) => x)),
        myLeaves:
            List<MyLeaf>.from(json["my_leaves"].map((x) => MyLeaf.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pending_leaves": List<dynamic>.from(pendingLeaves.map((x) => x)),
        "my_leaves": List<dynamic>.from(myLeaves.map((x) => x.toJson())),
      };
}

class MyLeaf {
  final int userId;
  final String leaveType;
  final int leaveId;
  final String leaveReason;
  final DateTime startDate;
  final DateTime endDate;
  final List<String> approvers;
  final String leaveStatus;

  MyLeaf({
    required this.userId,
    required this.leaveType,
    required this.leaveId,
    required this.leaveReason,
    required this.startDate,
    required this.endDate,
    required this.approvers,
    required this.leaveStatus,
  });

  factory MyLeaf.fromJson(Map<String, dynamic> json) => MyLeaf(
        userId: json["user_id"],
        leaveType: json["leave_type"],
        leaveId: json["leave_id"],
        leaveReason: json["leave_reason"],
        startDate: DateTime.parse(json["start_date"]),
        endDate: DateTime.parse(json["end_date"]),
        approvers: List<String>.from(json["approvers"].map((x) => x)),
        leaveStatus: json["leave_status"],
      );

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "leave_type": leaveType,
        "leave_id": leaveId,
        "leave_reason": leaveReason,
        "start_date":
            "${startDate.year.toString().padLeft(4, '0')}-${startDate.month.toString().padLeft(2, '0')}-${startDate.day.toString().padLeft(2, '0')}",
        "end_date":
            "${endDate.year.toString().padLeft(4, '0')}-${endDate.month.toString().padLeft(2, '0')}-${endDate.day.toString().padLeft(2, '0')}",
        "approvers": List<dynamic>.from(approvers.map((x) => x)),
        "leave_status": leaveStatus,
      };
}
