import 'package:flutter/material.dart';

class SearchPlace extends StatefulWidget {
  const SearchPlace({super.key});

  @override
  State<SearchPlace> createState() => _SearchPlaceState();
}

class _SearchPlaceState extends State<SearchPlace> {
  bool _isFocused = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(47, 47, 47, 100),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Ingresa una ruta o ubicación',
          hintStyle: const TextStyle(color: Colors.grey),
          border: InputBorder.none,
          prefixIcon:
              _isFocused ? null : const Icon(Icons.search, color: Colors.grey),
        ),
        onTap: () {
          setState(() {
            _isFocused = true;
          });
        },
        onSubmitted: (value) {
          setState(() {
            _isFocused = false;
          });
        },
      ),
    );
  }
}
