import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:camera/camera.dart';

class QrScan extends StatefulWidget {
  const QrScan({super.key});

  @override
  State<QrScan> createState() => _QrScanState();
}

class _QrScanState extends State<QrScan> {
  late CameraController _controller;
  bool _cameraInitialized = false;
  bool _isFlashOn = false; // Estado del flash

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    final cameraPermissionStatus = await Permission.camera.request();
    if (cameraPermissionStatus.isGranted) {
      final cameras = await availableCameras();
      _controller = CameraController(cameras[0], ResolutionPreset.medium);
      await _controller.initialize();
      if (mounted) {
        setState(() {
          _cameraInitialized = true;
        });
      }
    } else {
      // Si los permisos de la cámara no se conceden, puedes mostrar un mensaje o realizar alguna acción adicional
    }
  }

  Future<void> _toggleFlash() async {
    if (_isFlashOn) {
      await _controller.setFlashMode(FlashMode.off);
    } else {
      await _controller.setFlashMode(FlashMode.torch);
    }
    setState(() {
      _isFlashOn = !_isFlashOn;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!_cameraInitialized) {
      return const Center(child: CircularProgressIndicator());
    }
    return Padding(
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 400,
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                child: CameraPreview(_controller),
              ),
            ),
          ),
          FlashlightButton(
            isFlashOn: _isFlashOn,
            onPressed: _toggleFlash,
          ),
        ],
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
