import 'package:expancetracker/animation/animation.dart';
import 'package:expancetracker/core/common/widgets/app_section_header.dart';
import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:expancetracker/home/mock_data/home_mock_data.dart';
import 'package:expancetracker/home/viewmodel/home_viewmodel.dart';
import 'package:expancetracker/home/views/widgets/budget_overview_card.dart';
import 'package:expancetracker/home/views/widgets/daily_insight_card.dart';
import 'package:expancetracker/home/views/widgets/home_app_bar.dart';
import 'package:expancetracker/home/views/widgets/home_sync_status_card.dart';
import 'package:expancetracker/home/views/widgets/recent_activity_section.dart';
import 'package:expancetracker/home/views/widgets/today_spending_hero_section.dart';
import 'package:flutter/material.dart';

import '../../core/common/widgets/icon_metric_stat_pill.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final HomeViewModel _viewModel;
  final bool _showSyncDetails = false;

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
    final spacing = context.spacing;
    final colors = context.kitColors;

    return Scaffold(
      backgroundColor: colors.bgBase,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: spacing.s6, // HTML: px-6 = 24px
              ),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  SizedBox(height: spacing.screenTopPadding),

                  // ── App Bar ── HTML: pt-6 pb-2
                  FadeInAnimation(
                    duration: AnimationDurations.short,
                    child: const HomeAppBar(),
                  ),

                  AnimatedSwitcher(
                    duration: context.durations.duration200,
                    transitionBuilder: (child, animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: SizeTransition(
                          sizeFactor: animation,
                          axisAlignment: -1,
                          child: child,
                        ),
                      );
                    },
                    child: !_showSyncDetails
                        ? const SizedBox.shrink()
                        : Padding(
                            key: const ValueKey('sync-details-card'),
                            padding: EdgeInsets.only(top: spacing.s4),
                            child: ListenableBuilder(
                              listenable: Listenable.merge([
                                _viewModel.isConnected,
                                _viewModel.syncState,
                              ]),
                              builder: (context, _) {
                                return HomeSyncStatusCard(
                                  isConnected: _viewModel.isConnected.value,
                                  syncState: _viewModel.syncState.value,
                                  onRefresh: _viewModel.refreshSync,
                                );
                              },
                            ),
                          ),
                  ),

                  // ── Hero Spending Section ──
                  ClassicSlideWithFadeInAnimation(
                    delay: const Duration(milliseconds: 80),
                    child: ListenableBuilder(
                      listenable: Listenable.merge([
                        _viewModel.monthlyExpenses,
                        _viewModel.totalBalance,
                      ]),
                      builder: (context, _) {
                        return TodaySpendingHeroSection(
                          remaining: _viewModel.totalBalance.value,
                          todaySpending: _viewModel.monthlyExpenses.value,
                          percentageChange: 15,
                          isSpendingDown: true,
                        );
                      },
                    ),
                  ),

                  // ── Income / Expense Row ──
                  ClassicSlideWithFadeInAnimation(
                    delay: const Duration(milliseconds: 160),
                    child: ListenableBuilder(
                      listenable: Listenable.merge([
                        _viewModel.monthlyIncome,
                        _viewModel.monthlyExpenses,
                      ]),
                      builder: (context, _) {
                        return Row(
                          children: [
                            Expanded(
                              child: IconMetricStatPill(
                                label: 'INCOME',
                                value: _viewModel.monthlyIncome.value,
                                icon: Icons.account_balance_wallet_outlined,
                                iconColor: colors
                                    .brandPrimaryDark, // string brand-green
                                startDelay: const Duration(milliseconds: 180),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: IconMetricStatPill(
                                label: 'EXPENSES',
                                value: _viewModel.monthlyExpenses.value,
                                icon: Icons.trending_up,
                                iconColor:
                                    colors.semanticNegative, // string brand-red
                                startDelay: const Duration(milliseconds: 280),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(height: spacing.s4), // tighter gap
                  // ── Daily Insight ──
                  FadeInAnimation(
                    delay: const Duration(milliseconds: 300),
                    child: const DailyInsightCard(
                      title: 'Daily Insight',
                      message:
                          "You've spent 15% less than yesterday. You're on track to save \$340 this month!",
                    ),
                  ),
                  const SizedBox(height: 16), // HTML: mb-4
                  // ── Budget Overview Card ──
                  ClassicSlideWithFadeInAnimation(
                    delay: const Duration(milliseconds: 420),
                    child: ListenableBuilder(
                      listenable: Listenable.merge([
                        _viewModel.totalBalance,
                        _viewModel.monthlyExpenses,
                      ]),
                      builder: (context, _) {
                        return BudgetOverviewCard(
                          limit: HomeMockData.budgetLimit,
                          remaining: HomeMockData.budgetRemaining,
                          month: HomeMockData.budgetMonthStr,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 28),
                  // ── Recent Activity Heading ──
                  ClassicSlideWithFadeInAnimation(
                    delay: const Duration(milliseconds: 460),
                    child: AppSectionHeader(
                      title: 'Recent Activity',
                      titleStyle: TextStyle(
                        fontSize: 17, // text-[17px]
                        fontWeight: FontWeight.w900, // font-black
                        color: colors.textPrimary,
                        letterSpacing: -0.3, // tracking-tight roughly
                      ),
                      trailing: GestureDetector(
                        onTap: () {},
                        child: Text(
                          'See all', // HTML says 'See all'
                          style: TextStyle(
                            fontSize: 12, // text-[12px]
                            color: colors.textTertiary,
                            fontWeight: FontWeight.w800, // font-extrabold
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16), // HTML: mb-4
                  // ── Recent Activity List ──
                  ListenableBuilder(
                    listenable: Listenable.merge([
                      _viewModel.recentTransactions,
                      _viewModel.categories,
                    ]),
                    builder: (context, _) {
                      return RecentActivitySection(
                        transactions: _viewModel.recentTransactions.value,
                        categories: _viewModel.categories.value,
                        onDeleteTransactions: _viewModel.deleteTransactions,
                        animationDelay: const Duration(milliseconds: 500),
                      );
                    },
                  ),
                  const SizedBox(height: 100),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
