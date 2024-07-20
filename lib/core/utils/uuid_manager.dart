class UUIDManager {
  static String uuid = '';

  static void setUuid(String token) {
    uuid = token;
  }

  static String getUuid() {
    return uuid;
  }
}
