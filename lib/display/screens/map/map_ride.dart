import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapRide extends StatefulWidget {
  const MapRide({super.key});

  @override
  State<MapRide> createState() => _MapRideState();
}

class _MapRideState extends State<MapRide> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(16.747778, -93.117444); // Punto inicial
  LocationData? currentLocation;

  final LatLng _startPoint =
      const LatLng(16.747778, -93.117444); // Punto inicial especificado
  final LatLng _endPoint =
      const LatLng(16.746833, -93.111444); // Punto final especificado

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<void> _getCurrentLocation() async {
    final location = Location();
    try {
      final loc = await location.getLocation();
      setState(() {
        currentLocation = loc;
      });
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            target: LatLng(loc.latitude!, loc.longitude!),
            zoom: 14.0,
          ),
        ),
      );
    } catch (e) {
      print("Error getting location: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Widget para el mapa de Google
          GoogleMap(
            onMapCreated: _onMapCreated,
            initialCameraPosition: CameraPosition(
              target: _center,
              zoom: 11.0,
            ),
            myLocationEnabled: true,
            myLocationButtonEnabled:
                false, // Deshabilitamos el botón predeterminado
            mapType: MapType.normal,
            markers: {
              Marker(
                markerId: const MarkerId('start'),
                position: _startPoint,
                infoWindow: const InfoWindow(
                  title: 'Start Point',
                ),
              ),
              Marker(
                markerId: const MarkerId('end'),
                position: _endPoint,
                infoWindow: const InfoWindow(
                  title: 'End Point',
                ),
              ),
            },
            polylines: {
              Polyline(
                polylineId: const PolylineId('route'),
                visible: true,
                points: [_startPoint, _endPoint],
                color: Colors.blue,
                width: 5,
              ),
            },
          ),
          // Widget para la caja azul
          DraggableScrollableSheet(
            initialChildSize: 0.2, // Altura inicial del modal (20%)
            minChildSize: 0.1, // Altura mínima del modal (10%)
            maxChildSize: 0.8, // Altura máxima del modal (80%)
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 28, 28, 28),
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
                        onPressed: () {
                          // Lógica para buscar rutas cercanas al punto
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                        ),
                        child: const Text(
                          'Buscar rutas cercanas al punto xd',
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _getCurrentLocation,
        backgroundColor: Colors.blue,
        child: const Icon(Icons.my_location),
      ),
    );
  }
}
