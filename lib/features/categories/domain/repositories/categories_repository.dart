import 'package:expancetracker/features/categories/domain/models/transaction_category.dart';

import '../datasources/categories_remote_datasource.dart';

class CategoriesRepository {
  final CategoriesRemoteService _categoriesRemoteSource;

  CategoriesRepository({required CategoriesRemoteService categoriesRemoteSource})
      : _categoriesRemoteSource = categoriesRemoteSource;

  Future<TransactionCategory> addNewCategory(TransactionCategory category) async {
    return await _categoriesRemoteSource.addNewItem(category);
  }

  Future<void> deleteCategory(TransactionCategory category) async {
    return await _categoriesRemoteSource.deleteItem(category);
  }

  Future<List<TransactionCategory>> getAllCategories() async {
    return await _categoriesRemoteSource.getAllItems();
  }

  Future<TransactionCategory> getCategoryById(String id) async {
    return await _categoriesRemoteSource.getItemById(id);
  }
}
