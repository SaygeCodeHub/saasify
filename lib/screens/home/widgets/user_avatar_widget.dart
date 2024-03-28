import 'package:flutter/material.dart';

class UserAvatarWidget extends StatelessWidget {
  const UserAvatarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CircleAvatar(
          radius: 20,
          backgroundColor: Colors.white,
          child: Image.asset("assets/human.gif"),
        ),
        const Text(
          'Hi Ashish,',
          style: TextStyle(fontSize: 24, color: Colors.grey),
        ),
      ],
    );
  }
}
