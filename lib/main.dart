import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qride_app/core/models/login_request.dart';
import 'package:qride_app/core/models/login_response.dart';
import 'package:qride_app/core/services/user_service.dart';
import 'package:qride_app/core/utils/jwt_manager.dart';
import 'package:qride_app/display/screens/welcome/welcome.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final UserService service = UserService();

  final LoginRequest loginRequest = LoginRequest();
  loginRequest.email = "ramosproque@gmail.com";
  loginRequest.password = "12345";
  try {
    final LoginResponse loginResponse =
        await service.authenticate(loginRequest);
    JwtManager.setJwt(loginResponse.jwtToken);
    runApp(const ProviderScope(child: MyApp()));
  } catch (e) {
    print('Error durante el inicio de sesión: $e');
    // En caso de error, puedes manejarlo como desees, por ejemplo, mostrando un mensaje al usuario o cerrando la aplicación
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qride',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        // Tema oscuro
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(31, 126, 221, 80),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      home: const Welcome(),
    );
  }
}
