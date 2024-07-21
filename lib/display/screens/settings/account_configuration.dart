import 'package:flutter/material.dart';
import 'package:qride_app/core/services/user_service.dart';
import 'package:qride_app/core/utils/uuid_manager.dart';
import 'package:qride_app/display/screens/settings/update_data.dart';
import 'package:qride_app/display/screens/welcome/welcome.dart';

class AccountConfiguration extends StatefulWidget {
  const AccountConfiguration({super.key});

  @override
  State<AccountConfiguration> createState() => _AccountConfiguration();
}

class _AccountConfiguration extends State<AccountConfiguration> {
  final UserService _userService = UserService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuración de la cuenta'),
      ),
      body: ListView(
        padding:
            const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 20),
        children: <Widget>[
          const SizedBox(
            height: 160,
            child: DrawerHeader(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Text(
                      'Configuración de la cuenta',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                      softWrap: true,
                    ),
                  ),
                  Icon(
                    Icons.settings_rounded,
                    size: 30,
                  )
                ],
              ),
            ),
          ),
          ListTile(
            title: const Text(
              'Nombre',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            subtitle: const Text(
              'Juan Pérez',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            trailing: IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                Navigator.push(
                  context,
                  UpdateData.route('Nombre'),
                );
              },
            ),
          ),
          const Divider(),
          ListTile(
            title: const Text(
              'Teléfono celular',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            subtitle: const Text(
              '+123 456 7890',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(),
          ListTile(
            title: const Text(
              'Email',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            subtitle: const Text(
              'juan.perez@example.com',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(),
          ListTile(
            title: const Text(
              'Apellido',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            subtitle: const Text(
              'Toledo',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(),
          ListTile(
            title: const Text(
              'Contraseña',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            subtitle: const Text(
              '********',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          const Divider(),
          ListTile(
            title: const Text(
              'Borrar cuenta',
              style: TextStyle(
                fontSize: 18,
                color: Colors.redAccent,
              ),
            ),
            trailing: const Icon(
              Icons.delete_forever_rounded,
              color: Colors.redAccent,
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Confirmar'),
                    content: const Text(
                        '¿Estás seguro de que quieres borrar tu cuenta?'),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Cancelar'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: const Text('Confirmar'),
                        onPressed: () async {
                          try {
                            final response = await _userService
                                .deleteUserByUUID(UUIDManager.getUuid());
                            if (response.success) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const Welcome(),
                                ),
                              );
                            } else {
                              print(
                                  'Error al borrar el usuario: ${response.message}');
                            }
                          } catch (e) {
                            print('Error al borrar el usuario: $e');
                          }
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
          const Divider()
        ],
      ),
    );
  }
}
