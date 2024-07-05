// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_table.dart';

// ignore_for_file: type=lint
mixin _$CategoriesDaoMixin on DatabaseAccessor<AppDatabase> {
  $CategoriesTable get categories => attachedDatabase.categories;
  Selectable<int> getRowsCount() {
    return customSelect('SELECT COUNT(id) AS _c0 FROM categories',
        variables: [],
        readsFrom: {
          categories,
        }).map((QueryRow row) => row.read<int>('_c0'));
  }
}
