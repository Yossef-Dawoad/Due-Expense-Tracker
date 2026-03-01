import 'package:expancetracker/core/utils/locator.dart';
import 'package:expancetracker/core/services/wallet_service.dart';
import 'package:expancetracker/features/wallet/data/models/account.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

enum ChartPeriod { threeDays, week, month, quarter }

class StatsViewModel {
  StatsViewModel() : _walletService = locator<WalletService>() {
    _loadInitialData();
  }

  final WalletService _walletService;

  // Expose Service State
  ValueNotifier<double> get totalBalance => _walletService.totalBalance;
  ValueNotifier<List<Account>> get linkedAccounts =>
      _walletService.linkedAccounts;

  // Local State
  final ValueNotifier<double> balanceChangePercent = ValueNotifier(2.4);
  final ValueNotifier<ChartPeriod> selectedPeriod = ValueNotifier(
    ChartPeriod.threeDays,
  );
  final ValueNotifier<List<FlSpot>> chartData = ValueNotifier([]);
  final ValueNotifier<double> availableBalance = ValueNotifier(8250.00);
  final ValueNotifier<double> totalLiabilities = ValueNotifier(4200.80);

  void _loadInitialData() {
    // Initial local data loading
    updateChartData(ChartPeriod.threeDays);
  }

  void updateChartData(ChartPeriod period) {
    selectedPeriod.value = period;
    // Mock logic for different periods
    switch (period) {
      case ChartPeriod.threeDays:
        chartData.value = const [
          FlSpot(0, 3),
          FlSpot(2.6, 2),
          FlSpot(4.9, 3),
          FlSpot(6.8, 3.1),
          FlSpot(8, 4),
          FlSpot(9.5, 3.5),
          FlSpot(11, 5),
        ];
        break;
      case ChartPeriod.week:
        chartData.value = const [
          FlSpot(0, 4),
          FlSpot(2, 3),
          FlSpot(4, 5),
          FlSpot(6, 4),
          FlSpot(8, 6),
          FlSpot(10, 5),
        ];
        break;
      case ChartPeriod.month:
        chartData.value = const [
          FlSpot(0, 2),
          FlSpot(3, 4),
          FlSpot(6, 3),
          FlSpot(9, 6),
          FlSpot(12, 5),
        ];
        break;
      case ChartPeriod.quarter:
        chartData.value = const [
          FlSpot(0, 3),
          FlSpot(4, 5),
          FlSpot(8, 4),
          FlSpot(12, 6),
        ];
        break;
    }
  }

  void dispose() {
    // Do NOT dispose service notifiers here as they are shared
    balanceChangePercent.dispose();
    selectedPeriod.dispose();
    chartData.dispose();
    availableBalance.dispose();
    totalLiabilities.dispose();
  }
}
