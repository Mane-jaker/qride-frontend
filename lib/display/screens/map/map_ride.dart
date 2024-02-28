import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapRide extends StatefulWidget {
  const MapRide({super.key});

  @override
  State<MapRide> createState() => _MapRideState();
}

class _MapRideState extends State<MapRide> {
  late GoogleMapController mapController;
  double _boxHeight = 200;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Widget para la imagen
        Image.asset(
          'assets/img/map_e.png', // URL de la imagen
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
        // Widget para la caja azul
        DraggableScrollableSheet(
          initialChildSize: 0.2, // Altura inicial del modal (20%)
          minChildSize: 0.1, // Altura mínima del modal (10%)
          maxChildSize: 0.8, // Altura máxima del modal (80%)
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: ListView(
                controller: scrollController,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: const Text(
                        'Buscar rutas cercanas al punto',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  // Agrega más contenido si es necesario
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
