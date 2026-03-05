import 'package:expancetracker/core/utils/navigation/routes.dart';
import 'package:expancetracker/core/services/transaction_service.dart';
import 'package:expancetracker/core/services/wallet_service.dart';
import 'package:expancetracker/core/utils/navigation/router_service.dart';
import 'package:expancetracker/core/utils/internal_notification/notify_service.dart';
import 'package:expancetracker/core/utils/internal_notification/toast/toast_event.dart';
import 'package:expancetracker/transactions/models/category.dart';
import 'package:expancetracker/transactions/models/preset_categories.dart';
import 'package:expancetracker/transactions/models/tag.dart';
import 'package:expancetracker/transactions/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class AddTransactionViewModel {
  // Dependencies
  final WalletService _walletService;
  final TransactionService _transactionService;
  final RouterService _routerService;
  final NotifyService _notifyService;

  // State
  final ValueNotifier<TransactionType> transactionType = ValueNotifier(
    TransactionType.expense,
  );
  final ValueNotifier<double> amount = ValueNotifier(0.0);
  final ValueNotifier<String> amountString = ValueNotifier('0');
  final ValueNotifier<CategoryModel?> selectedCategory = ValueNotifier(null);
  final ValueNotifier<DateTime> date = ValueNotifier(DateTime.now());
  final ValueNotifier<String> notes = ValueNotifier('');
  final ValueNotifier<bool> isSaving = ValueNotifier(false);

  /// Pending tag names — plain strings, NOT persisted until save.
  final ValueNotifier<List<String>> pendingTagNames = ValueNotifier([]);

  ValueNotifier<List<CategoryModel>> get categories =>
      _transactionService.categories;

  ValueNotifier<List<Tag>> get allTags => _transactionService.tags;

  // Controllers
  final TextEditingController notesController = TextEditingController();

  AddTransactionViewModel({
    required WalletService walletService,
    required TransactionService transactionService,
    required RouterService routerService,
    required NotifyService notifyService,
  }) : _walletService = walletService,
       _transactionService = transactionService,
       _routerService = routerService,
       _notifyService = notifyService {
    notesController.addListener(() {
      notes.value = notesController.text;
    });
  }

  void setTransactionType(TransactionType type) {
    transactionType.value = type;
  }

  void setAmount(String value) {
    if (value.isEmpty) {
      amountString.value = '0';
      amount.value = 0.0;
      return;
    }
    amountString.value = value;
    amount.value = double.tryParse(value) ?? 0.0;
  }

  void setCategory(CategoryModel category) {
    selectedCategory.value = category;
  }

  /// Selects a preset category — inserting it into the database if it does not
  /// already exist. This prevents duplicate categories from accumulating.
  Future<void> selectOrInsertPresetCategory(PresetCategory preset) async {
    // Check if this preset already exists in the DB (by name, case-insensitive).
    final existing = categories.value.firstWhere(
      (c) => c.name.toLowerCase() == preset.name.toLowerCase(),
      orElse: () =>
          CategoryModel(id: '', name: '', icon: '', color: '', userId: ''),
    );

    if (existing.id.isNotEmpty) {
      // Already in the DB — just select it.
      selectedCategory.value = existing;
      return;
    }

    // Not in the DB yet — insert it then select it.
    final newCategory = CategoryModel(
      id: const Uuid().v4(),
      userId: '',
      name: preset.name,
      icon: preset.icon.codePoint.toString(),
      color: preset.color.toARGB32().toRadixString(16).padLeft(8, '0'),
      isDirty: true,
    );

    try {
      final saved = await _transactionService.addCategory(newCategory);
      selectedCategory.value = saved;
    } catch (e) {
      debugPrint('Error inserting preset category: $e');
    }
  }

  void setDate(DateTime newDate) {
    date.value = newDate;
  }

  /// Adds a tag name to the pending list (displayed as a chip immediately).
  void addTagName(String name) {
    final trimmed = name.trim();
    if (trimmed.isEmpty) return;
    // Avoid duplicates (case-insensitive).
    final already = pendingTagNames.value.any(
      (n) => n.toLowerCase() == trimmed.toLowerCase(),
    );
    if (already) return;
    pendingTagNames.value = [...pendingTagNames.value, trimmed];
  }

  /// Removes a tag name from the pending list.
  void removeTagName(String name) {
    pendingTagNames.value = pendingTagNames.value
        .where((n) => n != name)
        .toList();
  }

  void reset() {
    transactionType.value = TransactionType.expense;
    amount.value = 0.0;
    amountString.value = '0';
    selectedCategory.value = null;
    pendingTagNames.value = [];
    date.value = DateTime.now();
    notes.value = '';
    notesController.clear();
  }

  Future<bool> saveTransaction() async {
    if (amount.value <= 0 || selectedCategory.value == null) {
      return false; // Validation failed
    }

    isSaving.value = true;
    try {
      // Use the first linked account as default, or empty string
      final accounts = _walletService.linkedAccounts.value;
      final accountId = accounts.isNotEmpty ? accounts.first.id : '';

      final transaction = Transaction(
        id: const Uuid().v4(),
        userId: '', // Will be set by service/repo layer
        accountId: accountId,
        amount: amount.value,
        type: transactionType.value,
        date: date.value,
        categoryId: selectedCategory.value!.id,
        note: notes.value.isEmpty ? null : notes.value,
        isDirty: true,
      );

      await _transactionService.addTransaction(transaction);
      _notifyService.setToastEvent(
        ToastEventSuccess(message: 'Transaction saved successfully'),
      );
      return true;
    } catch (e) {
      debugPrint('Error saving transaction: $e');
      _notifyService.setToastEvent(
        ToastEventError(message: 'Failed to save transaction: $e'),
      );
      return false;
    } finally {
      isSaving.value = false;
    }
  }

  void navigateToHome() {
    _routerService.go(Routes.home);
  }

  void dispose() {
    transactionType.dispose();
    amount.dispose();
    amountString.dispose();
    selectedCategory.dispose();
    pendingTagNames.dispose();
    date.dispose();
    notes.dispose();
    isSaving.dispose();
    notesController.dispose();
  }
}
