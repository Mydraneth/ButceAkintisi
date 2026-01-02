import 'package:butceakintisi/core/components/transaction_card.dart';
import 'package:butceakintisi/core/utils/radial_bg.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    // RadialBackground'ı buraya taşıdık
    return RadialBackground(
      child: SafeArea(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 10),
              child: Center(
                child: Text(
                  'Welcome',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text('Available Balance',
                  style: TextStyle(
                      fontSize: 16, color: Color.fromARGB(255, 227, 181, 60))),
            ),
            const Center(
              child: Text(
                '3.169.152 ₺', // Formatlama sonra eklenecek
                style: TextStyle(
                    fontSize: 32, // Biraz büyüttüm
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 20,
                itemBuilder: (context, index) {
                  return const TransactionCard();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
