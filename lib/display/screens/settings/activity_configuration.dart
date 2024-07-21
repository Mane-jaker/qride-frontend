import 'package:flutter/material.dart';
import 'package:qride_app/display/widgets/global/activity_card.dart';

class ActivityConfiguration extends StatefulWidget {
  const ActivityConfiguration({super.key});

  @override
  State<ActivityConfiguration> createState() => _ActivityConfiguration();
}

class _ActivityConfiguration extends State<ActivityConfiguration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Actividad de la cuenta'),
      ),
      body: ListView(
        padding:
            const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
        children: const <Widget>[
          SizedBox(
            height: 160,
            child: DrawerHeader(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      'Actividad de la cuenta',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                      softWrap: true,
                    ),
                  ),
                  Icon(
                    Icons.history,
                    size: 30,
                  )
                ],
              ),
            ),
          ),
          // Aquí puedes agregar una lista de actividades de ejemplo
          Column(
            children: [
              ActivityCard(
                title: Row(
                  children: [
                    Text(
                      'Origen: 123.456',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white60,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Destino: 456.789',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white60,
                      ),
                    ),
                  ],
                ),
                subtitle: Row(
                  children: [
                    Text(
                      'Fecha: 01/01/2024',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white60,
                      ),
                    ),
                  ],
                ),
              ),
              ActivityCard(
                title: Row(
                  children: [
                    Text(
                      'Origen: 987.654',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white60,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Destino: 321.987',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white60,
                      ),
                    ),
                  ],
                ),
                subtitle: Row(
                  children: [
                    Text(
                      'Fecha: 02/01/2024',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white60,
                      ),
                    ),
                  ],
                ),
              ),
              // Puedes duplicar el widget ActivityCard para agregar más actividades
            ],
          ),
        ],
      ),
    );
  }
}
