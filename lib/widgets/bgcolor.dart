import 'package:flutter/material.dart';

class BackgroundColor extends StatelessWidget {
  const BackgroundColor({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF808080), // Gray at top
            Color(0xFF000000), // Black at bottom
          ],
        ),
      ),
    );
  }
}
