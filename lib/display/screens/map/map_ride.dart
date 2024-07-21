import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:qride_app/display/screens/map/list_bus.dart';
import 'package:qride_app/display/widgets/global/app_scaffold.dart';

class RoutePoint {
  final LatLng position;
  final String title;

  RoutePoint(this.position, this.title);
}

class MapRide extends StatefulWidget {
  const MapRide({super.key});

  @override
  State<MapRide> createState() => _MapRideState();
}

class _MapRideState extends State<MapRide> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(16.747778, -93.117444); // Punto inicial
  LocationData? currentLocation;

  final List<RoutePoint> _route1Points = [
    RoutePoint(const LatLng(16.757241, -93.162630), 'Start Point'),
    RoutePoint(const LatLng(16.755858, -93.156377), 'Point'),
    RoutePoint(const LatLng(16.755017, -93.142335), 'Point'),
    RoutePoint(const LatLng(16.754116, -93.132078), 'Point'),
    RoutePoint(const LatLng(16.754686, -93.129108), 'Point'),
    RoutePoint(const LatLng(16.754899, -93.127775), 'Point'),
    RoutePoint(const LatLng(16.754853, -93.127386), 'Point'),
    RoutePoint(const LatLng(16.754970, -93.125638), 'Point'),
    RoutePoint(const LatLng(16.754962, -93.124634), 'Point'),
    RoutePoint(const LatLng(16.753612, -93.116411), 'Point'),
    RoutePoint(const LatLng(16.752230, -93.107410), 'Point'),
    RoutePoint(const LatLng(16.752129, -93.106921), 'Point'),
    RoutePoint(const LatLng(16.751330, -93.101850), 'Point'),
    RoutePoint(const LatLng(16.747510, -93.084268), 'Point'),
    RoutePoint(const LatLng(16.747303, -93.083437), 'Point'),
    RoutePoint(const LatLng(16.747209, -93.083270), 'Point'),
    RoutePoint(const LatLng(16.747258, -93.083069), 'Point'),
    RoutePoint(const LatLng(16.747116, -93.082102), 'Point'),
    RoutePoint(const LatLng(16.746381, -93.077999), 'Point'),
    RoutePoint(const LatLng(16.745867, -93.076640), 'Point'),
    RoutePoint(const LatLng(16.744931, -93.075140), 'End Point'),
  ];

  final List<RoutePoint> _route2Points = [
    RoutePoint(const LatLng(16.749545, -93.134835), 'Route 2 Start'),
    RoutePoint(const LatLng(16.749987, -93.128188), 'Route 2 '),
    RoutePoint(const LatLng(16.748261, -93.125356), 'Route 2 '),
    RoutePoint(const LatLng(16.748888, -93.126997), 'Route 2 '),
    RoutePoint(const LatLng(16.749021, -93.125726), 'Route 2 '),
    RoutePoint(const LatLng(16.747388, -93.125219), 'Route 2 '),
    //RoutePoint(const LatLng(latitude, longitude), 'Route 2 6th Point'),
    RoutePoint(const LatLng(16.743836, -93.105920), 'Route 2 End Point'),
  ];

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
    return AppScaffold(
      currentIndex: 2,
      showEndDrawer: true,
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
                markerId: MarkerId(_route1Points.first.title),
                position: _route1Points.first.position,
                infoWindow: InfoWindow(title: _route1Points.first.title),
              ),
              Marker(
                markerId: MarkerId(_route1Points.last.title),
                position: _route1Points.last.position,
                infoWindow: InfoWindow(title: _route1Points.last.title),
              ),
              Marker(
                markerId: MarkerId(_route2Points.first.title),
                position: _route2Points.first.position,
                infoWindow: InfoWindow(title: _route2Points.first.title),
              ),
              Marker(
                markerId: MarkerId(_route2Points.last.title),
                position: _route2Points.last.position,
                infoWindow: InfoWindow(title: _route2Points.last.title),
              ),
            },
            polylines: {
              Polyline(
                polylineId: const PolylineId('route1'),
                visible: true,
                points: _route1Points.map((point) => point.position).toList(),
                color: Colors.blue,
                width: 5,
              ),
              Polyline(
                polylineId: const PolylineId('route2'),
                visible: true,
                points: _route2Points.map((point) => point.position).toList(),
                color: Colors.red,
                width: 5,
              ),
            },
          ),
          // Widget para la caja de datos
          DraggableScrollableSheet(
            initialChildSize: 0.2, // Altura inicial del modal (20%)
            minChildSize: 0.1, // Altura mínima del modal (10%)
            maxChildSize: 0.4, // Altura máxima del modal (80%)
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const ListBus()),
                          );
                        },
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
      ),
      floatingButton: FloatingActionButton(
        onPressed: _getCurrentLocation,
        backgroundColor: const Color.fromRGBO(136, 255, 255, 100),
        child: const Icon(Icons.my_location),
      ),
    );
  }
}
