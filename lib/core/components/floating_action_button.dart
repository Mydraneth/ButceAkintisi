import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final Widget child;

  const CustomFloatingActionButton({required this.child, super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: Colors.transparent,
      elevation: 0,
      child: Container(
        width: 56,
        height: 56,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(255, 227, 130, 60),
              Color.fromARGB(255, 227, 60, 60),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: child,
      ),
    );
  }
}
