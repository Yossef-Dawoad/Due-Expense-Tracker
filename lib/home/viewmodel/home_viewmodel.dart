import 'package:expancetracker/core/services/connectivity_service.dart';
import 'package:expancetracker/core/services/sync_orchestration_service.dart';
import 'package:expancetracker/core/utils/locator.dart';
import 'package:expancetracker/core/services/transaction_service.dart';
import 'package:expancetracker/core/services/wallet_service.dart';
import 'package:expancetracker/transactions/models/category.dart';
import 'package:expancetracker/transactions/models/transaction.dart';
import 'package:flutter/material.dart';

class HomeViewModel {
  HomeViewModel()
    : _walletService = locator<WalletService>(),
      _transactionService = locator<TransactionService>(),
      _connectivityService = locator<ConnectivityService>();

  final WalletService _walletService;
  final TransactionService _transactionService;
  final ConnectivityService _connectivityService;

  // Wallet State
  ValueNotifier<double> get totalBalance => _walletService.totalBalance;

  // Transaction Stats
  ValueNotifier<double> get monthlyIncome => _transactionService.monthlyIncome;
  ValueNotifier<double> get monthlyExpenses =>
      _transactionService.monthlyExpenses;

  // Recent Transactions
  ValueNotifier<List<Transaction>> get recentTransactions =>
      _transactionService.transactions;

  // Categories (needed for UI resolution)
  ValueNotifier<List<CategoryModel>> get categories =>
      _transactionService.categories;

  ValueNotifier<SyncState> get syncState => _transactionService.syncState;

  ValueNotifier<bool> get isConnected => _connectivityService.isConnected;

  Future<void> refreshSync() async {
    await _transactionService.refresh();
  }

  /// Deletes a transaction by its ID.
  Future<void> deleteTransaction(String id) async {
    await _transactionService.deleteTransaction(id);
  }

  /// Deletes multiple transactions by their IDs.
  Future<void> deleteTransactions(List<String> ids) async {
    for (final id in ids) {
      await _transactionService.deleteTransaction(id);
    }
  }

  void dispose() {
    // No local state to dispose, services are singletons or disposed elsewhere if needed
    // But ViewModels should usually not dispose singleton services.
    // Since we are proxying Notifiers from Services, we don't need to dispose them here.
  }
}
