import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qride_app/core/models/user_response.dart';
import 'package:qride_app/core/services/user_service.dart';

final userProvider = FutureProvider<UserResponse>((ref) async {
  final userService = UserService();
  const uuid = "c23e92fa-e09f-4852-8cb1-eee59a9e62a9";
  return userService.userByUUID(uuid);
});
