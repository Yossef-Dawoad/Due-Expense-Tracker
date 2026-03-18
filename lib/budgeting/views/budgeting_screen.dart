import 'package:expancetracker/animation/animation.dart';
import 'package:expancetracker/budgeting/models/budget_period.dart';
import 'package:expancetracker/budgeting/models/create_budget_submission.dart';
import 'package:expancetracker/budgeting/viewmodels/budgeting_view_model.dart';
import 'package:expancetracker/budgeting/views/widgets/budget_category_list.dart';
import 'package:expancetracker/budgeting/views/widgets/budget_overview_header.dart';
import 'package:expancetracker/budgeting/views/widgets/budget_status_alert.dart';
import 'package:expancetracker/core/common/widgets/app_bottom_action_button.dart';
import 'package:expancetracker/core/common/widgets/app_screen_scaffold.dart';
import 'package:expancetracker/core/common/widgets/app_sliver_page_body.dart';
import 'package:expancetracker/core/common/widgets/bottom_scrim_action_bar.dart';
import 'package:expancetracker/core/common/widgets/budget_summary_spotlight_card.dart';
import 'package:expancetracker/core/common/widgets/metric_stat_pill_pair.dart';
import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:expancetracker/core/utils/locator.dart';
import 'package:expancetracker/core/utils/navigation/router_service.dart';
import 'package:expancetracker/core/utils/navigation/routes.dart';
import 'package:flutter/material.dart';

class BudgetingScreen extends StatefulWidget {
  const BudgetingScreen({super.key});

  @override
  State<BudgetingScreen> createState() => _BudgetingScreenState();
}

class _BudgetingScreenState extends State<BudgetingScreen> {
  late final BudgetingViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = BudgetingViewModel();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  Future<void> _openCreateBudgetFlow() async {
    final submission = await locator<RouterService>()
        .push<CreateBudgetSubmission>(Routes.createBudget);

    if (submission != null) {
      _viewModel.applyCreatedBudget(submission);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScreenScaffold(
      child: Stack(
        children: [
          _BudgetingScrollableBody(viewModel: _viewModel),
          BottomScrimActionBar(
            hideWhenKeyboardVisible: false,
            child: SlideInAnimation(
              beginOffset: const Offset(0, 1),
              delay: const Duration(milliseconds: 260),
              duration: AnimationDurations.long,
              curve: AnimationCurves.decelerate,
              child: AppBottomActionButton(
                label: 'Create Budget',
                icon: Icons.add_circle_outline,
                onPressed: _openCreateBudgetFlow,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BudgetingScrollableBody extends StatelessWidget {
  const _BudgetingScrollableBody({required this.viewModel});

  final BudgetingViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;

    return AppSliverPageBody(
      children: [
        ValueListenableBuilder(
          valueListenable: viewModel.selectedPeriod,
          builder: (context, period, _) => FadeInAnimation(
            duration: AnimationDurations.short,
            child: BudgetOverviewHeader(
              selectedPeriod: period,
              onPeriodChanged: viewModel.togglePeriod,
            ),
          ),
        ),
        const SizedBox(height: 16),
        ListenableBuilder(
          listenable: Listenable.merge([
            viewModel.summary,
            viewModel.selectedPeriod,
            viewModel.categories,
          ]),
          builder: (context, _) {
            final summary = viewModel.summary.value;
            final periodLabel =
                viewModel.selectedPeriod.value == BudgetPeriod.monthly
                ? 'MONTHLY'
                : 'WEEKLY';
            final periodLabelLower =
                viewModel.selectedPeriod.value == BudgetPeriod.monthly
                ? 'month'
                : 'week';
            final hasCategories = viewModel.categories.value.isNotEmpty;

            return ClassicSlideWithFadeInAnimation(
              delay: const Duration(milliseconds: 80),
              child: BudgetSummarySpotlightCard(
                eyebrow: '$periodLabel BUDGET',
                totalBudget: summary.totalBudget,
                supportingText: hasCategories
                    ? 'Allocated across the categories in this plan.'
                    : 'Keeping this budget flexible across all of your spending.',
                spentFraction: summary.overallSpentFraction,
                spentPercentageLabel: '${summary.overallSpentPercentage}%',
                highlightLabel:
                    '${summary.overallSpentPercentage}% used so far this $periodLabelLower',
                leadingMetric: MetricStatPillData(
                  label: 'Remaining',
                  value: summary.remainingAmount,
                  icon: Icons.account_balance_wallet_outlined,
                  iconColor: colors.brandPrimaryDark,
                  startDelay: const Duration(milliseconds: 180),
                ),
                trailingMetric: MetricStatPillData(
                  label: 'Spent',
                  value: summary.spentAmount,
                  icon: Icons.trending_up,
                  iconColor: colors.semanticNegative,
                  startDelay: const Duration(milliseconds: 280),
                ),
              ),
            );
          },
        ),
        ValueListenableBuilder(
          valueListenable: viewModel.categories,
          builder: (context, categories, _) {
            final atRiskCount = categories
                .where((category) => category.spentFraction >= 0.8)
                .length;
            return ClassicSlideWithFadeInAnimation(
              delay: const Duration(milliseconds: 140),
              child: BudgetStatusAlert(atRiskCount: atRiskCount),
            );
          },
        ),
        ValueListenableBuilder(
          valueListenable: viewModel.categories,
          builder: (context, categories, _) => ClassicSlideWithFadeInAnimation(
            delay: const Duration(milliseconds: 220),
            child: BudgetCategoryList(categories: categories),
          ),
        ),
        const SizedBox(height: 180),
      ],
    );
  }
}
