import 'package:flutter/material.dart';

class GalleryPlace extends StatelessWidget {
  const GalleryPlace({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Primera imagen que abarca todo el ancho
        SizedBox(
          width: double.infinity,
          height: 150, // Puedes ajustar la altura según sea necesario
          child: Image.asset(
            'assets/img/image12.png', // URL de la imagen
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
            height: 8), // Espacio entre la primera y segunda fila de imágenes
        // Segunda fila de imágenes
        Row(
          children: [
            // Imagen 1 (mitad del ancho)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 4),
                child: SizedBox(
                  height: 100, // Puedes ajustar la altura según sea necesario
                  child: Image.asset(
                    'assets/img/image12.png', // URL de la imagen
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            // Imagen 2 (mitad del ancho)
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 4),
                child: SizedBox(
                  height: 100, // Puedes ajustar la altura según sea necesario
                  child: Image.asset(
                    'assets/img/image12.png', // URL de la imagen
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
