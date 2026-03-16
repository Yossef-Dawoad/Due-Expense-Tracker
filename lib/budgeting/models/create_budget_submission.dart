import 'package:expancetracker/budgeting/models/budget_category_model.dart';
import 'package:expancetracker/budgeting/models/budget_period.dart';
import 'package:expancetracker/budgeting/models/budget_summary_model.dart';

class CreateBudgetSubmission {
  const CreateBudgetSubmission({
    required this.name,
    required this.period,
    required this.totalBudget,
    required this.categories,
  });

  final String name;
  final BudgetPeriod period;
  final double totalBudget;
  final List<BudgetCategoryModel> categories;

  double get totalSpent =>
      categories.fold(0, (sum, category) => sum + category.spentAmount);

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
