import 'package:butceakintisi/core/utils/radial_bg.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const RadialBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Text('Welcome to the Settings Page!'),
        ),
      ),
    );
  }
}
