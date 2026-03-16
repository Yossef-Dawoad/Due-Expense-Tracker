import 'package:expancetracker/budgeting/mock_data/budgeting_mock_data.dart';
import 'package:expancetracker/budgeting/models/budget_period.dart';
import 'package:expancetracker/budgeting/models/create_budget_category_draft.dart';
import 'package:expancetracker/budgeting/models/create_budget_submission.dart';
import 'package:expancetracker/core/utils/internal_notification/notify_service.dart';
import 'package:expancetracker/core/utils/internal_notification/toast/toast_event.dart';
import 'package:expancetracker/core/utils/navigation/router_service.dart';
import 'package:flutter/material.dart';

class CreateBudgetViewModel {
  CreateBudgetViewModel({
    required RouterService routerService,
    required NotifyService notifyService,
  }) : _routerService = routerService,
       _notifyService = notifyService {
    final total = BudgetingMockData.categories.fold<double>(
      0,
      (sum, category) => sum + category.totalBudget,
    );
    budgetNameController.text = 'September Plan';
    totalBudgetController.text = total.toStringAsFixed(0);
    budgetName.value = budgetNameController.text;
    totalBudget.value = total;
    budgetNameController.addListener(_syncBudgetName);
    totalBudgetController.addListener(_syncTotalBudget);
  }

  final RouterService _routerService;
  final NotifyService _notifyService;

  final TextEditingController budgetNameController = TextEditingController();
  final TextEditingController totalBudgetController = TextEditingController();

  final ValueNotifier<String> budgetName = ValueNotifier('');
  final ValueNotifier<double> totalBudget = ValueNotifier(0);
  final ValueNotifier<BudgetPeriod> selectedPeriod = ValueNotifier(
    BudgetPeriod.monthly,
  );
  final ValueNotifier<bool> isSaving = ValueNotifier(false);
  final ValueNotifier<List<CreateBudgetCategoryDraft>> categories =
      ValueNotifier(
        List.unmodifiable(
          BudgetingMockData.categories
              .map(
                (category) => CreateBudgetCategoryDraft(
                  id: category.id,
                  name: category.name,
                  iconData: category.iconData,
                  spentAmount: category.spentAmount,
                  allocationText: category.totalBudget.toStringAsFixed(0),
                  isSelected: true,
                ),
              )
              .toList(),
        ),
      );

  double get allocatedAmount => categories.value
      .where((category) => category.isSelected)
      .fold(0, (sum, category) => sum + category.allocationAmount);

  double get remainingToAllocate => totalBudget.value - allocatedAmount;

  int get selectedCount =>
      categories.value.where((category) => category.isSelected).length;

  void setPeriod(BudgetPeriod period) {
    if (selectedPeriod.value == period) {
      return;
    }
    selectedPeriod.value = period;
  }

  void toggleCategory(String categoryId, bool selected) {
    categories.value = List.unmodifiable(
      categories.value
          .map(
            (category) => category.id == categoryId
                ? category.copyWith(isSelected: selected)
                : category,
          )
          .toList(),
    );
  }

  void updateCategoryAmount(String categoryId, String value) {
    final normalized = _normalizeNumericText(value);
    categories.value = List.unmodifiable(
      categories.value
          .map(
            (category) => category.id == categoryId
                ? category.copyWith(allocationText: normalized)
                : category,
          )
          .toList(),
    );
  }

  void reset() {
    budgetNameController.text = 'September Plan';
    totalBudgetController.text = BudgetingMockData.categories
        .fold<double>(0, (sum, category) => sum + category.totalBudget)
        .toStringAsFixed(0);
    selectedPeriod.value = BudgetPeriod.monthly;
    categories.value = List.unmodifiable(
      BudgetingMockData.categories
          .map(
            (category) => CreateBudgetCategoryDraft(
              id: category.id,
              name: category.name,
              iconData: category.iconData,
              spentAmount: category.spentAmount,
              allocationText: category.totalBudget.toStringAsFixed(0),
              isSelected: true,
            ),
          )
          .toList(),
    );
  }

  void close() {
    _routerService.pop();
  }

  Future<void> saveBudget() async {
    final submission = _buildSubmission();
    if (submission == null) {
      _notifyService.setToastEvent(
        ToastEventWarning(
          message: 'Add a name, total, and at least one category',
        ),
      );
      return;
    }

    isSaving.value = true;
    try {
      _notifyService.setToastEvent(
        ToastEventSuccess(message: 'Budget draft is ready'),
      );
      _routerService.pop(submission);
    } finally {
      isSaving.value = false;
    }
  }

  CreateBudgetSubmission? _buildSubmission() {
    final name = budgetName.value.trim();
    final budget = totalBudget.value;
    final selectedCategories = categories.value
        .where(
          (category) => category.isSelected && category.allocationAmount > 0,
        )
        .map((category) => category.toBudgetCategoryModel())
        .toList(growable: false);

    if (name.isEmpty || budget <= 0 || selectedCategories.isEmpty) {
      return null;
    }

    return CreateBudgetSubmission(
      name: name,
      period: selectedPeriod.value,
      totalBudget: budget,
      categories: selectedCategories,
    );
  }

  void _syncBudgetName() {
    budgetName.value = budgetNameController.text;
  }

  void _syncTotalBudget() {
    final normalized = _normalizeNumericText(totalBudgetController.text);
    if (normalized != totalBudgetController.text) {
      totalBudgetController.value = totalBudgetController.value.copyWith(
        text: normalized,
        selection: TextSelection.collapsed(offset: normalized.length),
        composing: TextRange.empty,
      );
    }
    totalBudget.value = double.tryParse(normalized) ?? 0;
  }

  String _normalizeNumericText(String input) {
    if (input.isEmpty) {
      return '';
    }
    final onlyAllowed = input.replaceAll(RegExp(r'[^0-9.]'), '');
    final firstDecimal = onlyAllowed.indexOf('.');
    if (firstDecimal == -1) {
      return onlyAllowed;
    }

    final beforeDecimal = onlyAllowed.substring(0, firstDecimal + 1);
    final afterDecimal = onlyAllowed
        .substring(firstDecimal + 1)
        .replaceAll('.', '');
    return '$beforeDecimal$afterDecimal';
  }

  void dispose() {
    budgetNameController.removeListener(_syncBudgetName);
    totalBudgetController.removeListener(_syncTotalBudget);
    budgetNameController.dispose();
    totalBudgetController.dispose();
    budgetName.dispose();
    totalBudget.dispose();
    selectedPeriod.dispose();
    isSaving.dispose();
    categories.dispose();
  }
}
