import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 80),
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
                  labelText: 'Nombre',
                  labelStyle:
                      TextStyle(color: Color.fromRGBO(236, 236, 236, 0.6)),
                  suffixIcon: Icon(Icons.person,
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
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                    ),
                    backgroundColor: const Color.fromRGBO(24, 101, 207, 1),
                  ),
                  child: const Text(
                    'Registrarse',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
