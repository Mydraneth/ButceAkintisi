import 'package:butceakintisi/core/components/balance_chart.dart';
import 'package:butceakintisi/core/components/transaction_card.dart';
import 'package:butceakintisi/core/utils/dummy_accounts.dart';
import 'package:butceakintisi/core/utils/radial_bg.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  // Calculate total balance from all accounts
  double get totalBalance {
    return dummyAccounts.fold(0.0, (sum, account) => sum + account.balance);
  }

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
            Center(
              child: Text(
                '${(totalBalance / 100).toStringAsFixed(2)} ₺',
                style: const TextStyle(
                    fontSize: 32,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            BalanceChart(currentBalance: totalBalance),
            const SizedBox(height: 20),
            Expanded(
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.transparent,
                      Colors.black.withAlpha(200),
                    ],
                    stops: const [0.0, 0.9, 1.0],
                  ).createShader(bounds);
                },
                blendMode: BlendMode.dstOut,
                child: Scrollbar(
                  thumbVisibility: true,
                  thickness: 6,
                  radius: const Radius.circular(10),
                  interactive: true,
                  child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return const TransactionCard();
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
