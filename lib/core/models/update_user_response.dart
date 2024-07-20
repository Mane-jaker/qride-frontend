class UpdateUserResponse {
  final UserData data;
  final String message;
  final bool success;

  UpdateUserResponse(
      {required this.data, required this.message, required this.success});

  factory UpdateUserResponse.fromJson(Map<String, dynamic> json) {
    return UpdateUserResponse(
      data: UserData.fromJson(json['data']),
      message: json['message'],
      success: json['success'],
    );
  }
}

class UserData {
  final String uuid;
  final String name;
  final String email;
  final String lastname;
  final String phoneNumber;

  UserData(
      {required this.uuid,
      required this.name,
      required this.email,
      required this.lastname,
      required this.phoneNumber});

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      uuid: json['uuid'],
      name: json['name'],
      email: json['email'],
      lastname: json['lastname'],
      phoneNumber: json['phoneNumber'],
    );
  }
}
