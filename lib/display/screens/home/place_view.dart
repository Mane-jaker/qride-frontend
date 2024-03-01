import 'package:flutter/material.dart';
import 'package:qride_app/display/widgets/home/gallery_place.dart';
import 'package:qride_app/display/widgets/home/star_rating.dart';

class PlaceView extends StatelessWidget {
  const PlaceView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            // Imagen que ocupa 1/4 de la altura de la pantalla
            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/img/image7.png', // Ejemplo de URL de imagen
                fit: BoxFit.cover,
              ),
            ),

            Positioned(
              top: MediaQuery.of(context).size.height / 4.5,
              left: 0,
              right: 0,
              bottom: 0,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
                  color: Colors.black,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Contenido del container
                    const Text(
                      'Parque de la Marimba',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const StarRating(rating: 0, labelText: 'Opiniones'),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Ave. central y 8va. poniente Chiapas.mexico, Tuxtla Gutierrez Mexico',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text(
                      'Mas Fotografias',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const GalleryPlace(),
                    const SizedBox(
                      height: 15,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Acción del botón
                      },
                      child: const Text('Botón en el Contenedor'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
