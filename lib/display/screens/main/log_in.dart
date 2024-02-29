import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool buttonsVisible = true;
  bool inputsVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          AnimatedOpacity(
            opacity: inputsVisible ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const TextField(
                  decoration: InputDecoration(labelText: 'Input 1'),
                ),
                const TextField(
                  decoration: InputDecoration(labelText: 'Input 2'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      buttonsVisible = true;
                      inputsVisible = false;
                    });
                  },
                  child: const Text('Regresar'),
                ),
              ],
            ),
          ),
          AnimatedOpacity(
            opacity: buttonsVisible ? 1.0 : 0.0,
            duration: const Duration(milliseconds: 500),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      buttonsVisible = false;
                      inputsVisible = true;
                    });
                  },
                  child: const Text('Botón 1'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      buttonsVisible = false;
                      inputsVisible = true;
                    });
                  },
                  child: const Text('Botón 2'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
