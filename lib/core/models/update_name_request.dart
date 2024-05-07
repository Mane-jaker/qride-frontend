class UpdateNameRequest {
  late String name;
  late String lastName;
  late String phoneNumber;
  late String email;
  late String password;

  toJson() {
    return {
      "name": name,
      "lastName": "shonsadasd",
      "phoneNumber": "9234567891",
      "email": "test123@gmail.com",
      "password": "12345678",
    };
  }
}
