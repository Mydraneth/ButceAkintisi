import 'package:flutter/material.dart';

class RadialBackground extends StatelessWidget {
  final Widget child;

  const RadialBackground({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Solid base
          Positioned.fill(
            child: Container(color: const Color.fromARGB(255, 20, 19, 38)),
          ),
          // Top-left radial gradient
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.topLeft,
                  radius: 2,
                  colors: [
                    Color.fromARGB(50, 232, 64, 64), // bright
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // Bottom-right radial gradient
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: RadialGradient(
                  center: Alignment.bottomRight,
                  radius: 2,
                  colors: [
                    Color.fromARGB(50, 232, 64, 64), // bright
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // Content on top
          Positioned.fill(child: child),
        ],
      ),
    );
  }
}
