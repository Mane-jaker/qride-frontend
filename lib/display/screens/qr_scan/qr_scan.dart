import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qride_app/display/widgets/global/app_scaffold.dart';
import '../map/map_ride.dart';

class QrScan extends StatefulWidget {
  const QrScan({super.key});

  @override
  State<QrScan> createState() => _QrScanState();
}

class _QrScanState extends State<QrScan> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? _controller;
  bool _isFlashOn = false; // Estado del flash

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      _controller = controller;
    });

    controller.scannedDataStream.listen((scanData) {
      if (scanData.code != null) {
        // Detener el escaneo
        _controller?.pauseCamera();

        // Redirigir a la vista MapRide
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MapRide(
              lineRoute: _getRoutePoints(),
              route: "Ruta A-01",
              time: "Llega en 10 min",
            ),
          ),
        );
      }
    });
  }

  List<RoutePoint> _getRoutePoints() {
    return [
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
  }

  Future<void> _toggleFlash() async {
    if (_isFlashOn) {
      await _controller?.toggleFlash();
    } else {
      await _controller?.toggleFlash();
    }
    setState(() {
      _isFlashOn = !_isFlashOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      currentIndex: 1,
      showEndDrawer: true,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            const Text(
              'Escanea el código QR de tu parada para visualizar las rutas',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Expanded(
              child: QRView(
                key: qrKey,
                onQRViewCreated: _onQRViewCreated,
              ),
            ),
            FlashlightButton(
              isFlashOn: _isFlashOn,
              onPressed: _toggleFlash,
            ),
          ],
        ),
      ),
    );
  }
}

class FlashlightButton extends StatelessWidget {
  final bool isFlashOn;
  final VoidCallback onPressed;

  const FlashlightButton({
    Key? key,
    required this.isFlashOn,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: Colors.blue,
      child: Icon(
        Icons.highlight_rounded,
        color: isFlashOn ? Colors.white : Colors.black87,
      ),
    );
  }
}
