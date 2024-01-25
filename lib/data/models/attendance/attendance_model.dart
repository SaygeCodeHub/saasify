class AttendanceModel {
  AttendanceModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final int status;
  final String message;
  final Map data;

  factory AttendanceModel.fromJson(Map<String, dynamic> json) =>
      AttendanceModel(
          status: json["status"], message: json["message"], data: json["data"]);
}
