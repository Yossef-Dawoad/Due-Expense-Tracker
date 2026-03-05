import 'dart:async';

import 'package:expancetracker/transactions/models/category.dart';
import 'package:expancetracker/transactions/models/tag.dart';
import 'package:expancetracker/transactions/models/transaction.dart';
import 'package:expancetracker/transactions/repositories/category_repository.dart';
import 'package:expancetracker/transactions/repositories/tag_repository.dart';
import 'package:expancetracker/transactions/repositories/transaction_repository.dart';
import 'package:expancetracker/core/services/sync_orchestration_service.dart';
import 'package:flutter/material.dart';

/// Service for managing transaction state shared across the app.
///
/// Consumes the [TransactionRepository] for offline-first data access
/// and exposes reactive [ValueNotifier]s for UI binding.
class TransactionService {
  TransactionService({
    required TransactionRepository repository,
    required CategoryRepository categoryRepository,
    required TagRepository tagRepository,
    required SyncOrchestrationService syncOrchestrationService,
  }) : _repository = repository,
       _categoryRepository = categoryRepository,
       _tagRepository = tagRepository,
       _syncOrchestrationService = syncOrchestrationService {
    _initialize();
  }

  final TransactionRepository _repository;
  final CategoryRepository _categoryRepository;
  final TagRepository _tagRepository;
  final SyncOrchestrationService _syncOrchestrationService;
  StreamSubscription<List<Transaction>>? _transactionsSubscription;
  StreamSubscription<List<CategoryModel>>? _categoriesSubscription;
  StreamSubscription<List<Tag>>? _tagsSubscription;

  // Shared State
  final ValueNotifier<List<Transaction>> transactions = ValueNotifier([]);
  final ValueNotifier<List<CategoryModel>> categories = ValueNotifier([]);
  final ValueNotifier<List<Tag>> tags = ValueNotifier([]);
  final ValueNotifier<double> monthlyIncome = ValueNotifier(0.0);
  final ValueNotifier<double> monthlyExpenses = ValueNotifier(0.0);
  final ValueNotifier<bool> isLoading = ValueNotifier(false);

  /// Sync state from the orchestrator for UI binding.
  ValueNotifier<SyncState> get syncState => _syncOrchestrationService.syncState;

  /// Initializes the service by subscribing to transaction and category changes.
  void _initialize() {
    _transactionsSubscription = _repository.watchAll().listen(
      _onTransactionsChanged,
    );
    _categoriesSubscription = _categoryRepository.watchAll().listen(
      _onCategoriesChanged,
    );
    _tagsSubscription = _tagRepository.watchAll().listen(
      (items) => tags.value = items,
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
  void _onCategoriesChanged(List<CategoryModel> items) {
    categories.value = items;
  }

  /// Adds a new transaction.
  Future<Transaction> addTransaction(Transaction transaction) async {
    return _repository.add(transaction);
  }

  /// Adds a new category to the local database.
  Future<CategoryModel> addCategory(CategoryModel category) async {
    return _categoryRepository.add(category);
  }

  /// Updates an existing transaction.
  Future<void> updateTransaction(Transaction transaction) async {
    await _repository.update(transaction);
  }

  /// Deletes a transaction by ID.
  Future<void> deleteTransaction(String id) async {
    await _repository.delete(id);
  }

  /// Refreshes data by delegating to the sync orchestration service.
  Future<void> refresh() async {
    await _syncOrchestrationService.syncAll();
  }

  /// Adds a new tag locally.
  Future<Tag> addTag(Tag tag) async {
    return _tagRepository.add(tag);
  }

  /// Disposes resources.
  void dispose() {
    _transactionsSubscription?.cancel();
    _categoriesSubscription?.cancel();
    _tagsSubscription?.cancel();
    transactions.dispose();
    categories.dispose();
    tags.dispose();
    isLoading.dispose();
  }
}
