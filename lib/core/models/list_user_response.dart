class ListUserResponse {
  final List<User> data;
  final String message;
  final bool success;

  ListUserResponse(
      {required this.data, required this.message, required this.success});

  factory ListUserResponse.fromJson(Map<String, dynamic> json) {
    return ListUserResponse(
      data: (json['data'] as List).map((i) => User.fromJson(i)).toList(),
      message: json['message'],
      success: json['success'],
    );
  }
}

class User {
  final String uuid;
  final String name;
  final String email;
  final String lastname;
  final String phoneNumber;

  User(
      {required this.uuid,
      required this.name,
      required this.email,
      required this.lastname,
      required this.phoneNumber});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uuid: json['uuid'],
      name: json['name'],
      email: json['email'],
      lastname: json['lastname'],
      phoneNumber: json['phoneNumber'],
    );
  }
}
