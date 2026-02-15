import 'dart:async';

import 'package:expancetracker/features/wallet/data/models/account.dart';
import 'package:expancetracker/features/wallet/data/repositories/wallet_repository.dart';
import 'package:flutter/material.dart';

/// Service for managing wallet state shared across the app.
///
/// Consumes the [WalletRepository] for offline-first data access
/// and exposes reactive [ValueNotifier]s for UI binding.
class WalletService {
  WalletService({required WalletRepository repository})
    : _repository = repository {
    _initialize();
  }

  final WalletRepository _repository;
  StreamSubscription<List<Account>>? _accountsSubscription;

  // Shared State
  final ValueNotifier<double> totalBalance = ValueNotifier(0.0);
  final ValueNotifier<double> monthlyIncome = ValueNotifier(0.0);
  final ValueNotifier<double> monthlyExpenses = ValueNotifier(0.0);
  final ValueNotifier<List<Account>> linkedAccounts = ValueNotifier([]);
  final ValueNotifier<bool> isLoading = ValueNotifier(false);
  final ValueNotifier<bool> isSyncing = ValueNotifier(false);

  /// Initializes the service by subscribing to account changes.
  void _initialize() {
    _accountsSubscription = _repository.watchAll().listen(_onAccountsChanged);
    // Initial sync attempt
    refresh();
  }

  /// Called when accounts change in the local database.
  void _onAccountsChanged(List<Account> accounts) {
    linkedAccounts.value = accounts;
    _recalculateTotals(accounts);
  }

  /// Recalculates aggregate values from accounts.
  void _recalculateTotals(List<Account> accounts) {
    totalBalance.value = accounts.fold(0.0, (sum, a) => sum + a.balance);
    // Note: Monthly income/expenses would need transaction data
    // For now, keeping placeholder calculation
  }

  /// Adds a new account.
  Future<Account> addAccount(Account account) async {
    return _repository.add(account);
  }

  /// Updates an existing account.
  Future<void> updateAccount(Account account) async {
    await _repository.update(account);
  }

  /// Deletes an account by ID.
  Future<void> deleteAccount(String id) async {
    await _repository.delete(id);
  }

  /// Refreshes data from remote server.
  Future<void> refresh() async {
    isSyncing.value = true;
    try {
      await _repository.syncWithRemote();
    } finally {
      isSyncing.value = false;
    }
  }

  /// Disposes resources.
  void dispose() {
    _accountsSubscription?.cancel();
    totalBalance.dispose();
    monthlyIncome.dispose();
    monthlyExpenses.dispose();
    linkedAccounts.dispose();
    isLoading.dispose();
    isSyncing.dispose();
  }
}
