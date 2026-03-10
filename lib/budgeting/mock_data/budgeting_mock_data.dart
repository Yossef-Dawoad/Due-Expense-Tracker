import 'package:flutter/material.dart';
import 'package:expancetracker/budgeting/models/budget_category_model.dart';
import 'package:expancetracker/budgeting/models/budget_summary_model.dart';

abstract final class BudgetingMockData {
  static const BudgetSummaryModel summary = BudgetSummaryModel(
    totalBudget: 3500.00,
    overallSpentFraction: 0.65,
  );

  static final List<BudgetCategoryModel> categories = [
    BudgetCategoryModel(
      id: 'housing',
      name: 'Housing',
      iconData: Icons.home_outlined,
      totalBudget: 1200.00,
      spentAmount: 1020.00,
    ),
    BudgetCategoryModel(
      id: 'food_drinks',
      name: 'Food & Drinks',
      iconData: Icons.restaurant_outlined,
      totalBudget: 600.00,
      spentAmount: 270.00,
    ),
    BudgetCategoryModel(
      id: 'fun',
      name: 'Fun',
      iconData: Icons.celebration_outlined,
      totalBudget: 300.00,
      spentAmount: 60.00,
    ),
  ];
}
