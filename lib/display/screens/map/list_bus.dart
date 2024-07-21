import 'package:flutter/material.dart';
import 'package:qride_app/display/widgets/global/app_scaffold.dart';
import 'package:qride_app/display/widgets/global/rute_card.dart';
import 'package:qride_app/display/widgets/global/search_place.dart';

class ListBus extends StatelessWidget {
  const ListBus({super.key});

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
      currentIndex: 2,
      showEndDrawer: true,
      body: const Padding(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
            child: Column(
          children: [
            SearchPlace(),
            SizedBox(
              height: 15,
            ),
            Row(
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
            SizedBox(
              height: 15,
            ),
            RuteCard(title: 'Ruta 58', subtitle: 'mostrar mas informacion'),
            RuteCard(title: 'Ruta 58', subtitle: 'mostrar mas informacion'),
            RuteCard(title: 'Ruta 58', subtitle: 'mostrar mas informacion'),
            RuteCard(title: 'Ruta 58', subtitle: 'mostrar mas informacion'),
            RuteCard(title: 'Ruta 58', subtitle: 'mostrar mas informacion'),
            RuteCard(title: 'Ruta 58', subtitle: 'mostrar mas informacion'),
          ],
        )),
      ),
    );
  }
}
