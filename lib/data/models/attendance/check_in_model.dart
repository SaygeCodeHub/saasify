class CheckInModel {
  CheckInModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final int status;
  final String message;
  final Map data;

  factory CheckInModel.fromJson(Map<String, dynamic> json) => CheckInModel(
        status: json["status"],
        message: json["message"],
        data: json["data"],
      );
}
