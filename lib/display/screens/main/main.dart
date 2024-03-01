import 'package:flutter/material.dart';
import 'package:qride_app/display/widgets/main/social_button.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

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
            const SocialButton(
                title: "Continua con Email",
                color: Color.fromRGBO(24, 101, 207, 1),
                icon: Icon(Icons.mark_email_read)),
            const SocialButton(
                title: "Continua con Google",
                color: Color.fromRGBO(19, 83, 148, 1),
                icon: Icon(Icons.tiktok)),
            const SocialButton(
                title: "Continua con Facebook",
                color: Color.fromRGBO(55, 74, 114, 1),
                icon: Icon(Icons.facebook)),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 3, horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '¿No tienes una cuenta?',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Regístrate aquí',
                    style: TextStyle(
                      fontSize: 15,
                      color: Color.fromRGBO(31, 125, 221, 1),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
