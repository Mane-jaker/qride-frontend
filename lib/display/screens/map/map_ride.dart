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
  final List<RoutePoint>? lineRoute;
  final String? route;
  final String? time;

  const MapRide({
    super.key,
    this.lineRoute,
    this.route,
    this.time,
  });

  @override
  State<MapRide> createState() => _MapRideState();
}

class _MapRideState extends State<MapRide> {
  late GoogleMapController mapController;
  final LatLng _center = const LatLng(16.747778, -93.117444); // Punto inicial
  LocationData? currentLocation;
  bool isForwardRoute = true;

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
    final routePoints = widget.lineRoute ?? [];

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
              if (routePoints.isNotEmpty) ...[
                Marker(
                  markerId: MarkerId(routePoints.first.title),
                  position: routePoints.first.position,
                  infoWindow: InfoWindow(title: routePoints.first.title),
                ),
                Marker(
                  markerId: MarkerId(routePoints.last.title),
                  position: routePoints.last.position,
                  infoWindow: InfoWindow(title: routePoints.last.title),
                ),
              ]
            },
            polylines: {
              if (routePoints.isNotEmpty)
                Polyline(
                  polylineId: const PolylineId('route'),
                  visible: true,
                  points: routePoints.map((point) => point.position).toList(),
                  color: isForwardRoute
                      ? Colors.blue
                      : const Color.fromRGBO(136, 255, 255, 100),
                  width: 5,
                ),
            },
          ),
          // Widget para la caja de datos
          DraggableScrollableSheet(
            initialChildSize: 0.2, // Altura inicial del modal (20%)
            minChildSize: 0.1, // Altura mínima del modal (10%)
            maxChildSize: 0.4, // Altura máxima del modal (40%)
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
                    if (widget.route != null && widget.time != null) ...[
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.route!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              widget.time!,
                              style: const TextStyle(
                                color: Colors.white60,
                                fontSize: 14,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () {
                                    setState(() {
                                      isForwardRoute = true;
                                    });
                                  },
                                  icon: const Icon(Icons.arrow_forward,
                                      color: Colors.white),
                                  label: const Text('Ruta de ida'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: isForwardRoute
                                        ? Colors.blue
                                        : Colors.grey,
                                  ),
                                ),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    setState(() {
                                      isForwardRoute = false;
                                    });
                                  },
                                  icon: const Icon(Icons.arrow_back,
                                      color: Colors.white),
                                  label: const Text('Ruta de regreso'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: isForwardRoute
                                        ? Colors.grey
                                        : const Color.fromRGBO(
                                            136, 255, 255, 100),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ] else ...[
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
                    ],
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
