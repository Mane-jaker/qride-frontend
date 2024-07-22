import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:qride_app/display/screens/map/map_ride.dart';
import 'package:qride_app/display/widgets/global/app_scaffold.dart';
import 'package:qride_app/display/widgets/global/rute_card.dart';
import 'package:qride_app/display/widgets/global/search_place.dart';

class ListBus extends StatelessWidget {
  const ListBus({super.key});

  @override
  Widget build(BuildContext context) {
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

    return AppScaffold(
      currentIndex: 2,
      showEndDrawer: true,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
            child: Column(
          children: [
            const SearchPlace(),
            const SizedBox(
              height: 15,
            ),
            const Row(
              children: [
                Expanded(
                  child: Text(
                    'Rutas que pasan por esta estacion',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            RuteCard(
              title: 'Ruta A-01',
              subtitle: 'Llega en 10 min',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MapRide(
                            lineRoute: _route1Points,
                            route: "Ruta A-01",
                            time: "Llega en 10 min",
                          )),
                );
              },
            ),
            RuteCard(
              title: 'Ruta 73',
              subtitle: 'Llega en 20 min',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MapRide(
                            lineRoute: _route2Points,
                            route: "Ruta 73",
                            time: "Llega en 20 min",
                          )),
                );
              },
            ),
            RuteCard(
              title: 'Ruta 20',
              subtitle: 'Llega en 30 min',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MapRide(
                            lineRoute: _route2Points,
                            route: "Ruta 20",
                            time: "Llega en 30 min",
                          )),
                );
              },
            ),
          ],
        )),
      ),
    );
  }
}
