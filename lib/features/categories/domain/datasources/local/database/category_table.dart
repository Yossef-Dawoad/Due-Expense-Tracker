import 'package:drift/drift.dart';
import 'package:expancetracker/core/common/databases/app_database.dart';
import 'package:expancetracker/core/common/databases/drift_mixins.dart';
import 'package:expancetracker/core/utils/converters/icondata_converters.dart';
import 'package:expancetracker/features/categories/domain/models/transaction_category.dart';

part 'category_table.g.dart';

@TableIndex(name: 'categories_id', columns: {#id})
class Categories extends Table with AutoIncrementingPK {
  TextColumn get title => text().nullable()();
  RealColumn get totalAmount => real().withDefault(const Constant(0.0))();
  IntColumn get color => integer()();
  IntColumn get status => intEnum<TransactionStatus>()();

  /// `icon` has a speicial IconDataSQLConverter to map IconData from and to SQL
  TextColumn get icon => text().map(const IconDataSQLConverter())();
}

// @DriftDatabase(tables: [Categories], daos: [CategoriesDao])
// class AppDatabase extends _$AppDatabase {
//   AppDatabase() : super(_openConnection());

//   @override
//   int get schemaVersion => 1;
// }

// the _TodosDaoMixin will be created by drift. It contains all the necessary
// fields for the tables. The <MyDatabase> type annotation is the database class
// that should use this dao.
@DriftAccessor(
  tables: [Categories],
  queries: {'getRowsCount': 'SELECT COUNT(id) from categories;'},
)
class CategoriesDao extends DatabaseAccessor<AppDatabase> with _$CategoriesDaoMixin {
  // this constructor is required so that the main database can create an instance
  // of this object.
  CategoriesDao(super.db);

  Future<List<Category>> getAllCategorys() => select(categories).get();
  Stream<List<Category>> watchAllCategorys() => select(categories).watch();

  Future<int> insertCategory(Insertable<Category> transaction) =>
      into(categories).insert(transaction);
  Future<void> insertBulkCategory(Iterable<Insertable<Category>> items) async =>
      await batch((btch) => btch.insertAll(categories, items));
  Future<bool> updateCategory(Insertable<Category> transaction) =>
      update(categories).replace(transaction);
  Future<int> deleteCategory(Insertable<Category> transaction) =>
      delete(categories).delete(transaction);

  Future<bool> isDataBaseEmpty() async {
    final rowsCount = categories.id.count();
    final stmt = select(categories).addColumns([rowsCount]);
    final count = await stmt.map((r) => r.read(rowsCount)!).getSingle();
    return count > 0;
  }
}
