import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

enum ChartPeriod { threeDays, week, month, quarter }

class AccountData {
  final String name;
  final String type;
  final double balance;
  final bool isActive;
  final String? apy; // e.g., "+3.1% APY"
  final double? trend; // e.g., -1.2 (percentage)
  final Color color;
  final IconData icon;

  AccountData({
    required this.name,
    required this.type,
    required this.balance,
    required this.isActive,
    required this.color,
    required this.icon,
    this.apy,
    this.trend,
  });
}

class StatsViewModel {
  // State handling using ValueNotifier
  final ValueNotifier<double> totalBalance = ValueNotifier(12450.80);
  final ValueNotifier<double> balanceChangePercent = ValueNotifier(2.4);
  final ValueNotifier<ChartPeriod> selectedPeriod = ValueNotifier(
    ChartPeriod.threeDays,
  );
  final ValueNotifier<List<FlSpot>> chartData = ValueNotifier([]);
  final ValueNotifier<double> availableBalance = ValueNotifier(8250.00);
  final ValueNotifier<double> totalLiabilities = ValueNotifier(4200.80);
  final ValueNotifier<List<AccountData>> linkedAccounts = ValueNotifier([]);

  StatsViewModel() {
    _loadInitialData();
  }

  void _loadInitialData() {
    // Mocking API call or logic to load initial data
    updateChartData(ChartPeriod.threeDays);

    linkedAccounts.value = [
      AccountData(
        name: 'Chase Checking',
        type: '**** 4589',
        balance: 5450.00,
        isActive: true,
        color: const Color(0xff117ACA),
        icon: Icons.account_balance,
      ),
      AccountData(
        name: 'High Yield Savings',
        type: 'Wealthfront',
        balance: 2800.00,
        isActive: true,
        apy: '+3.1% APY',
        color: Colors.indigo,
        icon: Icons.savings,
      ),
      AccountData(
        name: 'Coinbase',
        type: 'Crypto Portfolio',
        balance: 4200.80,
        isActive: true,
        trend: -1.2,
        color: const Color(0xff0052FF),
        icon: Icons.currency_bitcoin,
      ),
    ];
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
    totalBalance.dispose();
    balanceChangePercent.dispose();
    selectedPeriod.dispose();
    chartData.dispose();
    availableBalance.dispose();
    totalLiabilities.dispose();
    linkedAccounts.dispose();
  }
}
