import 'package:expancetracker/transactions/models/transaction.dart';

/// Pre-defined sample transactions for development/testing.
final preDefinedTransactions = [
  Transaction(
    id: '0',
    userId: 'demo',
    accountId: 'default',
    amount: 45.0,
    type: TransactionType.expense,
    date: DateTime.now(),
    categoryId: 'home',
  ),
  Transaction(
    id: '1',
    userId: 'demo',
    accountId: 'default',
    amount: 90.0,
    type: TransactionType.expense,
    date: DateTime.now(),
    categoryId: 'shopping',
  ),
  Transaction(
    id: '3',
    userId: 'demo',
    accountId: 'default',
    amount: 60.0,
    type: TransactionType.expense,
    date: DateTime.now(),
    categoryId: 'food',
  ),
];
