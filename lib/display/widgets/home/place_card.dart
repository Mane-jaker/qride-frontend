import 'package:flutter/material.dart';

class PlaceCard extends StatelessWidget {
  final Function() changeBody;
  final String text;

  const PlaceCard({
    Key? key,
    required this.text,
    required this.changeBody,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: GestureDetector(
        onTap: () {
          changeBody();
        },
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            height: 200,
            width: 150,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: Stack(
              children: [
                ClipRRect(
                  // Aplicar el borde redondeado a la imagen
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    'https://transparencia.upchiapas.edu.mx/imgs/slider/IMG_4884-hdr-compressor.jpg',
                    fit: BoxFit.cover,
                    width: double
                        .infinity, // Ancho de la imagen al tamaño del contenedor
                    height: double
                        .infinity, // Altura de la imagen al tamaño del contenedor
                  ),
                ),
                Positioned.fill(
                  // Para cubrir toda la imagen
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.black.withOpacity(0.5),
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  bottom: 10,
                  child: Text(
                    text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
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
