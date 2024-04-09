class SignUpRequest {
  late String name;
  late String lastname;
  late String phoneNumber;
  late String email;
  late String password;

  toJson() {
    return {
      "name": name,
      "lastname": lastname,
      "phoneNumber": phoneNumber,
      "email": email,
      "password": password,
    };
  }
}
