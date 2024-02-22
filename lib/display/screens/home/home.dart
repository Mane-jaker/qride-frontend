import 'package:flutter/material.dart';
import 'package:qride_app/display/widgets/global/rute_card.dart';
import 'package:qride_app/display/widgets/global/search_place.dart';
import 'package:qride_app/display/widgets/home/place_card.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Column(
        children: [
          SearchPlace(),
          SizedBox(
            height: 15,
          ),
          Row(
            children: [
              Text(
                'Rutas cerca de tu ubicación',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          RuteCard(title: 'Ruta 58', subtitle: 'Informacion de la ruta'),
          RuteCard(title: 'Ruta 58', subtitle: 'Informacion de la ruta'),
          RuteCard(title: 'Ruta 58', subtitle: 'Informacion de la ruta'),
          SizedBox(
            height: 15,
          ),
          Row(
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
          SizedBox(
            height: 15,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                PlaceCard(text: 'Hola'),
                PlaceCard(text: 'Hola'),
                PlaceCard(text: 'Hola'),
              ],
            ),
          )
        ],
      ),
    );
  }
}
