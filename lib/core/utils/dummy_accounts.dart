import '/features/models/account_model.dart'; // Make sure this path matches your file structure
import '/features/models/transaction_model.dart';

final List<Account> dummyAccounts = [
  Account(
    id: 'acc_01',
    name: 'Main Wallet',
    balance: 154050,
    currency: Currency.usd,
  ),
  Account(
    id: 'acc_02',
    name: 'Chase Savings',
    balance: 312221,
    currency: Currency.tl,
  ),
  Account(
    id: 'acc_03',
    name: 'Revolut (Euro)',
    balance: 45075,
    currency: Currency.eur,
  ),
  Account(
    id: 'acc_04',
    name: 'Travel Fund',
    balance: 2500000,
    currency: Currency.aud,
  ),
  Account(
    id: 'acc_05',
    name: 'Joint Account',
    balance: 320000,
    currency: Currency.tl,
  ),
  Account(
    id: 'acc_06',
    name: 'Cash on Hand',
    balance: 120.00,
    currency: Currency.usd,
  ),
];
