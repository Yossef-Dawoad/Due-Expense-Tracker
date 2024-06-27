import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:expancetracker/core/common/databases/drift_mixins.dart';
import 'package:expancetracker/core/utils/converters/icondata_converters.dart';
import 'package:expancetracker/features/categories/domain/models/transaction_category.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'category_table.g.dart';

@TableIndex(name: 'id', columns: {#id})
class Categories extends Table with AutoIncrementingPK {
  TextColumn get title => text().nullable()();
  RealColumn get totalAmount => real().withDefault(const Constant(0.0))();
  IntColumn get color => integer()();
  IntColumn get status => intEnum<TransactionStatus>()();

  /// `icon` has a speicial IconDataSQLConverter to map IconData from and to SQL
  TextColumn get icon => text().map(const IconDataSQLConverter())();
}

@DriftDatabase(tables: [Categories], daos: [CategoriesDao])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    // Also work around limitations on old Android versions
    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    // Make sqlite3 pick a more suitable location for temporary files - the
    // one from the system may be inaccessible due to sandboxing.
    final cachebase = (await getTemporaryDirectory()).path;
    // We can't access /tmp on Android, which sqlite3 would try by default.
    // Explicitly tell it about the correct temporary directory.
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file, logStatements: true);
  });
}

// the _TodosDaoMixin will be created by drift. It contains all the necessary
// fields for the tables. The <MyDatabase> type annotation is the database class
// that should use this dao.
@DriftAccessor(
  tables: [Categories],
  queries: {'getRowsCount': 'SELECT COUNT(id) from transactions;'},
)
class CategoriesDao extends DatabaseAccessor<AppDatabase> with _$CategoriesDaoMixin {
  // this constructor is required so that the main database can create an instance
  // of this object.
  CategoriesDao(super.db);

  // Future<List<Transaction>> getAllTransactions() => select(transactions).get();
  // Stream<List<Transaction>> watchAllTransactions() => select(transactions).watch();

  // Future<int> insertTransaction(Insertable<Transaction> transaction) =>
  //     into(transactions).insert(transaction);
  // Future<void> insertBulkTransaction(Iterable<Insertable<Transaction>> items) async =>
  //     await batch((btch) => btch.insertAll(transactions, items));
  // Future<bool> updateTransaction(Insertable<Transaction> transaction) =>
  //     update(transactions).replace(transaction);
  // Future<int> deleteTransaction(Insertable<Transaction> transaction) =>
  //     delete(transactions).delete(transaction);

  // Future<bool> isDataBaseEmpty() async {
  //   final rowsCount = transactions.id.count();
  //   final stmt = select(transactions).addColumns([rowsCount]);
  //   final count = await stmt.map((r) => r.read(rowsCount)!).getSingle();
  //   return count > 0;
  // }
}
