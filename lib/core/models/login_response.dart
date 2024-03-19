class LoginResponse {
  final String jwtToken;
  final String userToken;

  LoginResponse({
    required this.jwtToken,
    required this.userToken,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      jwtToken: json['data']['jwt_token'],
      userToken: json['data']['user_token'],
    );
  }
}
