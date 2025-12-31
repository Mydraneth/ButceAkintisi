import 'package:butceakintisi/core/components/floating_action_button.dart';
import 'package:butceakintisi/core/utils/radial_bg.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: const RadialBackground(
        child: SafeArea(
          child: Column(
            children: [
              Center(
                child: Text('Available Balance',
                    //E3B53C
                    style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 227, 181, 60))),
              ),
              Center(
                child: Text(
                  '3169152 ₺',
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: const CustomFloatingActionButton(
        child: Icon(Icons.add, color: Colors.white),
      ),
      appBar: AppBar(
        title: const Center(
            child: Text(
          'Welcome',
          style: TextStyle(color: Colors.white),
        )),
        backgroundColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        height: 60,
        child: Center(
          child: Text(
            '© çükülata',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.blue.shade900),
          ),
        ),
      ),
    );
  }
}
