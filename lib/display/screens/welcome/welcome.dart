import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    'Conoce las Rutas de Transporte',
                    style: TextStyle(fontSize: 30),
                  ),
                  SizedBox(
                    width: double
                        .infinity, // Establece el ancho del Image al ancho máximo disponible
                    height: 300,
                    child: Image.asset(
                      'assets/img/map_1.png',
                      fit: BoxFit.fill,
                    ),
                  ),
                  const Text(
                    'Explora el mapa interactivo para conocer todas las rutas de transporte público disponibles, horarios en tiempo real y actualizaciones de tráfico.',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
