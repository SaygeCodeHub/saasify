import 'package:flutter/material.dart';

class NumPad extends StatelessWidget {
  final void Function(String) onKeyPressed;
  final String value;

  const NumPad({super.key, required this.onKeyPressed, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('1'),
              _buildButton('2'),
              _buildButton('3'),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('4'),
              _buildButton('5'),
              _buildButton('6'),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildButton('7'),
              _buildButton('8'),
              _buildButton('9'),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildBackButton(),
              _buildButton('0'),
              _buildButton('.'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildButton(String text) {
    return ElevatedButton(
      onPressed: () {
        onKeyPressed(value + text);
      },
      child: Text(text),
    );
  }

  Widget _buildBackButton() {
    return ElevatedButton(
      onPressed: () {
        onKeyPressed(value.substring(0, value.length - 1));
      },
      child: const Icon(Icons.backspace),
    );
  }
}
