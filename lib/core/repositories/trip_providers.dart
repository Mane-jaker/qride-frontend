import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qride_app/core/models/trip.dart';
import 'package:qride_app/core/services/user_service.dart';
import 'package:qride_app/core/utils/uuid_manager.dart';

final historyProvider = FutureProvider<List<Trip>>((ref) async {
  final historyService = UserService();
  final uuid = UUIDManager.getUuid();
  return historyService.historyByUUID(uuid);
});
