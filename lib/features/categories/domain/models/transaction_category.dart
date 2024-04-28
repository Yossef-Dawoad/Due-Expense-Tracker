import 'package:expancetracker/core/utils/json_converters/icondata_converters.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'transaction_category.freezed.dart';
part 'transaction_category.g.dart';

@freezed
class TransactionCategory with _$TransactionCategory {
  const factory TransactionCategory({
    required String id,
    required String title,
    @Default(0.0) double totalAmount,
    required int color,
    required TransactionStatus status,
    @IconDataConverter() required IconData icon,
  }) = _TransactionCategory;

  factory TransactionCategory.fromJson(Map<String, dynamic> json) =>
      _$TransactionCategoryFromJson(json);

  factory TransactionCategory.home() => const TransactionCategory(
        id: 'home',
        title: 'Home',
        totalAmount: 0.0,
        color: 0xFF4CAF50,
        status: TransactionStatus.income,
        icon: Icons.home,
      );
  factory TransactionCategory.food() => const TransactionCategory(
        id: 'food',
        title: 'Food',
        totalAmount: 0.0,
        color: 0xFF2196F3,
        status: TransactionStatus.expense,
        icon: Icons.fastfood,
      );
  factory TransactionCategory.shopping() => const TransactionCategory(
        id: 'shopping',
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
