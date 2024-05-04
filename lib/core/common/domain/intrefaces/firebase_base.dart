import 'package:expancetracker/features/categories/data/models/transaction_category.dart';
import 'package:expancetracker/features/transactions/data/models/user_transaction.dart';

abstract interface class BaseFirebaseTransctionDB {
  Future<void> setNewCategoryTransction(TransactionCategory transaction);
  Future<TransactionCategory> getCategoryTransction(String id);
  Future<List<TransactionCategory>> getAllCategoryTransctions();
  Future<void> deleteCategoryTransaction(TransactionCategory transaction);

  Future<void> setNewTransction(UserTransaction transaction);
  Future<UserTransaction> getTransction(String id);
  Future<List<UserTransaction>> getAllTransctions();
  Future<void> deleteTransaction(UserTransaction transaction);
}

abstract interface class BaseFireBaseDB<T> {
  final String collectionName = '';
  Future<T> addNewItem(T item);
  Future<T> getItemById(String id);
  Future<List<T>> getAllItems();
  Future<void> deleteItem(T item);
}
