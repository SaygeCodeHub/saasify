import 'package:flutter/material.dart';

class CircularAvatarWidget extends StatelessWidget {
  final String labelText;
  final IconData iconData;

  const CircularAvatarWidget({
    super.key,
    required this.labelText,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.blue[400],
          child: Icon(
            iconData,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          labelText,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
    );
  }
}
