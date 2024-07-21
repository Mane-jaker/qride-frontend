import 'package:flutter/material.dart';
import 'package:qride_app/display/screens/home/home.dart';
import 'package:qride_app/display/screens/map/map_ride.dart';
import 'package:qride_app/display/screens/qr_scan/qr_scan.dart';
import 'package:qride_app/display/widgets/global/app_drawer.dart';
import 'package:qride_app/display/widgets/global/bottom_navbar.dart';

class AppScaffold extends StatelessWidget {
  final Widget? floatingButton;
  final int currentIndex;
  final Widget body;
  final bool showEndDrawer;

  AppScaffold({
    super.key,
    required this.currentIndex,
    required this.body,
    required this.showEndDrawer,
    this.floatingButton,
  });

  void _onItemTapped(BuildContext context, int index) {
    if (index != currentIndex) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => _getPage(index),
        ),
      );
    }
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return const Home();
      case 1:
        return const QrScan();
      case 2:
        return const MapRide();
      default:
        return const Home(); // Por defecto, regresar a la página principal
    }
  }

  List<String> pageTitles = [
    'Qride',
    'Qr',
    'Map',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: !showEndDrawer,
      appBar: AppBar(
        automaticallyImplyLeading: currentIndex != 0,
        title: showEndDrawer
            ? Text(
                pageTitles[currentIndex],
                style: const TextStyle(color: Colors.white),
              )
            : null,
        backgroundColor: Colors.transparent,
      ),
      endDrawer: showEndDrawer ? const AppDrawer() : null,
      body: body,
      floatingActionButton: floatingButton,
      bottomNavigationBar: BottomNavbar(
        currentIndex: currentIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
