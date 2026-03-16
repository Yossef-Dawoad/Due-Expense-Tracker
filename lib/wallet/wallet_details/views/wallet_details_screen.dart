import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:expancetracker/wallet/wallet_details/viewmodels/stats_viewmodel.dart';
import 'package:expancetracker/wallet/wallet_details/views/widgets/balance_header.dart';
import 'package:expancetracker/wallet/wallet_details/views/widgets/chart_section.dart';
import 'package:expancetracker/wallet/wallet_details/views/widgets/financial_summary_cards.dart';
import 'package:expancetracker/wallet/wallet_details/views/widgets/linked_accounts_list.dart';
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
    final colors = context.kitColors;
    final spacing = context.spacing;

    return Scaffold(
      backgroundColor: colors.bgBase,
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colors.textPrimary),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
        title: Text(
          'Wallet Details',
          style: context.textStyles.headingLG.copyWith(
            color: colors.textPrimary,
            fontWeight: FontWeight.w800,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.more_horiz, color: colors.textPrimary),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(spacing.s6),
          child: Column(
            children: [
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
              SizedBox(height: spacing.s8),

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
              SizedBox(height: spacing.s8),

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
              SizedBox(height: spacing.s8),

              ListenableBuilder(
                listenable: _viewModel.linkedAccounts,
                builder: (context, _) {
                  return LinkedAccountsList(
                    accounts: _viewModel.linkedAccounts.value,
                  );
                },
              ),
              const SizedBox(height: 80),
            ],
          ),
        ),
      ),
    );
  }
}
