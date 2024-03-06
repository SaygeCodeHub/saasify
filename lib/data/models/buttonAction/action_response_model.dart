class ActionResponseModel {
  final String message;
  final Map<String, dynamic>? data;
  final int status;

  ActionResponseModel({required this.message, required this.status, this.data});

  factory ActionResponseModel.fromJson(Map<String, dynamic> json) {
    return ActionResponseModel(
      message: json['message'],
      status: json['status'],
      data: json['data'],
    );
  }
}
