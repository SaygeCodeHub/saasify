class AttendanceModel {
  AttendanceModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final int status;
  final String message;
  final Data data;

  factory AttendanceModel.fromJson(Map<String, dynamic> json) => AttendanceModel(
        status: json["status"],
        message: json["message"],
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  Data({
    required this.time,
  });

  final DateTime time;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        time: DateTime.parse(json["created_at"]),
      );
}