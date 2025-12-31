class MoneyTransaction {
  final String id;
  final String accountId;
  final double amount;
  final String description;
  final DateTime date;
  final Currency currency;

  MoneyTransaction({
    required this.id,
    required this.accountId,
    required this.amount,
    required this.description,
    required this.date,
    required this.currency,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'accountId': accountId,
        'amount': amount,
        'description': description,
        'date': date.toIso8601String(),
        'currency': currency,
      };

  factory MoneyTransaction.fromJson(Map<String, dynamic> json) {
    return MoneyTransaction(
        id: json['id'],
        accountId: json['accountId'],
        amount: json['amount'],
        description: json['description'],
        date: DateTime.parse(json['date']),
        currency: Currency.values
            .firstWhere((e) => e.toString() == json['currency']));
  }
}

enum Currency { usd, eur, gbp, aud, tl }
