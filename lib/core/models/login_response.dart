class LoginResponse {
  final String jwtToken;
  final String userToken;
  final String message;
  final bool success;

  LoginResponse({
    required this.jwtToken,
    required this.userToken,
    required this.message,
    required this.success,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      jwtToken: json['data']['jwt_token'],
      userToken: json['data']['user_token'],
      message: json['message'],
      success: json['success'],
    );
  }
}
