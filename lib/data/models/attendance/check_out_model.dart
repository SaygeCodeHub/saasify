class CheckOutModel {
  CheckOutModel({
    required this.status,
    required this.message,
    required this.data,
  });

  final int status;
  final String message;
  final Map data;

  factory CheckOutModel.fromJson(Map<String, dynamic> json) => CheckOutModel(
        status: json["status"],
        message: json["message"],
        data: json["data"],
      );
}
