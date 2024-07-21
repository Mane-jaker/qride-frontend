import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // Asegúrate de importar flutter_svg

class SocialButton extends StatelessWidget {
  final String title;
  final Color color;
  final Widget icon; // Cambiado de Icon a Widget
  final VoidCallback onPressed; // Agrega el parámetro onPressed

  const SocialButton({
    Key? key,
    required this.title,
    required this.color,
    required this.icon, // Cambiado de Icon a Widget
    required this.onPressed, // Agrega el parámetro onPressed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 14),
      child: GestureDetector(
        onTap: onPressed, // Usa el parámetro onPressed
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
          ),
          color: color,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                icon, // Usado directamente sin IconButton
                const SizedBox(width: 14),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
