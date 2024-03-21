import 'package:flutter/material.dart';

class ActivityCard extends StatelessWidget {
  final Widget? title;
  final Widget? subtitle;

  const ActivityCard({
    Key? key,
    required this.title,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
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
                    if (subtitle != null) ...[
                      subtitle!,
                        const SizedBox(
                          height: 8,
                        ),
                    ],
                    if (subtitle != null) ...[
                      subtitle!,
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  ],
                ),
              ),
              Column(
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_forward_ios_rounded))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
