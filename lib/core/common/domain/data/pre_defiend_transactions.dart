import 'package:expancetracker/features/categories/data/models/transaction_category.dart';
import 'package:expancetracker/features/transactions/data/models/user_transaction.dart';

final preDefinedTransactions = [
  UserTransaction(
    id: '0',
    amount: 45.0,
    datetime: DateTime.now(),
    category: TransactionCategory.home(),
  ),
  UserTransaction(
    id: '1',
    amount: 90.0,
    datetime: DateTime.now(),
    category: TransactionCategory.shopping(),
  ),
  UserTransaction(
    id: '3',
    amount: 60.0,
    datetime: DateTime.now(),
    category: TransactionCategory.food(),
  )
];
