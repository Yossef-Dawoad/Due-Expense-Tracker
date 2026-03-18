import 'package:expancetracker/budgeting/models/create_budget_alert_preferences.dart';
import 'package:expancetracker/budgeting/mock_data/budgeting_mock_data.dart';
import 'package:expancetracker/core/services/transaction_service.dart';
import 'package:expancetracker/budgeting/models/budget_period.dart';
import 'package:expancetracker/budgeting/models/create_budget_category_draft.dart';
import 'package:expancetracker/budgeting/models/create_budget_scope.dart';
import 'package:expancetracker/budgeting/models/create_budget_submission.dart';
import 'package:expancetracker/core/utils/internal_notification/notify_service.dart';
import 'package:expancetracker/core/utils/internal_notification/toast/toast_event.dart';
import 'package:expancetracker/core/utils/navigation/router_service.dart';
import 'package:expancetracker/transactions/models/category.dart';
import 'package:flutter/material.dart';

class CreateBudgetViewModel {
  CreateBudgetViewModel({
    required RouterService routerService,
    required NotifyService notifyService,
    required TransactionService transactionService,
  }) : _routerService = routerService,
       _notifyService = notifyService,
       _transactionService = transactionService {
    final total = BudgetingMockData.summary.totalBudget;
    _setTotalBudgetText(total.toStringAsFixed(0));
    _transactionService.categories.addListener(_syncCategoriesFromService);
    _syncCategoriesFromService();
    totalBudgetController.addListener(_syncTotalBudget);
  }

  final RouterService _routerService;
  final NotifyService _notifyService;
  final TransactionService _transactionService;

  final TextEditingController totalBudgetController = TextEditingController();

  final ValueNotifier<double> totalBudget = ValueNotifier(0);
  final ValueNotifier<BudgetPeriod> selectedPeriod = ValueNotifier(
    BudgetPeriod.monthly,
  );
  final ValueNotifier<CreateBudgetScope> selectedScope = ValueNotifier(
    CreateBudgetScope.general,
  );
  final ValueNotifier<CreateBudgetAlertPreferences> alertPreferences =
      ValueNotifier(const CreateBudgetAlertPreferences());
  final ValueNotifier<bool> isSaving = ValueNotifier(false);
  final ValueNotifier<List<CreateBudgetCategoryDraft>> categories =
      ValueNotifier(const []);

  double get allocatedAmount => categories.value
      .where((category) => category.isSelected)
      .fold(0, (sum, category) => sum + category.allocationAmount);

  double get remainingToAllocate => totalBudget.value - allocatedAmount;

  int get selectedCount =>
      categories.value.where((category) => category.isSelected).length;

  String get generatedBudgetName {
    final periodLabel = switch (selectedPeriod.value) {
      BudgetPeriod.monthly => 'Monthly',
      BudgetPeriod.weekly => 'Weekly',
    };

    if (selectedScope.value == CreateBudgetScope.general) {
      return '$periodLabel Budget';
    }

    final selectedCategories = categories.value
        .where((category) => category.isSelected)
        .toList(growable: false);

    if (selectedCategories.length == 1) {
      return '${selectedCategories.first.name} $periodLabel Budget';
    }

    if (selectedCategories.isNotEmpty) {
      return '$periodLabel Category Budget';
    }

    return '$periodLabel Budget';
  }

  String get scopeSummary {
    if (selectedScope.value == CreateBudgetScope.general) {
      return 'Covers all of your spending with one flexible ceiling.';
    }

    if (selectedCount == 0) {
      return 'Choose the categories you want this budget to cover.';
    }

    final remaining = remainingToAllocate;
    final remainingLabel = remaining >= 0
        ? ' ${remaining.toStringAsFixed(0)} left as flexible room.'
        : ' ${remaining.abs().toStringAsFixed(0)} over the total budget.';

    return '$selectedCount categories selected.$remainingLabel';
  }

  void setPeriod(BudgetPeriod period) {
    if (selectedPeriod.value == period) {
      return;
    }
    selectedPeriod.value = period;
  }

  void setScope(CreateBudgetScope scope) {
    if (selectedScope.value == scope) {
      return;
    }
    selectedScope.value = scope;
  }

  void setNotifyAtNinetyPercent(bool enabled) {
    alertPreferences.value = alertPreferences.value.copyWith(
      notifyAtNinetyPercent: enabled,
    );
  }

  void setNotifyWhenExceeded(bool enabled) {
    alertPreferences.value = alertPreferences.value.copyWith(
      notifyWhenExceeded: enabled,
    );
  }

  void setNotifyBeforePeriodEnds(bool enabled) {
    alertPreferences.value = alertPreferences.value.copyWith(
      notifyBeforePeriodEnds: enabled,
    );
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
    _setTotalBudgetText(
      BudgetingMockData.summary.totalBudget.toStringAsFixed(0),
    );
    selectedPeriod.value = BudgetPeriod.monthly;
    selectedScope.value = CreateBudgetScope.general;
    alertPreferences.value = const CreateBudgetAlertPreferences();
    categories.value = _buildDraftsFromCategories(
      _transactionService.categories.value,
      preserveExisting: false,
    );
  }

