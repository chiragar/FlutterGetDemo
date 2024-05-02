import 'package:flutter/material.dart';

class GradientDivider extends StatelessWidget {
  const GradientDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 4, // Adjust the thickness of the divider
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue, Colors.green], // Change colors as needed
        ),
      ),
    );
  }
}