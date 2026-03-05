import 'dart:async';

import 'package:expancetracker/core/services/sync_orchestration_service.dart';
import 'package:expancetracker/wallet/data/models/account.dart';
import 'package:expancetracker/wallet/data/repositories/wallet_repository.dart';
import 'package:flutter/material.dart';

/// Service for managing wallet state shared across the app.
///
/// Consumes the [WalletRepository] for offline-first data access
/// and exposes reactive [ValueNotifier]s for UI binding.
class WalletService {
  WalletService({
    required WalletRepository repository,
    required SyncOrchestrationService syncOrchestrationService,
  }) : _repository = repository,
       _syncOrchestrationService = syncOrchestrationService {
    _initialize();
  }

  final WalletRepository _repository;
  final SyncOrchestrationService _syncOrchestrationService;
  StreamSubscription<List<Account>>? _accountsSubscription;

  // Shared State
  final ValueNotifier<double> totalBalance = ValueNotifier(0.0);
  final ValueNotifier<double> monthlyIncome = ValueNotifier(0.0);
  final ValueNotifier<double> monthlyExpenses = ValueNotifier(0.0);
  final ValueNotifier<List<Account>> linkedAccounts = ValueNotifier([]);
  final ValueNotifier<bool> isLoading = ValueNotifier(false);

  /// Sync state from the orchestrator for UI binding.
  ValueNotifier<SyncState> get syncState => _syncOrchestrationService.syncState;

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

  /// Refreshes data by delegating to the sync orchestration service.
  Future<void> refresh() async {
    await _syncOrchestrationService.syncAll();
  }

  /// Disposes resources.
  void dispose() {
    _accountsSubscription?.cancel();
    totalBalance.dispose();
    monthlyIncome.dispose();
    monthlyExpenses.dispose();
    linkedAccounts.dispose();
    isLoading.dispose();
  }
}