  void close() {
    _routerService.pop();
  }

  Future<void> saveBudget() async {
    final validationMessage = _validationMessage();
    if (validationMessage != null) {
      _notifyService.setToastEvent(
        ToastEventWarning(message: validationMessage),
      );
      return;
    }

    final submission = _buildSubmission();
    if (submission == null) {
      return;
    }

    isSaving.value = true;
    try {
      _notifyService.setToastEvent(
        ToastEventSuccess(message: '$generatedBudgetName is ready'),
      );
      _routerService.pop(submission);
    } finally {
      isSaving.value = false;
    }
  }

  CreateBudgetSubmission? _buildSubmission() {
    final budget = totalBudget.value;
    final selectedCategories = categories.value
        .where(
          (category) => category.isSelected && category.allocationAmount > 0,
        )
        .map((category) => category.toBudgetCategoryModel())
        .toList(growable: false);

    final scope = selectedScope.value;

    return CreateBudgetSubmission(
      name: generatedBudgetName,
      period: selectedPeriod.value,
      totalBudget: budget,
      categories: scope == CreateBudgetScope.general
          ? const []
          : selectedCategories,
      scope: scope,
      alertPreferences: alertPreferences.value,
    );
  }

  String? _validationMessage() {
    if (totalBudget.value <= 0) {
      return 'Add a total budget amount to continue';
    }

    if (selectedScope.value == CreateBudgetScope.categories &&
        categories.value.isEmpty) {
      return 'Create a few spending categories first, then add a focused budget';
    }

    final hasAllocatedCategory = categories.value.any(
      (category) => category.isSelected && category.allocationAmount > 0,
    );

    if (selectedScope.value == CreateBudgetScope.categories &&
        !hasAllocatedCategory) {
      return 'Select at least one category and give it an amount';
    }

    if (selectedScope.value == CreateBudgetScope.categories &&
        allocatedAmount > totalBudget.value) {
      return 'Category allocations are higher than the total budget';
    }

    return null;
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

  void _syncCategoriesFromService() {
    categories.value = _buildDraftsFromCategories(
      _transactionService.categories.value,
    );
  }

  List<CreateBudgetCategoryDraft> _buildDraftsFromCategories(
    List<CategoryModel> categoryModels, {
    bool preserveExisting = true,
  }) {
    final recentFirstCategories = categoryModels.reversed.toList(
      growable: false,
    );

    return List.unmodifiable(
      recentFirstCategories.map((category) {
        final existingDraft = preserveExisting
            ? categories.value.firstWhere(
                (draft) =>
                    draft.id == category.id ||
                    draft.name.toLowerCase() == category.name.toLowerCase(),
                orElse: () => _emptyDraft,
              )
            : _emptyDraft;
        final mockCategory = BudgetingMockData.categories
            .where(
              (budgetCategory) =>
                  budgetCategory.name.toLowerCase() ==
                  category.name.toLowerCase(),
            )
            .firstOrNull;

        return CreateBudgetCategoryDraft(
          id: category.id,
          name: category.name,
          iconData: _parseIconData(category.icon),
          accentColor: _parseColor(category.color),
          spentAmount: mockCategory?.spentAmount ?? 0,
          allocationText: existingDraft.id.isNotEmpty
              ? existingDraft.allocationText
              : '',
          isSelected: existingDraft.id.isNotEmpty && existingDraft.isSelected,
        );
      }),
    );
  }

  IconData _parseIconData(String value) {
    final codePoint = int.tryParse(value);
    return IconData(
      codePoint ?? Icons.category.codePoint,
      fontFamily: 'MaterialIcons',
    );
  }

  Color _parseColor(String value) {
    final normalized = value.replaceFirst('#', '');
    final valueWithAlpha = normalized.length == 6
        ? 'FF$normalized'
        : normalized;
    final parsed = int.tryParse(valueWithAlpha, radix: 16);
    return Color(parsed ?? 0xFF16A34A);
  }

  void _setTotalBudgetText(String value) {
    totalBudgetController.value = TextEditingValue(
      text: value,
      selection: TextSelection.collapsed(offset: value.length),
    );
    totalBudget.value = double.tryParse(value) ?? 0;
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
    _transactionService.categories.removeListener(_syncCategoriesFromService);
    totalBudgetController.removeListener(_syncTotalBudget);
    totalBudgetController.dispose();
    totalBudget.dispose();
    selectedPeriod.dispose();
    selectedScope.dispose();
    alertPreferences.dispose();
    isSaving.dispose();
    categories.dispose();
  }
}

const _emptyDraft = CreateBudgetCategoryDraft(
  id: '',
  name: '',
  iconData: Icons.category_outlined,
  accentColor: Color(0xFF16A34A),
  spentAmount: 0,
  allocationText: '',
  isSelected: false,
);
