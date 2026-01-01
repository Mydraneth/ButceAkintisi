import 'package:butceakintisi/core/components/bottom_appbar.dart';
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
      bottomNavigationBar: const CustomBottomAppBar(),
    );
  }
}
