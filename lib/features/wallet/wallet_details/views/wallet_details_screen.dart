import 'package:expancetracker/features/wallet/wallet_details/viewmodels/stats_viewmodel.dart';
import 'package:expancetracker/features/wallet/wallet_details/views/widgets/balance_header.dart';
import 'package:expancetracker/features/wallet/wallet_details/views/widgets/chart_section.dart';
import 'package:expancetracker/features/wallet/wallet_details/views/widgets/financial_summary_cards.dart';
import 'package:expancetracker/features/wallet/wallet_details/views/widgets/linked_accounts_list.dart';
import 'package:flutter/material.dart';

class WalletDetailsScreen extends StatefulWidget {
  const WalletDetailsScreen({super.key});

  @override
  State<WalletDetailsScreen> createState() => _WalletDetailsScreenState();
}

class _WalletDetailsScreenState extends State<WalletDetailsScreen> {
  late final StatsViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = StatsViewModel();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Ensuring Navigation Bar Glitch fix is unrelated here,
    // but assuming this screen is pushed or part of a tab view.
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).colorScheme.onSurface,
          ),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: Text(
          'Wallet Details',
          style: Theme.of(
            context,
          ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.more_horiz,
              color: Theme.of(context).colorScheme.onSurface,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // Balance Header
              ListenableBuilder(
                listenable: Listenable.merge([
                  _viewModel.totalBalance,
                  _viewModel.balanceChangePercent,
                ]),
                builder: (context, _) {
                  return BalanceHeader(
                    totalBalance: _viewModel.totalBalance.value,
                    balanceChangePercent: _viewModel.balanceChangePercent.value,
                  );
                },
              ),
              const SizedBox(height: 32),

              // Chart Section
              ListenableBuilder(
                listenable: Listenable.merge([
                  _viewModel.selectedPeriod,
                  _viewModel.chartData,
                ]),
                builder: (context, _) {
                  return ChartSection(
                    selectedPeriod: _viewModel.selectedPeriod.value,
                    chartData: _viewModel.chartData.value,
                    onPeriodChanged: _viewModel.updateChartData,
                  );
                },
              ),
              const SizedBox(height: 32),

              // Available Balance & Liabilities
              ListenableBuilder(
                listenable: Listenable.merge([
                  _viewModel.availableBalance,
                  _viewModel.totalLiabilities,
                ]),
                builder: (context, _) {
                  return FinancialSummaryCards(
                    availableBalance: _viewModel.availableBalance.value,
                    totalLiabilities: _viewModel.totalLiabilities.value,
                  );
                },
              ),
              const SizedBox(height: 32),

              // Linked Accounts
              ListenableBuilder(
                listenable: _viewModel.linkedAccounts,
                builder: (context, _) {
                  return LinkedAccountsList(
                    accounts: _viewModel.linkedAccounts.value,
                  );
                },
              ),
              const SizedBox(height: 80), // Bottom padding for FAB or Nav
            ],
          ),
        ),
      ),
      // Floating Action Button for "Add" if needed, as per design bottom bar
      // But assuming bottom bar is global navigation.
      // The design shows a specific FAB like button in the bottom nav.
      // If this screen is standalone, we might default to no FAB or add one if requested.
      // Keeping it clean for now.
    );
  }
}
