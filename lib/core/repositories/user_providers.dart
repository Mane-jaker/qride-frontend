import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qride_app/core/models/user_response.dart';
import 'package:qride_app/core/services/user_service.dart';

final userProvider = FutureProvider<UserResponse>((ref) async {
  final userService = UserService();
  const uuid = "c9e7f950-098c-4065-b5b4-2757ff3c7d23";
  return userService.userByUUID(uuid);
});
