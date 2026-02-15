import 'package:expancetracker/core/common/domain/enums/transaction_type.dart';
import 'package:expancetracker/core/services/transaction_service.dart';
import 'package:expancetracker/core/services/wallet_service.dart';
import 'package:expancetracker/features/transactions/data/models/category.dart';
import 'package:expancetracker/features/transactions/data/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class AddTransactionViewModel {
  // Dependencies
  final WalletService walletService;
  final TransactionService transactionService;

  // State
  final ValueNotifier<TransactionType> transactionType = ValueNotifier(
    TransactionType.expense,
  );
  final ValueNotifier<double> amount = ValueNotifier(0.0);
  final ValueNotifier<String> amountString = ValueNotifier('0');
  final ValueNotifier<Category?> selectedCategory = ValueNotifier(null);
  final ValueNotifier<DateTime> date = ValueNotifier(DateTime.now());
  final ValueNotifier<String> notes = ValueNotifier('');
  final ValueNotifier<bool> isSaving = ValueNotifier(false);

  ValueNotifier<List<Category>> get categories => transactionService.categories;

  // Controllers
  final TextEditingController notesController = TextEditingController();

  AddTransactionViewModel({
    required this.walletService,
    required this.transactionService,
  }) {
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

  void setCategory(Category category) {
    selectedCategory.value = category;
  }

  void setDate(DateTime newDate) {
    date.value = newDate;
  }

  void reset() {
    transactionType.value = TransactionType.expense;
    amount.value = 0.0;
    amountString.value = '0';
    selectedCategory.value = null;
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
      final accounts = walletService.linkedAccounts.value;
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

      await transactionService.addTransaction(transaction);
      return true;
    } catch (e) {
      debugPrint('Error saving transaction: $e');
      return false;
    } finally {
      isSaving.value = false;
    }
  }

  void dispose() {
    transactionType.dispose();
    amount.dispose();
    amountString.dispose();
    selectedCategory.dispose();
    date.dispose();
    notes.dispose();
    isSaving.dispose();
    notesController.dispose();
  }
}
