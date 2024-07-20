class DeleteUserResponse {
  final String data;
  final String message;
  final bool success;

  DeleteUserResponse(
      {required this.data, required this.message, required this.success});

  factory DeleteUserResponse.fromJson(Map<String, dynamic> json) {
    return DeleteUserResponse(
      data: json['data'],
      message: json['message'],
      success: json['success'],
    );
  }
}
