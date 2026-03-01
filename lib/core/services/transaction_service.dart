import 'dart:async';

import 'package:expancetracker/transactions/models/category.dart';
import 'package:expancetracker/transactions/models/transaction.dart';
import 'package:expancetracker/transactions/repositories/category_repository.dart';
import 'package:expancetracker/transactions/repositories/transaction_repository.dart';
import 'package:flutter/material.dart';

/// Service for managing transaction state shared across the app.
///
/// Consumes the [TransactionRepository] for offline-first data access
/// and exposes reactive [ValueNotifier]s for UI binding.
class TransactionService {
  TransactionService({
    required TransactionRepository repository,
    required CategoryRepository categoryRepository,
  }) : _repository = repository,
       _categoryRepository = categoryRepository {
    _initialize();
  }

  final TransactionRepository _repository;
  final CategoryRepository _categoryRepository;
  StreamSubscription<List<Transaction>>? _transactionsSubscription;
  StreamSubscription<List<Category>>? _categoriesSubscription;

  // Shared State
  final ValueNotifier<List<Transaction>> transactions = ValueNotifier([]);
  final ValueNotifier<List<Category>> categories = ValueNotifier([]);
  final ValueNotifier<double> monthlyIncome = ValueNotifier(0.0);
  final ValueNotifier<double> monthlyExpenses = ValueNotifier(0.0);
  final ValueNotifier<bool> isLoading = ValueNotifier(false);
  final ValueNotifier<bool> isSyncing = ValueNotifier(false);

  /// Initializes the service by subscribing to transaction and category changes.
  void _initialize() {
    _transactionsSubscription = _repository.watchAll().listen(
      _onTransactionsChanged,
    );
    _categoriesSubscription = _categoryRepository.watchAll().listen(
      _onCategoriesChanged,
    );
    // Initial sync attempt
    refresh();
  }

  /// Called when transactions change in the local database.
  void _onTransactionsChanged(List<Transaction> items) {
    transactions.value = items;
    _recalculateTotals(items);
  }

  /// Recalculates aggregate values from transactions.
  void _recalculateTotals(List<Transaction> items) {
    double income = 0.0;
    double expenses = 0.0;

    for (final transaction in items) {
      if (transaction.type == TransactionType.income) {
        income += transaction.amount;
      } else if (transaction.type == TransactionType.expense) {
        expenses += transaction.amount;
      }
    }

    monthlyIncome.value = income;
    monthlyExpenses.value = expenses;
  }

  /// Called when categories change in the local database.
  void _onCategoriesChanged(List<Category> items) {
    categories.value = items;
  }

  /// Adds a new transaction.
  Future<Transaction> addTransaction(Transaction transaction) async {
    return _repository.add(transaction);
  }

  /// Updates an existing transaction.
  Future<void> updateTransaction(Transaction transaction) async {
    await _repository.update(transaction);
  }

  /// Deletes a transaction by ID.
  Future<void> deleteTransaction(String id) async {
    await _repository.delete(id);
  }

  /// Refreshes data from remote server.
  Future<void> refresh() async {
    isSyncing.value = true;
    try {
      await Future.wait([
        _repository.syncWithRemote(),
        _categoryRepository.syncWithRemote(),
      ]);
    } finally {
      isSyncing.value = false;
    }
  }

  /// Disposes resources.
  void dispose() {
    _transactionsSubscription?.cancel();
    _categoriesSubscription?.cancel();
    transactions.dispose();
    categories.dispose();
    isLoading.dispose();
    isSyncing.dispose();
  }
}
