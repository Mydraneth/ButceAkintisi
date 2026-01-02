import './transaction_model.dart';

class Account {
  final String id;
  final String name;
  double balance;
  final Currency currency;
  final DateTime createdAt;

  Account({
    required this.id,
    required this.name,
    required this.balance,
    required this.currency,
    required this.createdAt,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'balance': balance,
        'currency': currency,
        'createdAt': createdAt.toIso8601String(),
      };

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      id: json['id'],
      name: json['name'],
      balance: json['balance'],
      currency:
          Currency.values.firstWhere((e) => e.toString() == json['currency']),
      createdAt: DateTime.parse(json['createdAt']),
    );
  }
}
