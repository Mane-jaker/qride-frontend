import 'package:flutter/material.dart';

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  final PageController _pageController = PageController(initialPage: 0);
  final List<Widget> _slides = [
    const OnboardingSlide(
      title: 'Tu Guía de Rutas Urbanas',
      description:
          ' Simplemente ingresa tu ubicación y destino, y deja que QRide te muestre las mejores opciones de transporte público.',
      imagePath: 'assets/img/route_1.png',
    ),
    const OnboardingSlide(
      title: 'Descubre Lugares Cercanos',
      description:
          'QRide no solo te lleva a donde quieres ir, sino que también te muestra lo que hay a tu alrededor. Explora restaurantes, tiendas, parques y más, todo cerca de ti.',
      imagePath: 'assets/img/destiny_1.png',
    ),
    const OnboardingSlide(
      title: 'Conoce las Rutas de Transporte',
      description:
          'Explora el mapa interactivo para conocer todas las rutas de transporte público disponibles, horarios en tiempo real y actualizaciones de tráfico.',
      imagePath: 'assets/img/map_1.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              children: _slides,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 48.0),
            child: Container(
            alignment: Alignment.topCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    if (_pageController.page!.toInt() > 0) {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    }
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios),
                  onPressed: () {
                    if (_pageController.page!.toInt() < _slides.length - 1) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease,
                      );
                    } else {
                      // Navigator.push
                    }
                  },
                ),
              ],
            ),
          ),
      )],
      ),
    );
  }
}

class OnboardingSlide extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;

  const OnboardingSlide({
    Key? key,
    required this.title,
    required this.description,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:24.0, right: 24.0, top: 56.0, bottom: 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 30),
          ),
          SizedBox(
            width: double.infinity,
            height: 300,
            child: Image.asset(
              imagePath,
              fit: BoxFit.fill,
            ),
          ),
          Text(
            description,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
