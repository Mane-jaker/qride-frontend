import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qride_app/core/models/sing_up_request.dart';
import 'package:qride_app/core/repositories/user_providers.dart';
import 'package:qride_app/core/services/user_service.dart';
import 'package:qride_app/core/utils/uuid_manager.dart';
import 'package:qride_app/display/widgets/global/app_scaffold.dart';

class UpdateData extends StatefulWidget {
  const UpdateData({
    super.key,
    required this.data,
  });

  final String data;

  static Route<void> route(String data) {
    return MaterialPageRoute<void>(
      builder: (_) => UpdateData(data: data),
    );
  }

  @override
  State<UpdateData> createState() => _UpdateDataState();
}

class _UpdateDataState extends State<UpdateData> {
  final _controller = TextEditingController();
  final SignUpRequest _signUpRequest = SignUpRequest();
  final UserService _userService = UserService();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _updateName() {
    _signUpRequest.name = _controller.text;
    _signUpRequest.email = "${_controller.text}@gmail.com";
    _signUpRequest.lastname = "shonsadasd";
    _signUpRequest.phoneNumber = "9234567891";
    _signUpRequest.password = "12345678";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Actualizar ${widget.data}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextField(
              controller: _controller,
              decoration: const InputDecoration(
                labelText: 'Ingresa los datos nuevos',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Consumer(
                  builder: (context, ref, child) {
                    final userAsyncValue = ref.watch(userProvider);
                    return userAsyncValue.when(
                      data: (userResponse) {
                        return Column(
                          children: [
                            const Text('Datos actuales:'),
                            Text(
                              '${widget.data}: ${userResponse.name}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            )
                          ],
                        );
                      },
                      loading: () => const CircularProgressIndicator(),
                      error: (error, stackTrace) =>
                          const Text("Error al obtener el usuario"),
                    );
                  },
                ),
                Column(
                  children: [
                    const Text('Datos nuevos:'),
                    ValueListenableBuilder(
                      valueListenable: _controller,
                      builder: (context, value, child) {
                        return Text(
                          '${widget.data}: ${_controller.text}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            ElevatedButton(
              onPressed: () async {
                _updateName();
                try {
                  final response = await _userService.updateUserByUUID(
                      UUIDManager.getUuid(), _signUpRequest);
                  if (response.success) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AppScaffold(),
                      ),
                    );
                  } else {
                    print(
                        'Error al actualizar el usuario: ${response.message}');
                  }
                } catch (e) {
                  print('Error al actualizar el usuario: $e');
                }
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50)),
              child: const Text('Confirmar'),
            ),
          ],
        ),
      ),
    );
  }
}
