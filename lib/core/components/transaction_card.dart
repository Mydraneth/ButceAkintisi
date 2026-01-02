import 'package:flutter/material.dart';

class TransactionCard extends StatelessWidget {
  const TransactionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 35, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'Transaction Title',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 1),
          Text(
            'Transaction details go here. This is a brief description of the transaction.',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 1),
          Text(
            '\$123.45',
            style: Theme.of(context)
                .textTheme
                .bodyLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ]),
      ),
    );
  }
}
