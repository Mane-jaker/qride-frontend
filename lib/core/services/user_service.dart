import 'package:qride_app/core/api_client.dart';
import 'package:qride_app/core/models/login_request.dart';
import 'package:qride_app/core/models/login_response.dart';
import 'package:qride_app/core/models/user_response.dart';

class UserService {
  final ApiClient _apiClient = ApiClient();

  Future<LoginResponse> authenticate(LoginRequest request) async {
    try {
      final response =
          await _apiClient.post("/users/sing_in", data: request.toJson());

      if (response.statusCode == 200) {
        print(response);
        return LoginResponse.fromJson(response.data);
      } else {
        throw Exception('Error de autenticación: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error de autenticación: $e');
    }
  }

  // Método para obtener un usuario por su UUID
  Future<UserResponse> userByUUID(String uuid) async {
    try {
      final response = await _apiClient.get("/users/$uuid");

      if (response.statusCode == 200) {
        print(response);
        return UserResponse.fromJson(response.data);
      } else {
        throw Exception('Error al obtener el usuario: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error al obtener el usuario: $e');
    }
  }

  // Método para obtener historial por su UUID
  Future<UserResponse> historyByUUID(String uuid) async {
    try {
      final response = await _apiClient.get("/history/user/$uuid");

      if (response.statusCode == 200) {
        print(response);
        return UserResponse.fromJson(response.data);
      } else {
        throw Exception('Error al obtener el usuario: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error al obtener el usuario: $e');
    }
  }
}
