import 'package:expancetracker/budgeting/models/budget_category_model.dart';
import 'package:flutter/material.dart';

class CreateBudgetCategoryDraft {
  const CreateBudgetCategoryDraft({
    required this.id,
    required this.name,
    required this.iconData,
    required this.spentAmount,
    required this.allocationText,
    required this.isSelected,
  });

  final String id;
  final String name;
  final IconData iconData;
  final double spentAmount;
  final String allocationText;
  final bool isSelected;

  double get allocationAmount => double.tryParse(allocationText) ?? 0;

  BudgetCategoryModel toBudgetCategoryModel() {
    final normalizedSpent = spentAmount.clamp(0.0, allocationAmount).toDouble();

    return BudgetCategoryModel(
      id: id,
      name: name,
      iconData: iconData,
      totalBudget: allocationAmount,
      spentAmount: normalizedSpent,
    );
  }

  CreateBudgetCategoryDraft copyWith({
    String? id,
    String? name,
    IconData? iconData,
    double? spentAmount,
    String? allocationText,
    bool? isSelected,
  }) {
    return CreateBudgetCategoryDraft(
      id: id ?? this.id,
      name: name ?? this.name,
      iconData: iconData ?? this.iconData,
      spentAmount: spentAmount ?? this.spentAmount,
      allocationText: allocationText ?? this.allocationText,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
