import 'package:expancetracker/budgeting/models/budget_period.dart';
import 'package:expancetracker/budgeting/models/create_budget_submission.dart';
import 'package:flutter/foundation.dart';
import 'package:expancetracker/budgeting/models/budget_category_model.dart';
import 'package:expancetracker/budgeting/models/budget_summary_model.dart';
import 'package:expancetracker/budgeting/mock_data/budgeting_mock_data.dart';

class BudgetingViewModel {
  BudgetingViewModel();

  final ValueNotifier<BudgetPeriod> _selectedPeriod = ValueNotifier(
    BudgetPeriod.monthly,
  );
  ValueListenable<BudgetPeriod> get selectedPeriod => _selectedPeriod;

  final ValueNotifier<BudgetSummaryModel> _summary = ValueNotifier(
    BudgetingMockData.summary,
  );
  ValueListenable<BudgetSummaryModel> get summary => _summary;

  final ValueNotifier<List<BudgetCategoryModel>> _categories = ValueNotifier(
    List.unmodifiable(BudgetingMockData.categories),
  );
  ValueListenable<List<BudgetCategoryModel>> get categories => _categories;

  void togglePeriod(BudgetPeriod period) {
    if (_selectedPeriod.value == period) return;
    _selectedPeriod.value = period;
    // In a real implementation, reload data from repository based on period.
  }

  void applyCreatedBudget(CreateBudgetSubmission submission) {
    _selectedPeriod.value = submission.period;
    _summary.value = submission.summary;
    _categories.value = List.unmodifiable(submission.categories);
  }

  void dispose() {
    _selectedPeriod.dispose();
    _summary.dispose();
    _categories.dispose();
  }
}
