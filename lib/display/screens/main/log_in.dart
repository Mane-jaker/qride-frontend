import 'package:flutter/material.dart';
import 'package:qride_app/core/models/login_request.dart';
import 'package:qride_app/core/models/login_response.dart';
import 'package:qride_app/core/services/user_service.dart';
import 'package:qride_app/display/widgets/global/app_scaffold.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final LoginRequest _logInRequest = LoginRequest();
  final UserService _userService = UserService();
  ValueNotifier<bool> _isLoading = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_updateEmail);
    _passwordController.addListener(_updatePassword);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  _updateEmail() {
    _logInRequest.email = _emailController.text;
  }

  _updatePassword() {
    _logInRequest.password = _passwordController.text;
  }

  _register() async {
    _isLoading.value = true;
    try {
      // Call the register method with _logInRequest
      LoginResponse response = await _userService.authenticate(_logInRequest);
      if (response.success) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const AppScaffold(),
          ),
        );
      }
    } finally {
      _isLoading.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100, bottom: 30),
              child: Image.asset(
                'assets/img/qridelogo.png',
                height: 280,
                width: 221,
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                decoration: const InputDecoration(
                  labelText: 'Correo electrónico',
                  labelStyle:
                      TextStyle(color: Color.fromRGBO(236, 236, 236, 0.6)),
                  suffixIcon: Icon(Icons.email,
                      color: Color.fromRGBO(236, 236, 236, 0.6)),
                  filled: true,
                  fillColor: Color(0xFF2F2F2F),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 13, horizontal: 18),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Contraseña',
                  labelStyle:
                      TextStyle(color: Color.fromRGBO(236, 236, 236, 0.6)),
                  suffixIcon: Icon(Icons.visibility,
                      color: Color.fromRGBO(236, 236, 236, 0.6)),
                  filled: true,
                  fillColor: Color(0xFF2F2F2F),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(6)),
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 13, horizontal: 18),
                ),
              ),
            ),
            const SizedBox(height: 22),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  Checkbox(value: false, onChanged: (value) {}),
                  const Text(
                    'Recuérdame',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      '¿Olvidaste tu contraseña?',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color.fromRGBO(31, 125, 221, 1),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ValueListenableBuilder<bool>(
                valueListenable: _isLoading,
                builder: (context, isLoading, child) {
                  return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: isLoading ? null : _register,
                      style: ElevatedButton.styleFrom(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(6)),
                        ),
                        backgroundColor: const Color.fromRGBO(24, 101, 207, 1),
                      ),
                      child: isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                              'Iniciar Sesion',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                              ),
                            ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
