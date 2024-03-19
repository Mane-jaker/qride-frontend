class JwtManager {
  static String? jwt;

  static void setJwt(String token) {
    jwt = token;
  }

  static String? getJwt() {
    return jwt;
  }
}
