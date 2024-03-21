import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qride_app/core/repositories/user_providers.dart';

class AccountConfiguration extends StatefulWidget {
  const AccountConfiguration({super.key});

  @override
  State<AccountConfiguration> createState() => _AccountConfiguration();
}

class _AccountConfiguration extends State<AccountConfiguration> {
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
                    // Aquí puedes usar userResponse para mostrar los datos del usuario
                    return Text(
                      userResponse.name,
                      style: const TextStyle(
                        fontSize: 16,
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
          const Divider(),
          ListTile(
            title: const Text(
              'Telefono celular',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            subtitle: Consumer(
              builder: (context, ref, child) {
                final userAsyncValue = ref.watch(userProvider);
                return userAsyncValue.when(
                  data: (userResponse) {
                    // Aquí puedes usar userResponse para mostrar los datos del usuario
                    return Text(
                      userResponse.phoneNumber,
                      style: const TextStyle(
                        fontSize: 16,
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
          const Divider(),
          ListTile(
            title: const Text(
              'Email',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
            subtitle: Consumer(
              builder: (context, ref, child) {
                final userAsyncValue = ref.watch(userProvider);
                return userAsyncValue.when(
                  data: (userResponse) {
                    // Aquí puedes usar userResponse para mostrar los datos del usuario
                    return Text(
                      userResponse.email,
                      style: const TextStyle(
                        fontSize: 16,
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
        ],
      ),
    );
  }
}
