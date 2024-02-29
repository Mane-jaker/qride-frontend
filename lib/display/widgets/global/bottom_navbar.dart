import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:qride_app/display/screens/home/home.dart';
import 'package:qride_app/display/screens/map/map_ride.dart';
import 'package:qride_app/display/screens/qr_scan/qr_scan.dart';
import 'package:qride_app/display/widgets/global/drawer.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int pagenumber = 0;

  List pages = <Widget>[
    const Home(),
    const QrScan(),
    const MapRide(),
  ];

  void onItemTapped(int index) {
    setState(() {
      pagenumber = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<String> pageTitles = [
      'Home',
      'Qr',
      'Map',
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          pageTitles[pagenumber],
          style: const TextStyle(color: Colors.white),
        ),
      ),
      endDrawer: const AppDrawer(),
      body: pages[pagenumber],
      bottomNavigationBar: Stack(
        children: [
          Positioned(
            // Posiciona el círculo de resaltado en la posición del ítem seleccionado
            bottom: 36,
            left: MediaQuery.of(context).size.width *
                pagenumber /
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
            currentIndex: pagenumber,
            onTap: onItemTapped,
            backgroundColor: Colors.transparent,
            elevation: 0,
            showSelectedLabels: false,
            showUnselectedLabels: false,
          ),
        ],
      ),
    );
  }
}
