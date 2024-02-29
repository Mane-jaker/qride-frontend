import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:qride_app/display/screens/welcome/welcome.dart';
import 'package:qride_app/display/widgets/global/app_scaffold.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(); // Espera a que FlutterFire se inicialice
  runApp(const MyApp());
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
      home: const AppScaffold(),
    );
  }
}
