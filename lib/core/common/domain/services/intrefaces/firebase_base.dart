import 'package:expancetracker/core/common/domain/models/transaction_category.dart';
import 'package:expancetracker/features/home/domain/models/money_transaction.dart';

abstract interface class BaseFirebaseTransctionDB {
  Future<void> setNewCategoryTransction(TransactionCategory transaction);
  Future<TransactionCategory> getCategoryTransction(String id);
  Future<List<TransactionCategory>> getAllCategoryTransctions();
  Future<void> deleteCategoryTransaction(TransactionCategory transaction);

  Future<void> setNewTransction(MoneyTransaction transaction);
  Future<MoneyTransaction> getTransction(String id);
  Future<List<MoneyTransaction>> getAllTransctions();
  Future<void> deleteTransaction(MoneyTransaction transaction);
}
