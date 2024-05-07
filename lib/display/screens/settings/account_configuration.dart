import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qride_app/core/models/update_name_request.dart';
import 'package:qride_app/core/repositories/user_providers.dart';
import 'package:qride_app/core/services/user_service.dart';

class AccountConfiguration extends StatefulWidget {
  const AccountConfiguration({Key? key}) : super(key: key);

  @override
  State<AccountConfiguration> createState() => _AccountConfigurationState();
}

class _AccountConfigurationState extends State<AccountConfiguration> {
  final UpdateNameRequest _updateNameRequest = UpdateNameRequest();
  final UserService _userService = UserService();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: double.infinity,
      child: ListView(
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
            subtitle: Consumer(
              builder: (context, ref, child) {
                final userAsyncValue = ref.watch(userProvider);
                return userAsyncValue.when(
                  data: (userResponse) {
                    return GestureDetector(
                      onTap: () => _showNameEditDialog(userResponse.name),
                      child: Text(
                        userResponse.name,
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),
                    );
                  },
                  loading: () => const CircularProgressIndicator(),
                  error: (error, stackTrace) =>
                      const Text("Error al obtener el usuario"),
                );
              },
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          // Otros elementos de la lista...
        ],
      ),
    );
  }

  void _showNameEditDialog(String currentName) {
    TextEditingController _nameController =
        TextEditingController(text: currentName);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Cambiar Nombre'),
          content: TextFormField(
            controller: _nameController,
            decoration: const InputDecoration(
              labelText: 'Nuevo Nombre',
            ),
            onChanged: (newValue) {
              setState(() {
                _updateNameRequest.name = newValue;
              });
            },
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () async {
                await _updateName();
                Navigator.of(context).pop();
              },
              child: const Text('Confirmar'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _updateName() async {
    try {
      await _userService.updateUser(
          "c8d0f520-79a3-4e62-b805-af1520240165", _updateNameRequest);
    } catch (e) {
      print('Error al actualizar el nombre: $e');
    }
  }
}
