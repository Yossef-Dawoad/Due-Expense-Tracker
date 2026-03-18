import 'package:expancetracker/animation/animation.dart';
import 'package:expancetracker/core/common/widgets/app_content_section.dart';
import 'package:expancetracker/core/common/widgets/app_screen_scaffold.dart';
import 'package:expancetracker/core/common/widgets/app_sliver_page_body.dart';
import 'package:expancetracker/core/common/widgets/insight_callout_card.dart';
import 'package:expancetracker/core/common/widgets/metric_stat_pill_pair.dart';
import 'package:expancetracker/core/common/widgets/monthly_budget_snapshot_card.dart';
import 'package:expancetracker/core/common/widgets/user_greeting_header_bar.dart';
import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:expancetracker/home/mock_data/home_mock_data.dart';
import 'package:expancetracker/home/viewmodel/home_viewmodel.dart';
import 'package:expancetracker/home/views/widgets/home_sync_status_card.dart';
import 'package:expancetracker/home/views/widgets/recent_activity_section.dart';
import 'package:expancetracker/home/views/widgets/today_spending_hero_section.dart';
import 'package:flutter/material.dart';

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
    final colors = context.kitColors;

    return AppScreenScaffold(
      child: AppSliverPageBody(
        horizontalPadding: context.spacing.s6,
        children: [
          FadeInAnimation(
            duration: AnimationDurations.short,
            child: const UserGreetingHeaderBar(
              avatarUrl: HomeMockData.userAvatarUrl,
              eyebrow: HomeMockData.greetingPrefix,
              userName: HomeMockData.userName,
              hasUnreadNotifications: true,
            ),
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
                    padding: EdgeInsets.only(top: context.spacing.s4),
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
          ClassicSlideWithFadeInAnimation(
            delay: const Duration(milliseconds: 160),
            child: ListenableBuilder(
              listenable: Listenable.merge([
                _viewModel.monthlyIncome,
                _viewModel.monthlyExpenses,
              ]),
              builder: (context, _) {
                return MetricStatPillPair(
                  leadingMetric: MetricStatPillData(
                    label: 'INCOME',
                    value: _viewModel.monthlyIncome.value,
                    icon: Icons.account_balance_wallet_outlined,
                    iconColor: colors.brandPrimaryDark,
                    startDelay: const Duration(milliseconds: 180),
                  ),
                  trailingMetric: MetricStatPillData(
                    label: 'EXPENSES',
                    value: _viewModel.monthlyExpenses.value,
                    icon: Icons.trending_up,
                    iconColor: colors.semanticNegative,
                    startDelay: const Duration(milliseconds: 280),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: context.spacing.s4),
          FadeInAnimation(
            delay: const Duration(milliseconds: 300),
            child: const InsightCalloutCard(
              title: 'Daily Insight',
              message:
                  "You've spent 15% less than yesterday. You're on track to save \$340 this month!",
            ),
          ),
          const SizedBox(height: 16),
          ClassicSlideWithFadeInAnimation(
            delay: const Duration(milliseconds: 420),
            child: MonthlyBudgetSnapshotCard(
              title: '${HomeMockData.budgetMonthStr} Budget',
              supportingText: '12 days left',
              remainingAmount: HomeMockData.budgetRemaining,
              totalBudget: HomeMockData.budgetLimit,
            ),
          ),
          const SizedBox(height: 28),
          ClassicSlideWithFadeInAnimation(
            delay: const Duration(milliseconds: 460),
            child: AppContentSection(
              title: 'Recent Activity',
              headerSpacing: 16,
              titleStyle: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w900,
                color: colors.textPrimary,
                letterSpacing: -0.3,
              ),
              trailing: GestureDetector(
                onTap: () {},
                child: Text(
                  'See all',
                  style: TextStyle(
                    fontSize: 12,
                    color: colors.textTertiary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ),
              child: ListenableBuilder(
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
            ),
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }
}
