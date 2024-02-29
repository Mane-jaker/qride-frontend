import 'package:flutter/material.dart';
import 'package:qride_app/display/widgets/global/app_scaffold.dart';
import 'package:qride_app/display/widgets/global/bottom_navbar.dart';

class SocialButton extends StatelessWidget {
  final String title;
  final Color color;
  final Icon icon;

  const SocialButton({
    Key? key,
    required this.title,
    required this.color,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 14),
      child: Card(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        color: color,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 40),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AppScaffold()),
                  );
                },
                icon: icon,
                iconSize: 24,
              ),
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
    );
  }
}
