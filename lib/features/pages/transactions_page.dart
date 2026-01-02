import 'package:butceakintisi/core/utils/radial_bg.dart';
import 'package:flutter/material.dart';

class TransactionsPage extends StatelessWidget {
  const TransactionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const RadialBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Text(
            'Welcome to the Transactions Page!',
            style: TextStyle(color: Color.fromARGB(255, 238, 238, 238)),
          ),
        ),
      ),
    );
  }
}
