import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qride_app/core/models/user_response.dart';
import 'package:qride_app/core/services/user_service.dart';

final userProvider = FutureProvider<UserResponse>((ref) async {
  final userService = UserService();
  const uuid = "325ccee1-2561-4dce-8e9e-fc3570677154";
  return userService.userByUUID(uuid);
});
