import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qride_app/core/models/user_response.dart';
import 'package:qride_app/core/services/user_service.dart';
import 'package:qride_app/core/utils/uuid_manager.dart';

final refreshProvider = StateProvider.autoDispose<int>((_) => 0);

final userProvider = FutureProvider<UserResponse>((ref) async {
  final userService = UserService();
  final uuid = UUIDManager.getUuid();
  return userService.userByUUID(uuid);
});
