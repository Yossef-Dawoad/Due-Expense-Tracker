// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_table.dart';

// ignore_for_file: type=lint
mixin _$TransactionsDaoMixin on DatabaseAccessor<AppDatabase> {
  $CategoriesTable get categories => attachedDatabase.categories;
  $TransactionsTable get transactions => attachedDatabase.transactions;
  Selectable<int> getRowsCount() {
    return customSelect('SELECT COUNT(id) AS _c0 FROM transactions',
        variables: [],
        readsFrom: {
          transactions,
        }).map((QueryRow row) => row.read<int>('_c0'));
  }
}
