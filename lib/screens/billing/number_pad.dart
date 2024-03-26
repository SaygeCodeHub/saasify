import 'package:flutter/material.dart';

import '../../configs/app_colors.dart';
import '../../configs/app_spacing.dart';

class NumPad extends StatelessWidget {
  final void Function(String) onKeyPressed;
  final String value;
  final bool isMobile;

  const NumPad(
      {super.key,
      required this.onKeyPressed,
      required this.value,
      required this.isMobile});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: AppColors.grey,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildButton('1', context),
              const SizedBox(width: spacingXMedium),
              _buildButton('2', context),
              const SizedBox(width: spacingXMedium),
              _buildButton('3', context),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildButton('4', context),
              const SizedBox(width: spacingXMedium),
              _buildButton('5', context),
              const SizedBox(width: spacingXMedium),
              _buildButton('6', context),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildButton('7', context),
              const SizedBox(width: spacingXMedium),
              _buildButton('8', context),
              const SizedBox(width: spacingXMedium),
              _buildButton('9', context),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildBackButton(),
              const SizedBox(width: spacingXMedium),
              _buildButton('0', context),
              const SizedBox(width: spacingXMedium),
              _buildButton('.', context)
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text, BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.white,
          maximumSize: const Size(80, 100),
          minimumSize: Size((isMobile) ? 65 : 80, 60)),
      onPressed: () {
        onKeyPressed(value + text);
      },
      child: Text(
        text,
        style: const TextStyle(color: AppColors.black, fontSize: 16),
      ),
    );
  }

  Widget _buildBackButton() {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.white,
          maximumSize: const Size(80, 100),
          minimumSize: Size((isMobile) ? 65 : 80, 60)),
      onPressed: () {
        onKeyPressed(value.substring(0, value.length - 1));
      },
      child: const Text(
        '<',
        style: TextStyle(color: AppColors.black, fontSize: 16),
      ),
    );
  }
}
