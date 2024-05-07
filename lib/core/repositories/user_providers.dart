import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qride_app/core/models/user_response.dart';
import 'package:qride_app/core/services/user_service.dart';

final userProvider = FutureProvider<UserResponse>((ref) async {
  final userService = UserService();
  const uuid = "c8d0f520-79a3-4e62-b805-af1520240165";
  return userService.userByUUID(uuid);
});
