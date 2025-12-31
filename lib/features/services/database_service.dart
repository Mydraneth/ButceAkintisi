import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../models/account_model.dart';
import '../models/transaction_model.dart';

class LocalStorageService {
  static const _accountsKey = 'accounts';
  static const _transactionsKey = 'transactions';

  Future<void> saveAccounts(List<Account> accounts) async {
    final prefs = await SharedPreferences.getInstance();
    final data = accounts.map((a) => a.toJson()).toList();
    prefs.setString(_accountsKey, jsonEncode(data));
  }

  Future<List<Account>> loadAccounts() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_accountsKey);
    if (jsonString == null) return [];
    final List list = jsonDecode(jsonString);
    return list.map((e) => Account.fromJson(e)).toList();
  }

  Future<void> deleteAccount(Account account) async {
    final accounts = await loadAccounts();
    accounts.removeWhere((a) => a.id == account.id);
    await saveAccounts(accounts);
  }

  Future<void> saveTransactions(List<MoneyTransaction> txs) async {
    final prefs = await SharedPreferences.getInstance();
    final data = txs.map((t) => t.toJson()).toList();
    prefs.setString(_transactionsKey, jsonEncode(data));
  }

  Future<void> deleteTransaction(MoneyTransaction tx) async {
    final txs = await loadTransactions();
    txs.removeWhere((t) => t.id == tx.id);
    await saveTransactions(txs);
  }

  Future<void> editTransaction(MoneyTransaction updatedTx) async {
    final txs = await loadTransactions();
    final index = txs.indexWhere((t) => t.id == updatedTx.id);
    if (index != -1) {
      txs[index] = updatedTx;
      await saveTransactions(txs);
    }
  }

  Future<List<MoneyTransaction>> loadTransactions() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString(_transactionsKey);
    if (jsonString == null) return [];
    final List list = jsonDecode(jsonString);
    return list.map((e) => MoneyTransaction.fromJson(e)).toList();
  }
}
