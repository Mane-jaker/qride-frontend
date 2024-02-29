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
  late Scaffold _scaffold;

  @override
  void initState() {
    super.initState();
    _scaffold = _buildScaffold(true);
  }

  void _updatePageIndex(int index) {
    setState(() {
      _currentPageIndex = index;
      _scaffold = _buildScaffold(true);
    });
  }

  void _changeBodyToPage(Widget page) {
    setState(() {
      _scaffold = _buildScaffold(false, body: page);
    });
  }

  Scaffold _buildScaffold(bool showEndDrawer, {Widget? body}) {
    List<String> pageTitles = [
      'Home',
      'Qr',
      'Map',
    ];

    return Scaffold(
      extendBodyBehindAppBar: !showEndDrawer,
      appBar: AppBar(
        centerTitle: true,
        title: showEndDrawer
            ? Text(
                pageTitles[_currentPageIndex],
                style: const TextStyle(color: Colors.white),
              )
            : null,
        backgroundColor: Colors.transparent,
      ),
      endDrawer: showEndDrawer ? const AppDrawer() : null,
      body: body ?? _buildPage(_currentPageIndex),
      bottomNavigationBar: BottomNavbar(
        currentIndex: _currentPageIndex,
        onTap: _updatePageIndex,
      ),
    );
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

  @override
  Widget build(BuildContext context) {
    return _scaffold;
  }
}
