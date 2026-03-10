class BudgetSummaryModel {
  const BudgetSummaryModel({
    required this.totalBudget,
    required this.overallSpentFraction,
  });

  final double totalBudget;

  /// A value between 0.0 and 1.0 representing overall spending across all categories.
  final double overallSpentFraction;

  double get spentAmount => totalBudget * overallSpentFraction;

  double get remainingAmount => totalBudget - spentAmount;

  int get overallSpentPercentage => (overallSpentFraction * 100).round();

  BudgetSummaryModel copyWith({
    double? totalBudget,
    double? overallSpentFraction,
  }) {
    return BudgetSummaryModel(
      totalBudget: totalBudget ?? this.totalBudget,
      overallSpentFraction: overallSpentFraction ?? this.overallSpentFraction,
    );
  }
}
