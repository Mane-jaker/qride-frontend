import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapRide extends StatefulWidget {
  const MapRide({super.key});

  @override
  State<MapRide> createState() => _MapRideState();
}

class _MapRideState extends State<MapRide> {
  late GoogleMapController mapController;

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'data',
      ),
    );
  }
}
