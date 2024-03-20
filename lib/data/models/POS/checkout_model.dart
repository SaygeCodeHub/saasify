class CheckOutModel {
  String message;
  int status;

  CheckOutModel({
    required this.message,
    required this.status,
  });

  factory CheckOutModel.fromJson(Map<String, dynamic> json) {
    return CheckOutModel(
      message: json['message'],
      status: json['status'],
    );
  }
}
