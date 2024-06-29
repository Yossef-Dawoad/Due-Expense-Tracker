import 'package:drift/drift.dart';
import 'package:expancetracker/core/bindings/dependancy_injection.dart';
import 'package:expancetracker/core/common/domain/types/result.dart';
import 'package:expancetracker/core/utils/logger/logger.dart';
import 'package:expancetracker/core/utils/network/network_manager.dart';
import 'package:expancetracker/features/categories/domain/datasources/local/database/category_table.dart';
import 'package:expancetracker/features/categories/domain/datasources/local/transaction_local_source.dart';
import 'package:expancetracker/features/categories/domain/models/transaction_category.dart';

import '../datasources/remote/categories_remote_source.dart';

abstract interface class CategoryRepositoryInterface {
  FutureResult<List<TransactionCategory>> fetchAllCategories();
  FutureResult<TransactionCategory> addNewCategory(TransactionCategory category);
  FutureResult<void> deleteCategory(TransactionCategory category);
  FutureResult<TransactionCategory> updateCategory(TransactionCategory category);
}

class CategoriesRepository implements CategoryRepositoryInterface {
  final CategoriesRemoteInterface _categoriesRemoteSource;
  final CategoryLocalInterface _categoriesLocalSource;

  CategoriesRepository({
    required CategoriesRemoteInterface categoriesRemoteSource,
    required CategoryLocalInterface categoriesLocalSource,
  })  : _categoriesRemoteSource = categoriesRemoteSource,
        _categoriesLocalSource = categoriesLocalSource;

  @override
  FutureResult<TransactionCategory> addNewCategory(TransactionCategory category) async {
    final hasNetworkAvailable = await sl<NetworkManagerInterface>().hasInternetAccess;
    if (!hasNetworkAvailable) {
      await _categoriesLocalSource.insertItem(
        CategoriesCompanion(
          title: Value(category.title),
          color: Value(category.color),
          status: Value(category.status),
          totalAmount: Value(category.totalAmount),
        ),
      );
      return Success(category);
    } else {
      // return _addNewCategoryToRemote(category);
      return const Failure('Not implemented yet');
    }
  }

  @override
  FutureResult<void> deleteCategory(TransactionCategory category) {
    // TODO: implement deleteCategory
    throw UnimplementedError();
  }

  @override
  FutureResult<List<TransactionCategory>> fetchAllCategories() async {
    final hasNetworkAvailable = await sl<NetworkManagerInterface>().hasInternetAccess;
    if (!hasNetworkAvailable) {
      return _fetchCategoriesFromLocal();
    } else {
      return _fetchCategoriesFromRemote();
    }
  }

  @override
  FutureResult<TransactionCategory> updateCategory(TransactionCategory category) {
    // TODO: implement updateCategory
    throw UnimplementedError();
  }

  FutureResult<List<TransactionCategory>> _fetchCategoriesFromLocal() async {
    logger.i(
        'Error while Fetching From Remote OR No Internet Connection - Fetching from Local Database');
    try {
      final isDBEmpty = await _categoriesLocalSource.isDataBaseEmpty();
      if (isDBEmpty) {
        return const Failure("No network connection and local database is empty");
      }
      final cachedDevices = await _categoriesLocalSource.getAllItems();

      final cachedDeviceModels = cachedDevices?.map(
        (dbRecord) => TransactionCategory.fromJson(dbRecord.toJson()),
      );
      return Success(cachedDeviceModels?.toList());
    } catch (err) {
      logger.e('Error reading from db', error: err);
      return const Failure("Something went wrong While Querying from Local DB");
    }
  }

  FutureResult<List<TransactionCategory>> _fetchCategoriesFromRemote() async {
    try {
      final categories = await _categoriesRemoteSource.getAllItems();
      if (categories.isEmpty) {
        logger.d('Remote source is empty - Falling back to local database');
        return _fetchCategoriesFromLocal();
      }
      logger.i('Remote source is not empty - Inserting into local database', error: categories);
      await _categoriesLocalSource.insertBulkItems(
        categories.map(
          (ele) => CategoriesCompanion(
            title: Value(ele.title),
            color: Value(ele.color),
            status: Value(ele.status),
            totalAmount: Value(ele.totalAmount),
          ),
        ),
      );
      return Success(categories);
    } catch (err) {
      logger.e('Error occurred while fetching from remote', error: err);
      return _fetchCategoriesFromLocal();
    }
  }

  // Future<TransactionCategory> addNewCategory(TransactionCategory category) async {
  //   return await _categoriesRemoteSource.addNewItem(category);
  // }

  // Future<void> deleteCategory(TransactionCategory category) async {
  //   return await _categoriesRemoteSource.deleteItem(category);
  // }

  // Future<List<TransactionCategory>> getAllCategories() async {
  //   return await _categoriesRemoteSource.getAllItems();
  // }

  // Future<TransactionCategory> getCategoryById(String id) async {
  //   return await _categoriesRemoteSource.getItemById(id);
  // }
}
