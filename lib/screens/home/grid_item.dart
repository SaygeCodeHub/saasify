import 'package:flutter/material.dart';

import '../../configs/app_colors.dart';

class GridItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Widget screen;
  final Color color;

  const GridItem({
    super.key,
    required this.icon,
    required this.label,
    required this.screen,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => screen),
        );
      },
      child: Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          decoration: BoxDecoration(
            color: color, // Background color of the grid tile
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Stack(
            alignment: Alignment.topLeft,
            children: [
              Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: color.withOpacity(
                      0.5), // Slightly transparent background for the icon
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Icon(
                  icon,
                  size: 30,
                  color: Colors.black, // Icon color
                ),
              ),
              Positioned(
                top: 50,
                left: 8.0,
                child: Text(
                  label,
                  style: const TextStyle(
                      color: AppColors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
