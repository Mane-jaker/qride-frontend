import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:qride_app/display/screens/home/home.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:qride_app/display/widgets/global/app_scaffold.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  ValueNotifier<bool> _isLoading = ValueNotifier<bool>(false);

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      _isLoading.value = true;
      try {
        // Crear el usuario con correo y contraseña
        UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text,
          password: _passwordController.text,
        );

        // Actualizar el perfil del usuario con el nombre
        await userCredential.user
            ?.updateProfile(displayName: _nameController.text);

        // Recargar el usuario para reflejar los cambios en el perfil
        await userCredential.user?.reload();
        User? user = FirebaseAuth.instance.currentUser;

        // Navegar a la página de inicio en caso de éxito
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Home(),
          ),
        );
      } on FirebaseAuthException catch (e) {
        // Manejar el error
        print('Error con código: ${e.code}');
        print(e.message);
      } finally {
        _isLoading.value = false;
      }
    }
  }

  Future<void> _registerWithGoogle() async {
    _isLoading.value = true;
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      if (googleUser == null) {
        _isLoading.value = false;
        return; // El usuario canceló el inicio de sesión
      }
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Navegar a la página de inicio en caso de éxito
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const Home(),
        ),
      );
    } on FirebaseAuthException catch (e) {
      // Maneja el error
      print('Error al iniciar sesión con Google: ${e.code}');
      print(e.message);
    } finally {
      _isLoading.value = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
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
                    controller: _nameController,
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
                    controller: _emailController,
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
                    controller: _passwordController,
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
                        child: Column(
                          children: [
                            ElevatedButton(
                              onPressed: isLoading ? null : _register,
                              style: ElevatedButton.styleFrom(
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6)),
                                ),
                                backgroundColor:
                                    const Color.fromRGBO(24, 101, 207, 1),
                              ),
                              child: isLoading
                                  ? const CircularProgressIndicator(
                                      color: Colors.white)
                                  : const Text(
                                      'Registrarse',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                      ),
                                    ),
                            ),
                            const SizedBox(height: 10),
                            ElevatedButton(
                              onPressed: isLoading ? null : _registerWithGoogle,
                              style: ElevatedButton.styleFrom(
                                shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6)),
                                ),
                                backgroundColor: Colors.white,
                                foregroundColor: Colors.black,
                              ),
                              child: const Text(
                                'Registrarse con Google',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
