import 'package:flutter/material.dart';

class BottomNavbar extends StatelessWidget {
  final Function(BuildContext, int)? onTap;
  final int currentIndex;
  const BottomNavbar(
      {super.key, required this.onTap, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          // Posiciona el círculo de resaltado en la posición del ítem seleccionado
          bottom: 5,
          left: MediaQuery.of(context).size.width *
              currentIndex /
              3, // Divide la pantalla en 3 partes iguales para obtener la posición correcta
          child: Container(
            width: MediaQuery.of(context).size.width / 3,
            height: kBottomNavigationBarHeight - 3,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromRGBO(
                  31, 126, 221, 80), // Color de fondo del círculo resaltado
            ),
          ),
        ),
        BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code_scanner_rounded),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.directions_bus),
              label: '',
            ),
          ],
          currentIndex: currentIndex,
          onTap: (index) => onTap!(context, index),
          backgroundColor: Colors.transparent,
          elevation: 0,
          showSelectedLabels: false,
          showUnselectedLabels: false,
        ),
      ],
    );
  }
}
