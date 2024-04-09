class SignUpResponse {
  final String uuid;
  final String name;
  final String email;
  final String lastname;
  final String phoneNumber;
  final String message;
  final bool success;

  SignUpResponse({
    required this.uuid,
    required this.name,
    required this.email,
    required this.lastname,
    required this.phoneNumber,
    required this.message,
    required this.success,
  });

  factory SignUpResponse.fromJson(Map<String, dynamic> json) {
    return SignUpResponse(
      uuid: json['data']['uuid'],
      name: json['data']['name'],
      email: json['data']['email'],
      lastname: json['data']['lastname'],
      phoneNumber: json['data']['phoneNumber'],
      message: json['message'],
      success: json['success'],
    );
  }
}
