import 'package:flutter/material.dart';

class StarRating extends StatelessWidget {
  final int rating;
  final String labelText;
  final Color starColor;
  final double starSize;

  const StarRating({
    Key? key,
    required this.rating,
    required this.labelText,
    this.starColor = Colors.grey,
    this.starSize = 20.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Iconos de estrella vacíos
        for (int i = 0; i < 5; i++)
          Icon(
            Icons.star_border,
            size: starSize,
            color: starColor,
          ),
        // Espacio entre las estrellas y el texto
        const SizedBox(width: 8),
        // Texto que muestra la calificación
        Text(
          '$rating',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        // Espacio adicional entre el texto y las estrellas
        const SizedBox(width: 4),
        // Texto que describe la calificación
        Text(
          labelText,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
