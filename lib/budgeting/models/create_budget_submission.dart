import 'package:expancetracker/budgeting/models/create_budget_alert_preferences.dart';
import 'package:expancetracker/budgeting/models/budget_category_model.dart';
import 'package:expancetracker/budgeting/models/budget_period.dart';
import 'package:expancetracker/budgeting/models/budget_summary_model.dart';
import 'package:expancetracker/budgeting/models/create_budget_scope.dart';

class CreateBudgetSubmission {
  const CreateBudgetSubmission({
    required this.name,
    required this.period,
    required this.totalBudget,
    required this.categories,
    required this.scope,
    required this.alertPreferences,
  });

  final String name;
  final BudgetPeriod period;
  final double totalBudget;
  final List<BudgetCategoryModel> categories;
  final CreateBudgetScope scope;
  final CreateBudgetAlertPreferences alertPreferences;

  double get totalSpent =>
      categories.fold(0, (sum, category) => sum + category.spentAmount);

  bool get isGeneralBudget => scope == CreateBudgetScope.general;

  BudgetSummaryModel get summary {
    final spentFraction = totalBudget <= 0
        ? 0.0
        : (totalSpent / totalBudget).clamp(0.0, 1.0);
    return BudgetSummaryModel(
      totalBudget: totalBudget,
      overallSpentFraction: spentFraction,
    );
  }
}
