import 'package:flutter/material.dart';
import 'package:qride_app/display/screens/home/place_view.dart';
import 'package:qride_app/display/widgets/global/rute_card.dart';
import 'package:qride_app/display/widgets/global/search_place.dart';
import 'package:qride_app/display/widgets/home/place_card.dart';

class Home extends StatelessWidget {
  final Function(Widget) onPlaceSelected;
  const Home({super.key, required this.onPlaceSelected});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const SearchPlace(),
            const SizedBox(
              height: 15,
            ),
            const Row(
              children: [
                Text(
                  'Rutas cerca de tu ubicación',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            const RuteCard(
                title: 'Ruta 58', subtitle: 'Informacion de la ruta'),
            const RuteCard(
                title: 'Ruta 58', subtitle: 'Informacion de la ruta'),
            const RuteCard(
                title: 'Ruta 58', subtitle: 'Informacion de la ruta'),
            const SizedBox(
              height: 15,
            ),
            const Row(
              children: [
                Text(
                  'Lugares cerca de tu ubicación',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.left,
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  PlaceCard(
                    text: 'Hola',
                    changeBody: () {
                      onPlaceSelected(const PlaceView());
                    },
                  ),
                  PlaceCard(
                    text: 'Hola',
                    changeBody: () {
                      onPlaceSelected(const PlaceView());
                    },
                  ),
                  PlaceCard(
                    text: 'Hola',
                    changeBody: () {
                      onPlaceSelected(const PlaceView());
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
