import './transaction_model.dart';

class Account {
  final String id;
  final String name;
  double balance;
  final Currency currency;

  Account({
    required this.id,
    required this.name,
    required this.balance,
    required this.currency,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'balance': balance,
        'currency': currency,
      };

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
        id: json['id'],
        name: json['name'],
        balance: json['balance'],
        currency: Currency.values
            .firstWhere((e) => e.toString() == json['currency']));
  }
}
