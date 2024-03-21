import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qride_app/core/models/trip.dart';
import 'package:qride_app/core/services/user_service.dart';

final historyProvider = FutureProvider<List<Trip>>((ref) async {
  final historyService = UserService();
  const uuid = "325ccee1-2561-4dce-8e9e-fc3570677154";
  return historyService.historyByUUID(uuid);
});
