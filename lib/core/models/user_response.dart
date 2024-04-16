class UserResponse {
  final String uuid;
  final String name;
  final String email;
  final String lastname;
  final String phoneNumber;

  UserResponse({
    required this.uuid,
    required this.name,
    required this.email,
    required this.lastname,
    required this.phoneNumber,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      uuid: json['data']['uuid'],
      name: json['data']['name'],
      email: json['data']['email'],
      lastname: json['data']['lastname'],
      phoneNumber: json['data']['phoneNumber'],
    );
  }
}
