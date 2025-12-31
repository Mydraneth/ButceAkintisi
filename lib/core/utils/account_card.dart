import 'package:butceakintisi/core/utils/dummy_accounts.dart';
import 'package:butceakintisi/features/models/account_model.dart';
import 'package:flutter/material.dart';

class AccountCard extends StatefulWidget {
  final Account? initialAccount;

  const AccountCard({super.key, this.initialAccount});

  @override
  State<AccountCard> createState() => _AccountCardState();
}

class _AccountCardState extends State<AccountCard> {
  late Account _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.initialAccount ?? dummyAccounts.first;
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: DropdownButton<Account>(
                    value: _selected,
                    isExpanded: true,
                    items: dummyAccounts
                        .map(
                          (acc) => DropdownMenuItem<Account>(
                            value: acc,
                            child: Text(acc.name),
                          ),
                        )
                        .toList(),
                    onChanged: (acc) {
                      if (acc != null) {
                        setState(() {
                          _selected = acc;
                        });
                      }
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              _selected.name,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(height: 8),
            Text(
              '${(_selected.balance / 100).toStringAsFixed(2)} ${_selected.currency.name.toUpperCase()}',
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue.shade700,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
