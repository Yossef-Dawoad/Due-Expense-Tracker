import 'package:expancetracker/animation/animation.dart';
import 'package:expancetracker/budgeting/models/budget_period.dart';
import 'package:expancetracker/budgeting/viewmodels/create_budget_view_model.dart';
import 'package:expancetracker/budgeting/views/widgets/budget_period_toggle.dart';
import 'package:expancetracker/budgeting/views/widgets/create_budget_category_selector.dart';
import 'package:expancetracker/budgeting/views/widgets/create_budget_money_field.dart';
import 'package:expancetracker/budgeting/views/widgets/create_budget_section_card.dart';
import 'package:expancetracker/core/common/widgets/app_bottom_action_button.dart';
import 'package:expancetracker/core/common/widgets/app_flow_header_bar.dart';
import 'package:expancetracker/core/common/widgets/app_pill_badge.dart';
import 'package:expancetracker/core/common/widgets/app_section_header.dart';
import 'package:expancetracker/core/common/widgets/app_surface_card.dart';
import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:expancetracker/core/utils/internal_notification/notify_service.dart';
import 'package:expancetracker/core/utils/locator.dart';
import 'package:expancetracker/core/utils/navigation/router_service.dart';
import 'package:flutter/material.dart';

class CreateBudgetScreen extends StatefulWidget {
  const CreateBudgetScreen({super.key});

  @override
  State<CreateBudgetScreen> createState() => _CreateBudgetScreenState();
}

