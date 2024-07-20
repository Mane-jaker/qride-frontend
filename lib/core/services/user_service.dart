import 'package:qride_app/core/api_client.dart';
import 'package:qride_app/core/models/delete_user_response.dart';
import 'package:qride_app/core/models/list_user_response.dart';
import 'package:qride_app/core/models/login_request.dart';
import 'package:qride_app/core/models/login_response.dart';
import 'package:qride_app/core/models/sing_up_request.dart';
import 'package:qride_app/core/models/sing_up_response.dart';
import 'package:qride_app/core/models/trip.dart';
import 'package:qride_app/core/models/update_user_response.dart';
import 'package:qride_app/core/models/user_response.dart';

class UserService {
  final ApiClient _apiClient = ApiClient();

  Future<LoginResponse> authenticate(LoginRequest request) async {
    try {
      final response = await _apiClient.postWithoutJwt(
          "http://44.222.31.173:8080/api/v1/users/sing_in",
          data: request.toJson());

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

  Future<SignUpResponse> register(SignUpRequest request) async {
    try {
      print(request.toJson());
      final response = await _apiClient.postWithoutJwt(
          "http://44.222.31.173:8080/api/v1/users/sing_up",
          data: request.toJson());

      if (response.statusCode == 200) {
        print(response);
        return SignUpResponse.fromJson(response.data);
      } else {
        throw Exception('Error de registro: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error de registro: $e');
    }
  }

  Future<UpdateUserResponse> updateUserByUUID(
      String uuid, SignUpRequest request) async {
    try {
      final response =
          await _apiClient.put("/users/$uuid", data: request.toJson());

      if (response.statusCode == 200) {
        print(response);
        return UpdateUserResponse.fromJson(response.data);
      } else {
        throw Exception('Error al obtener el usuario: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error al obtener el usuario: $e');
    }
  }

  Future<DeleteUserResponse> deleteUserByUUID(String uuid) async {
    try {
      final response = await _apiClient.delete("/users/$uuid");

      if (response.statusCode == 200) {
        print(response);
        return DeleteUserResponse.fromJson(response.data);
      } else {
        throw Exception('Error al eliminar el usuario: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error al eliminar el usuario: $e');
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

  Future<ListUserResponse> listAllUsers() async {
    try {
      final response = await _apiClient.get("/users");

      if (response.statusCode == 200) {
        print(response);
        return ListUserResponse.fromJson(response.data);
      } else {
        throw Exception(
            'Error al obtener los usuarios: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error al obtener los usuarios: $e');
    }
  }

  Future<String> getUuidByEmail(String email) async {
    try {
      ListUserResponse listUserResponse = await listAllUsers();
      for (User user in listUserResponse.data) {
        if (user.email == email) {
          return user.uuid;
        }
      }
      throw Exception('No se encontró un usuario con el correo $email');
    } catch (e) {
      throw Exception('Error al obtener los usuarios: $e');
    }
  }

  // Método para obtener historial por su UUID
  Future<List<Trip>> historyByUUID(String uuid) async {
    try {
      final response = await _apiClient.get("/history/user/$uuid");

      if (response.statusCode == 200) {
        final List<dynamic> responseData = response.data['data'];
        final List<Trip> trips =
            responseData.map((tripData) => Trip.fromJson(tripData)).toList();
        return trips;
      } else {
        throw Exception(
            'Error al obtener la historia del usuario: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error al obtener la historia del usuario: $e');
    }
  }
}
