import 'package:drift/drift.dart';
import 'package:expancetracker/core/common/databases/local_source_interface.dart';
import 'package:expancetracker/core/utils/logger/logger.dart';

import 'database/category_table.dart';

typedef CategoryLocalInterface = LocalSourceInterface<Category>;

class CategoryLocalSource implements CategoryLocalInterface {
  final CategoriesDao _source;
  CategoryLocalSource(this._source);

  @override
  Future<int> deleteItem(Insertable<Category> transaction) async {
    return await _source.deleteCategory(transaction);
  }

  @override
  Future<List<Category>?> getAllItems() async {
    try {
      return await _source.getAllCategorys();
    } catch (err) {
      logger.e('Error reading from db', error: err);
    }
    return null;
  }

  @override
  Future<int?> insertItem(Insertable<Category> transaction) async {
    try {
      return await _source.insertCategory(transaction);
    } catch (err) {
      logger.e('Error reading from db', error: err);
    }
    return null;
  }

  @override
  Future<bool> updateItem(Insertable<Category> transaction) async {
    return await _source.updateCategory(transaction);
  }

  @override
  Stream<List<Category>> watchAllItems() async* {
    yield* _source.watchAllCategorys();
  }

  @override
  Future<void> insertBulkItems(Iterable<Insertable<Category>> transactions) async {
    await _source.insertBulkCategory(transactions);
  }

  @override
  Future<bool> isDataBaseEmpty() async {
    return await _source.isDataBaseEmpty();
  }
}
