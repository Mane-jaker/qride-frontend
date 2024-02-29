import 'package:flutter/material.dart';
import 'package:qride_app/display/screens/home/home.dart';
import 'package:qride_app/display/screens/map/map_ride.dart';
import 'package:qride_app/display/screens/qr_scan/qr_scan.dart';
import 'package:qride_app/display/widgets/global/app_drawer.dart';
import 'package:qride_app/display/widgets/global/bottom_navbar.dart';

class AppScaffold extends StatefulWidget {
  const AppScaffold({Key? key}) : super(key: key);

  @override
  State<AppScaffold> createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  int _currentPageIndex = 0;

  late Widget _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPage = _buildPage(_currentPageIndex);
  }

  void _updatePageIndex(int index) {
    setState(() {
      _currentPageIndex = index;
      _currentPage = _buildPage(_currentPageIndex);
    });
  }

  Widget _buildPage(int index) {
    switch (index) {
      case 0:
        return Home(onPlaceSelected: _changeBodyToPage);
      case 1:
        return const QrScan();
      case 2:
        return const MapRide();
      default:
        return const SizedBox();
    }
  }

  void _changeBodyToPage(Widget page) {
    setState(() {
      _currentPage = page;
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
          pageTitles[_currentPageIndex],
          style: const TextStyle(color: Colors.white),
        ),
      ),
      endDrawer: const AppDrawer(),
      body: _currentPage,
      bottomNavigationBar: BottomNavbar(
        currentIndex: _currentPageIndex,
        onTap: _updatePageIndex,
      ),
    );
  }
}
