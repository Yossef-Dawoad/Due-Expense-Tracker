import 'package:flutter/material.dart';

class BudgetCategoryModel {
  const BudgetCategoryModel({
    required this.id,
    required this.name,
    required this.iconData,
    required this.totalBudget,
    required this.spentAmount,
  });

  final String id;
  final String name;
  final IconData iconData;
  final double totalBudget;
  final double spentAmount;

  double get remainingAmount => totalBudget - spentAmount;

  /// A value between 0.0 and 1.0 representing how much of the budget is spent.
  double get spentFraction =>
      totalBudget > 0 ? (spentAmount / totalBudget).clamp(0.0, 1.0) : 0.0;

  BudgetCategoryModel copyWith({
    String? id,
    String? name,
    IconData? iconData,
    double? totalBudget,
    double? spentAmount,
  }) {
    return BudgetCategoryModel(
      id: id ?? this.id,
      name: name ?? this.name,
      iconData: iconData ?? this.iconData,
      totalBudget: totalBudget ?? this.totalBudget,
      spentAmount: spentAmount ?? this.spentAmount,
    );
  }
}
