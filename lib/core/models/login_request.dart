class LoginRequest {
  late String email;
  late String password;

  toJson() {
    return {
      "email": email,
      "password": password,
    };
  }
}
