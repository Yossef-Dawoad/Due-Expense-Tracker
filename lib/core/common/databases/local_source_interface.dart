import 'package:drift/drift.dart';

abstract interface class LocalSourceInterface<Item> {
  Future<List<Item>?> getAllItems();
  Stream<List<Item>?> watchAllItems();

  /// Item Insetred as ItemCompanion for handeling
  /// non-nullable default values
  ///
  /// as the example bellow
  /// ```dart
  /// insertItem(ItemCompanion(name:Value(...)))
  /// ```
  ///
  Future<int?> insertItem(Insertable<Item> item);
  Future<void> insertBulkItems(Iterable<Insertable<Item>> items);
  Future<bool?> updateItem(Insertable<Item> item);
  Future<int?> deleteItem(Insertable<Item> item);
  Future<bool> isDataBaseEmpty();
}