class _CreateBudgetScreenState extends State<CreateBudgetScreen> {
  late final CreateBudgetViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = CreateBudgetViewModel(
      routerService: locator<RouterService>(),
      notifyService: locator<NotifyService>(),
    );
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
      body: SafeArea(
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: EdgeInsets.fromLTRB(
                    spacing.screenHorizontalPadding,
                    spacing.s2,
                    spacing.screenHorizontalPadding,
                    120,
                  ),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate([
                      FadeInAnimation(
                        duration: AnimationDurations.short,
                        child: AppFlowHeaderBar(
                          title: 'Create Budget',
                          leadingIcon: Icons.close,
                          leadingLabel: 'Close create budget',
                          onLeadingPressed: _viewModel.close,
                          trailingLabel: 'Reset',
                          onTrailingPressed: _viewModel.reset,
                        ),
                      ),
                      SizedBox(height: spacing.s2),
                      ClassicSlideWithFadeInAnimation(
                        delay: const Duration(milliseconds: 70),
                        child: _CreateBudgetHero(viewModel: _viewModel),
                      ),
                      SizedBox(height: spacing.s5),
                      ClassicSlideWithFadeInAnimation(
                        delay: const Duration(milliseconds: 140),
                        child: _CreateBudgetIdentityCard(viewModel: _viewModel),
                      ),
                      SizedBox(height: spacing.s5),
                      ValueListenableBuilder<BudgetPeriod>(
                        valueListenable: _viewModel.selectedPeriod,
                        builder: (context, period, _) {
                          return ClassicSlideWithFadeInAnimation(
                            delay: const Duration(milliseconds: 210),
                            child: CreateBudgetSectionCard(
                              title: 'Cadence',
                              subtitle:
                                  'Keep the same overview rhythm, but choose the planning window for this budget.',
                              child: BudgetPeriodToggle(
                                selectedPeriod: period,
                                onToggle: _viewModel.setPeriod,
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(height: spacing.s5),
                      ListenableBuilder(
                        listenable: Listenable.merge([
                          _viewModel.categories,
                          _viewModel.totalBudget,
                        ]),
                        builder: (context, _) {
                          return ClassicSlideWithFadeInAnimation(
                            delay: const Duration(milliseconds: 280),
                            child: _CreateBudgetAllocationCard(
                              viewModel: _viewModel,
                            ),
                          );
                        },
                      ),
                    ]),
                  ),
                ),
              ],
            ),
            Positioned(
              left: 20,
              right: 20,
              bottom: 24,
              child: ValueListenableBuilder<bool>(
                valueListenable: _viewModel.isSaving,
                builder: (context, isSaving, _) {
                  return AppBottomActionButton(
                    label: 'Create Budget',
                    icon: Icons.check_rounded,
                    isLoading: isSaving,
                    onPressed: _viewModel.saveBudget,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CreateBudgetHero extends StatelessWidget {
  const _CreateBudgetHero({required this.viewModel});

  final CreateBudgetViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final textStyles = context.textStyles;
    final spacing = context.spacing;

    return AppSurfaceCard(
      width: double.infinity,
      padding: EdgeInsets.all(spacing.cardPadding),
      child: ListenableBuilder(
        listenable: Listenable.merge([
          viewModel.budgetName,
          viewModel.totalBudget,
          viewModel.selectedPeriod,
          viewModel.categories,
        ]),
        builder: (context, _) {
          final budgetName = viewModel.budgetName.value;
          final totalBudget = viewModel.totalBudget.value;
          final remaining = viewModel.remainingToAllocate;
          final badgeColor = remaining >= 0
              ? colors.brandPrimary
              : colors.semanticNegative;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSectionHeader(
                title: budgetName.trim().isEmpty
                    ? 'Shape a new budget'
                    : budgetName,
                subtitle:
                    'Built to feel at home with your Home hero, transaction flow, and budgeting overview.',
                titleStyle: textStyles.displayMD.copyWith(
                  color: colors.textPrimary,
                  fontWeight: FontWeight.w900,
                ),
                subtitleStyle: textStyles.bodySM.copyWith(
                  color: colors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
                trailing: AppPillBadge(
                  label: viewModel.selectedPeriod.value.label,
                ),
              ),
              SizedBox(height: spacing.s4),
              Wrap(
                spacing: spacing.s2,
                runSpacing: spacing.s2,
                children: [
                  AppPillBadge(
                    label: '\$${totalBudget.toStringAsFixed(0)} total',
                    icon: Icons.account_balance_wallet_outlined,
                  ),
                  AppPillBadge(
                    label: '${viewModel.selectedCount} categories',
                    icon: Icons.grid_view_rounded,
                  ),
                  AppPillBadge(
                    label:
                        '${remaining >= 0 ? 'Left to assign' : 'Over target'} \$${remaining.abs().toStringAsFixed(0)}',
                    icon: Icons.insights_rounded,
                    textColor: badgeColor,
                    backgroundColor: badgeColor.withValues(alpha: 0.12),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class _CreateBudgetIdentityCard extends StatelessWidget {
  const _CreateBudgetIdentityCard({required this.viewModel});

  final CreateBudgetViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;
    final textStyles = context.textStyles;
    final colors = context.kitColors;

    return CreateBudgetSectionCard(
      title: 'Foundation',
      subtitle:
          'Set the plan name and target before you start assigning category caps.',
      child: Column(
        children: [
          TextField(
            controller: viewModel.budgetNameController,
            style: textStyles.bodyMD.copyWith(
              color: colors.textPrimary,
              fontWeight: FontWeight.w700,
            ),
            decoration: const InputDecoration(
              labelText: 'Budget name',
              hintText: 'September Essentials',
            ),
          ),
          SizedBox(height: spacing.s4),
          CreateBudgetMoneyField(
            controller: viewModel.totalBudgetController,
            initialValue: viewModel.totalBudgetController.text,
            onChanged: (_) {},
            hintText: '3500',
          ),
        ],
      ),
    );
  }
}

class _CreateBudgetAllocationCard extends StatelessWidget {
  const _CreateBudgetAllocationCard({required this.viewModel});

  final CreateBudgetViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final categories = viewModel.categories.value;
    final remaining = viewModel.remainingToAllocate;
    final colors = context.kitColors;

    return CreateBudgetSectionCard(
      title: 'Category allocation',
      subtitle:
          'Reuse your strongest categories and tune each amount for a data-ready plan.',
      trailing: AppPillBadge(
        label: '${viewModel.selectedCount} active',
        icon: Icons.tune_rounded,
      ),
      child: Column(
        children: [
          _BudgetAllocationInsight(
            allocated: viewModel.allocatedAmount,
            total: viewModel.totalBudget.value,
            remaining: remaining,
          ),
          SizedBox(height: context.spacing.s4),
          CreateBudgetCategorySelector(
            categories: categories,
            onSelectionChanged: viewModel.toggleCategory,
            onAmountChanged: viewModel.updateCategoryAmount,
          ),
          if (remaining < 0) ...[
            SizedBox(height: context.spacing.s4),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'You are assigning more than the target budget. Keep it if that is intentional, or reduce a category cap.',
                style: context.textStyles.bodySM.copyWith(
                  color: colors.semanticNegative,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _BudgetAllocationInsight extends StatelessWidget {
  const _BudgetAllocationInsight({
    required this.allocated,
    required this.total,
    required this.remaining,
  });

  final double allocated;
  final double total;
  final double remaining;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final spacing = context.spacing;
    final textStyles = context.textStyles;
    final tone = remaining >= 0 ? colors.brandPrimary : colors.semanticNegative;

    return Container(
      padding: EdgeInsets.all(spacing.s3),
      decoration: BoxDecoration(
        color: colors.bgBase,
        borderRadius: context.borderRadius.xl,
        border: Border.all(color: colors.borderLight),
      ),
      child: Row(
        children: [
          Expanded(
            child: _BudgetMetric(label: 'Allocated', value: allocated),
          ),
          SizedBox(width: spacing.s3),
          Expanded(
            child: _BudgetMetric(label: 'Target', value: total),
          ),
          SizedBox(width: spacing.s3),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  remaining >= 0 ? 'Remaining' : 'Over',
                  style: textStyles.labelSM.copyWith(
                    color: colors.textTertiary,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1.1,
                  ),
                ),
                SizedBox(height: spacing.s1),
                Text(
                  '\$${remaining.abs().toStringAsFixed(0)}',
                  style: textStyles.headingMD.copyWith(
                    color: tone,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BudgetMetric extends StatelessWidget {
  const _BudgetMetric({required this.label, required this.value});

  final String label;
  final double value;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final spacing = context.spacing;
    final textStyles = context.textStyles;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: textStyles.labelSM.copyWith(
            color: colors.textTertiary,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.1,
          ),
        ),
        SizedBox(height: spacing.s1),
        Text(
          '\$${value.toStringAsFixed(0)}',
          style: textStyles.headingMD.copyWith(
            color: colors.textPrimary,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}
