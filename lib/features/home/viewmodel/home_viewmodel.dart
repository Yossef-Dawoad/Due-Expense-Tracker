import 'package:expancetracker/core/bindings/dependancy_injection.dart';
import 'package:expancetracker/core/services/transaction_service.dart';
import 'package:expancetracker/core/services/wallet_service.dart';
import 'package:expancetracker/features/transactions/data/models/category.dart';
import 'package:expancetracker/features/transactions/data/models/transaction.dart';
import 'package:flutter/material.dart';

class HomeViewModel {
  HomeViewModel()
    : _walletService = sl<WalletService>(),
      _transactionService = sl<TransactionService>();

  final WalletService _walletService;
  final TransactionService _transactionService;

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
  ValueNotifier<List<Category>> get categories =>
      _transactionService.categories;

  void dispose() {
    // No local state to dispose, services are singletons or disposed elsewhere if needed
    // But ViewModels should usually not dispose singleton services.
    // Since we are proxying Notifiers from Services, we don't need to dispose them here.
  }
}
