// Tables can mix-in common definitions if needed
import 'package:drift/drift.dart';

/// A mixin that adds an auto-incrementing (id) Field as primary key to a table.
mixin AutoIncrementingPK on Table {
  IntColumn get id => integer().autoIncrement()();
}
