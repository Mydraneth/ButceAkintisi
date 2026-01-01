import 'package:butceakintisi/core/components/floating_action_button.dart';
import 'package:flutter/material.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 80,
      padding: EdgeInsets.zero,
      color: Colors.transparent,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: const Color.fromARGB(255, 0, 0, 0).withValues(alpha: 0.2),
              width: 1.0,
            ),
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(Icons.account_balance, color: Colors.white),
            Icon(Icons.receipt, color: Colors.white),
            CustomFloatingActionButton(
                child: Icon(Icons.add, color: Colors.white)),
            Icon(Icons.credit_card_sharp, color: Colors.white),
            Icon(Icons.menu_book, color: Colors.white),
          ],
          // line at the top of bottom app bar
        ),
      ),
    );
  }
}
