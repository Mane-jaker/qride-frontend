import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Asegúrate de importar flutter_svg
import 'package:qride_app/display/screens/main/log_in.dart';
import 'package:qride_app/display/screens/register/register_page.dart';
import 'package:qride_app/display/widgets/global/app_scaffold.dart';
import 'package:qride_app/display/widgets/main/social_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  Future<void> _signInWithGoogle(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final FirebaseAuth auth = FirebaseAuth.instance;

    try {
      // Iniciar sesión con Google
      final GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      if (googleUser == null) {
        // El usuario canceló el inicio de sesión
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Crear una nueva credencial con el token de Google
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Iniciar sesión con la credencial de Google
      final UserCredential userCredential =
          await auth.signInWithCredential(credential);

      // Verifica si el usuario está autenticado
      if (userCredential.user != null) {
        // Navega a la página principal o realiza otras acciones necesarias
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
                const AppScaffold(), // Reemplaza con tu página principal
          ),
        );
      }
    } catch (e) {
      // Maneja cualquier error que ocurra durante el inicio de sesión
      print('Error al iniciar sesión con Google: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al iniciar sesión con Google: $e')),
      );
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
              padding: const EdgeInsets.only(top: 100, bottom: 55),
              child: Image.asset(
                'assets/img/qridelogo.png',
                height: 280,
                width: 221,
              ),
            ),
            const SizedBox(height: 10),
            SocialButton(
              title: "Continúa con Email",
              color: const Color.fromRGBO(24, 101, 207, 1),
              icon: const Icon(Icons.mark_email_read),
              onPressed: () {
                // Navega a la página de inicio de sesión con email
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                );
              },
            ),
            SocialButton(
              title: "Continúa con Google",
              color: const Color.fromRGBO(19, 83, 148, 1),
              icon: SvgPicture.asset(
                'assets/img/Google.svg',
                height: 22.0,
                width: 22.0,
              ),
              onPressed: () => _signInWithGoogle(
                  context), // Llama a la función de inicio de sesión con Google
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '¿No tienes una cuenta?',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 10),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RegisterPage()),
                      );
                    },
                    child: const Text(
                      'Regístrate aquí',
                      style: TextStyle(
                        fontSize: 15,
                        color: Color.fromRGBO(31, 125, 221, 1),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
