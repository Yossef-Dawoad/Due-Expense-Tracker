import 'package:expancetracker/animation/animation.dart';
import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:expancetracker/home/viewmodel/home_viewmodel.dart';
import 'package:expancetracker/home/views/widgets/budget_overview_card.dart';
import 'package:expancetracker/home/views/widgets/daily_insight_card.dart';
import 'package:expancetracker/home/views/widgets/home_app_bar.dart';
import 'package:expancetracker/home/views/widgets/income_expense_summary_row.dart';
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

                  // ── Hero Spending Section ──
                  ClassicSlideWithFadeInAnimation(
                    delay: const Duration(milliseconds: 80),
                    child: ListenableBuilder(
                      listenable: _viewModel.monthlyExpenses,
                      builder: (context, _) {
                        return TodaySpendingHeroSection(
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
                        return IncomeExpenseSummaryRow(
                          income: _viewModel.monthlyIncome.value,
                          expenses: _viewModel.monthlyExpenses.value,
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
                  SizedBox(height: spacing.s4),
                  // ── Budget Overview Heading ──
                  ClassicSlideWithFadeInAnimation(
                    delay: const Duration(milliseconds: 380),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // HTML: text-[17px] font-bold tracking-tight
                        Text(
                          'Budget Overview',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: colors.textPrimary,
                            letterSpacing: -0.3,
                          ),
                        ),
                        // HTML: text-[12px] font-medium
                        Text(
                          'September',
                          style: TextStyle(
                            fontSize: 12,
                            color: colors.textTertiary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
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
                        final limit = 3500.0;
                        final remaining =
                            limit - _viewModel.monthlyExpenses.value;
                        final percentUsed =
                            (_viewModel.monthlyExpenses.value / limit * 100)
                                .clamp(0.0, 100.0);
                        return BudgetOverviewCard(
                          remaining: remaining,
                          limit: limit,
                          percentUsed: percentUsed,
                          daysLeft: 12,
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 28),
                  // ── Recent Activity Heading ──
                  ClassicSlideWithFadeInAnimation(
                    delay: const Duration(milliseconds: 460),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // HTML: text-[17px] font-bold tracking-tight
                        Text(
                          'Recent Activity',
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: colors.textPrimary,
                            letterSpacing: -0.3,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          // HTML: text-sm font-medium = 14px
                          child: Text(
                            'History',
                            style: TextStyle(
                              fontSize: 14,
                              color: colors.textTertiary,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
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
