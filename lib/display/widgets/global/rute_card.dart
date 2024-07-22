import 'package:flutter/material.dart';

class RuteCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback? onTap; // Callback para manejar el toque en la tarjeta

  const RuteCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.onTap, // Asegúrate de que onTap esté presente en el constructor
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: InkWell(
        onTap: onTap, // Agrega el onTap aquí
        borderRadius: BorderRadius.circular(
            10), // Añade el mismo borde redondeado para el efecto ripple
        child: Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          color: const Color.fromRGBO(31, 125, 221, 100),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Text(
                        subtitle,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white60,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward_ios_rounded),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
