// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:expancetracker/core/utils/json_converters/icondata_converters.dart';
import 'package:isar/isar.dart';

part 'transaction_category.freezed.dart';
part 'transaction_category.g.dart';

const isarCollectionOnFreezed = Collection(ignore: {'copyWith'});

@freezed
@isarCollectionOnFreezed
class TransactionCategory with _$TransactionCategory {
  const TransactionCategory._();
  const factory TransactionCategory({
    required String uid,
    required String title,
    @Default(0.0) double totalAmount,
    required int color,
    @enumerated required TransactionStatus status,
    @IconDataConverter() required IconData icon,
  }) = _TransactionCategory;

  Id get id => Isar.autoIncrement;

  factory TransactionCategory.fromJson(Map<String, Object?> json) =>
      _$TransactionCategoryFromJson(json);

  factory TransactionCategory.home() => const TransactionCategory(
        uid: 'home',
        title: 'Home',
        totalAmount: 0.0,
        color: 0xFF4CAF50,
        status: TransactionStatus.income,
        icon: Icons.home,
      );
  factory TransactionCategory.food() => const TransactionCategory(
        uid: 'food',
        title: 'Food',
        totalAmount: 0.0,
        color: 0xFF2196F3,
        status: TransactionStatus.expense,
        icon: Icons.fastfood,
      );
  factory TransactionCategory.shopping() => const TransactionCategory(
        uid: 'shopping',
        title: 'Shopping',
        totalAmount: 0.0,
        color: 0xFF9C27B0,
        status: TransactionStatus.expense,
        icon: Icons.shopping_cart,
      );
}

enum TransactionStatus {
  income,
  expense,
}
