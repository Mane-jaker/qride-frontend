import 'package:flutter/material.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({super.key});

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: double.infinity,
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: <Widget>[
          const SizedBox(
            height: 130,
            child: DrawerHeader(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Leonardo Toledo',
                    style: TextStyle(
                      fontSize: 25,
                    ),
                  ),
                  Icon(
                    Icons.person,
                    size: 30,
                  )
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.settings_rounded, size: 28),
            title: const Text(
              'Configuracion de la cuenta',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(),
          ListTile(
            title: const Text(
              'Idiomas',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            leading: const Icon(Icons.translate_rounded),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(),
          ListTile(
            title: const Text(
              'Actividad',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            leading: const Icon(Icons.history_rounded),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(),
          ListTile(
            title: const Text(
              'Acerca de Qride',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            leading: const Icon(Icons.privacy_tip_outlined),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(),
          ListTile(
            title: const Text(
              'Rutas en la App',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            leading: const Icon(Icons.directions_bus_filled_outlined),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(),
          ListTile(
            title: const Text(
              'Ayuda',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            leading: const Icon(Icons.help_outline_sharp),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(),
          ListTile(
            title: const Text('Cerrar sesión'),
            leading: const Icon(Icons.logout),
            iconColor: Colors.red,
            onTap: () {
              // Aquí puedes agregar la lógica para cerrar sesión
            },
          ),
        ],
      ),
    );
  }
}
