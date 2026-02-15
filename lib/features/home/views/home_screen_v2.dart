import 'package:expancetracker/features/home/viewmodel/home_viewmodel.dart';
import 'package:expancetracker/features/home/views/widgets/expense_summary_card.dart';
import 'package:expancetracker/features/home/views/widgets/home_app_bar.dart';
import 'package:expancetracker/features/home/views/widgets/quick_actions.dart';
import 'package:expancetracker/features/home/views/widgets/recent_transactions_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = HomeViewModel();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(
        context,
      ).scaffoldBackgroundColor, // Ensure theme consistency
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.all(24.0),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  const SizedBox(height: 8.0),
                  const HomeAppBar(),
                  const SizedBox(height: 32.0),

                  // Reactive Summary Card
                  ListenableBuilder(
                    listenable: Listenable.merge([
                      _viewModel.totalBalance,
                      _viewModel.monthlyIncome,
                      _viewModel.monthlyExpenses,
                    ]),
                    builder: (context, _) {
                      return ExpenseSummaryCard(
                        totalBalance: _viewModel.totalBalance.value,
                        income: _viewModel.monthlyIncome.value,
                        expenses: _viewModel.monthlyExpenses.value,
                      );
                    },
                  ),
                  const SizedBox(height: 32.0),
                  const QuickActions(),
                  const SizedBox(height: 32.0),
                  Text(
                    'Recent Transactions',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 16.0),
                ]),
              ),
            ),

            // Reactive List
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              sliver: ListenableBuilder(
                listenable: Listenable.merge([
                  _viewModel.recentTransactions,
                  _viewModel.categories,
                ]),
                builder: (context, _) {
                  return RecentTransactionsList(
                    transactions: _viewModel.recentTransactions.value,
                    categories: _viewModel.categories.value,
                  );
                },
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 100.0)),
          ],
        ),
      ),
    );
  }
}
