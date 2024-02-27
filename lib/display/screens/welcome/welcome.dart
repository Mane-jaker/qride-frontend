import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Row(
        children: [
          Column(
            children: [
              Text('hola'),
              SizedBox(),
              Text('data'),
            ],
          ),
        ],
      ),
    );
  }
}
