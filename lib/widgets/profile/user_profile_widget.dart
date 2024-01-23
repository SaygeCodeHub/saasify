import 'package:flutter/material.dart';

import '../../configs/app_spacing.dart';

class UserProfileWidget extends StatelessWidget {
  final double? size;

  const UserProfileWidget({super.key, this.size = spacingXXHuge});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipOval(
        child: Image.asset(
          'user.png',
          width: size, // Set the desired width
          height: size, // Set the desired height
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
