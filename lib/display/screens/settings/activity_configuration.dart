import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qride_app/core/repositories/trip_providers.dart';
import 'package:qride_app/display/widgets/global/activity_card.dart';

class ActivityConfiguration extends StatefulWidget {
  const ActivityConfiguration({super.key});

  @override
  State<ActivityConfiguration> createState() => _ActivityConfiguration();
}

class _ActivityConfiguration extends State<ActivityConfiguration> {
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
          ActivityCard(
            title: Consumer(
              builder: (context, ref, child) {
                final historyAsyncValue = ref.watch(historyProvider);
                return historyAsyncValue.when(
                  data: (historyResponse) {
                    return Text(
                      historyResponse.origin.latitude,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white60,
                      ),
                    );
                  },
                  loading: () => const CircularProgressIndicator(),
                  error: (error, stackTrace) =>
                      const Text("Error al obtener el origen"),
                );
              },
            ),
            subtitle: Consumer(
              builder: (context, ref, child) {
                final historyAsyncValue = ref.watch(historyProvider);
                return historyAsyncValue.when(
                  data: (historyResponse) {
                    return Text(
                      historyResponse.destiny.latitude,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.white60,
                      ),
                    );
                  },
                  loading: () => const CircularProgressIndicator(),
                  error: (error, stackTrace) =>
                      const Text("Error al obtener el destino"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
