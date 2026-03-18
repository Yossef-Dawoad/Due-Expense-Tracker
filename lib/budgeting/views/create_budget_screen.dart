import 'package:expancetracker/animation/animation.dart';
import 'package:expancetracker/budgeting/models/budget_period.dart';
import 'package:expancetracker/budgeting/models/create_budget_scope.dart';
import 'package:expancetracker/budgeting/viewmodels/create_budget_view_model.dart';
import 'package:expancetracker/budgeting/views/widgets/create_budget_alert_preferences_list.dart';
import 'package:expancetracker/budgeting/views/widgets/create_budget_cadence_panel.dart';
import 'package:expancetracker/budgeting/views/widgets/create_budget_category_selector.dart';
import 'package:expancetracker/budgeting/views/widgets/create_budget_scope_selector.dart';
import 'package:expancetracker/budgeting/views/widgets/create_budget_section_card.dart';
import 'package:expancetracker/core/common/widgets/app_bottom_action_button.dart';
import 'package:expancetracker/core/common/widgets/app_flow_header_bar.dart';
import 'package:expancetracker/core/common/widgets/app_pill_badge.dart';
import 'package:expancetracker/core/common/widgets/app_screen_scaffold.dart';
import 'package:expancetracker/core/common/widgets/app_surface_card.dart';
import 'package:expancetracker/core/common/widgets/bottom_scrim_action_bar.dart';
import 'package:expancetracker/core/common/widgets/colored_feature_icon.dart';
import 'package:expancetracker/core/services/transaction_service.dart';
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
  final Set<String> _focusedInputIds = <String>{};

  bool get _isAnyInputFocused => _focusedInputIds.isNotEmpty;

  @override
  void initState() {
    super.initState();
    _viewModel = CreateBudgetViewModel(
      routerService: locator<RouterService>(),
      notifyService: locator<NotifyService>(),
      transactionService: locator<TransactionService>(),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  void _handleInputFocusChanged(String inputId, bool isFocused) {
    final didChange = isFocused
        ? _focusedInputIds.add(inputId)
        : _focusedInputIds.remove(inputId);

    if (!didChange || !mounted) {
      return;
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;
    const stagger = Duration(milliseconds: 80);

    return AppScreenScaffold(
      child: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(
              spacing.screenHorizontalPadding,
              0,
              spacing.screenHorizontalPadding,
              180,
            ),
            child: Column(
              children: [
                FadeInAnimation(
                  duration: AnimationDurations.medium,
                  child: AppFlowHeaderBar(
                    title: 'Create Budget',
                    leadingIcon: Icons.close,
                    leadingLabel: 'Close create budget',
                    onLeadingPressed: _viewModel.close,
                    trailingLabel: 'Reset',
                    onTrailingPressed: _viewModel.reset,
                  ),
                ),
                ClassicSlideWithFadeInAnimation(
                  delay: stagger,
                  child: ListenableBuilder(
                    listenable: Listenable.merge([
                      _viewModel.selectedPeriod,
                      _viewModel.selectedScope,
                    ]),
                    builder: (context, _) {
                      return CreateBudgetSectionCard(
                        title: 'Cadence & amount',
                        subtitle:
                            'Set the rhythm and ceiling before you shape the budget.',
                        child: CreateBudgetCadencePanel(
                          amountController: _viewModel.totalBudgetController,
                          selectedPeriod: _viewModel.selectedPeriod.value,
                          selectedScope: _viewModel.selectedScope.value,
                          budgetName: _viewModel.generatedBudgetName,
                          onPeriodChanged: _viewModel.setPeriod,
                          onAmountFocusChanged: (isFocused) {
                            _handleInputFocusChanged(
                              'total-budget-amount',
                              isFocused,
                            );
                          },
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: spacing.s4),
                ClassicSlideWithFadeInAnimation(
                  delay: stagger * 2,
                  child: ListenableBuilder(
                    listenable: Listenable.merge([
                      _viewModel.selectedScope,
                      _viewModel.categories,
                      _viewModel.totalBudget,
                    ]),
                    builder: (context, _) {
                      final isCategoryBudget =
                          _viewModel.selectedScope.value ==
                          CreateBudgetScope.categories;
                      final remaining = _viewModel.remainingToAllocate;
                      final remainingLabel = remaining >= 0
                          ? '\$${remaining.toStringAsFixed(0)} flexible'
                          : '\$${remaining.abs().toStringAsFixed(0)} over';

                      return CreateBudgetSectionCard(
                        title: 'Budget scope',
                        subtitle:
                            'Keep it broad for all spending or focus it on categories you want to watch closely.',
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CreateBudgetScopeSelector(
                              selectedScope: _viewModel.selectedScope.value,
                              onChanged: _viewModel.setScope,
                            ),
                            SizedBox(height: spacing.s4),
                            Wrap(
                              spacing: spacing.s2,
                              runSpacing: spacing.s2,
                              children: [
                                AppPillBadge(
                                  label: isCategoryBudget
                                      ? '${_viewModel.selectedCount} selected'
                                      : 'All spending',
                                  backgroundColor: context
                                      .kitColors
                                      .brandPrimary
                                      .withValues(alpha: 0.1),
                                  textColor: context.kitColors.brandPrimaryDark,
                                ),
                                AppPillBadge(
                                  label: remainingLabel,
                                  backgroundColor: remaining >= 0
                                      ? context.kitColors.brandPrimary
                                            .withValues(alpha: 0.08)
                                      : context.kitColors.semanticNegative
                                            .withValues(alpha: 0.1),
                                  textColor: remaining >= 0
                                      ? context.kitColors.brandPrimaryDark
                                      : context.kitColors.semanticNegative,
                                ),
                              ],
                            ),
                            SizedBox(height: spacing.s4),
                            if (isCategoryBudget)
                              CreateBudgetCategorySelector(
                                categories: _viewModel.categories.value,
                                onSelectionChanged: _viewModel.toggleCategory,
                                onAmountChanged:
                                    _viewModel.updateCategoryAmount,
                                onInputFocusChanged: _handleInputFocusChanged,
                              )
                            else
                              const _GeneralBudgetHintCard(),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: spacing.s4),
                ClassicSlideWithFadeInAnimation(
                  delay: stagger * 3,
                  child: ValueListenableBuilder(
                    valueListenable: _viewModel.alertPreferences,
                    builder: (context, preferences, _) {
                      return CreateBudgetSectionCard(
                        title: 'Alerts & guardrails',
                        subtitle:
                            'Choose the reminders that help you stay calm and ahead of your spending.',
                        child: CreateBudgetAlertPreferencesList(
                          preferences: preferences,
                          onNotifyAtNinetyPercentChanged:
                              _viewModel.setNotifyAtNinetyPercent,
                          onNotifyWhenExceededChanged:
                              _viewModel.setNotifyWhenExceeded,
                          onNotifyBeforePeriodEndsChanged:
                              _viewModel.setNotifyBeforePeriodEnds,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          BottomScrimActionBar(
            isVisible: !_isAnyInputFocused,
            child: _CreateBudgetActionBar(viewModel: _viewModel),
          ),
        ],
      ),
    );
  }
}

class _GeneralBudgetHintCard extends StatelessWidget {
  const _GeneralBudgetHintCard();

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final textStyles = context.textStyles;

    return AppSurfaceCard(
      padding: const EdgeInsets.all(16),
      backgroundColor: colors.bgBase,
      borderRadius: context.borderRadius.xl,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ColoredFeatureIcon(
            icon: Icons.public_rounded,
            baseColor: colors.brandPrimaryDark,
            containerSize: 40,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'General budgets stay flexible',
                  style: textStyles.bodyMD.copyWith(
                    color: colors.textPrimary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'You can keep one clear limit for the whole period and add category guardrails later if you need them.',
                  style: textStyles.bodySM.copyWith(
                    color: colors.textTertiary,
                    fontWeight: FontWeight.w500,
                    height: 1.45,
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

class _CreateBudgetActionBar extends StatelessWidget {
  const _CreateBudgetActionBar({required this.viewModel});

  final CreateBudgetViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final textStyles = context.textStyles;

    return ListenableBuilder(
      listenable: Listenable.merge([
        viewModel.isSaving,
        viewModel.totalBudget,
        viewModel.selectedPeriod,
        viewModel.selectedScope,
        viewModel.categories,
      ]),
      builder: (context, _) {
        final periodLabel =
            viewModel.selectedPeriod.value == BudgetPeriod.monthly
            ? 'monthly'
            : 'weekly';
        final scopeLabel =
            viewModel.selectedScope.value == CreateBudgetScope.general
            ? 'for all spending'
            : 'for ${viewModel.selectedCount == 0 ? 'selected categories' : '${viewModel.selectedCount} categories'}';
        final amount = viewModel.totalBudget.value > 0
            ? '\$${viewModel.totalBudget.value.toStringAsFixed(0)}'
            : 'your budget';

        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Text(
                'You are creating $amount $periodLabel $scopeLabel.',
                style: textStyles.bodySM.copyWith(
                  color: colors.textSecondary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ValueListenableBuilder<bool>(
              valueListenable: viewModel.isSaving,
              builder: (context, isSaving, _) {
                return AppBottomActionButton(
                  label: viewModel.selectedPeriod.value == BudgetPeriod.monthly
                      ? 'Create Monthly Budget'
                      : 'Create Weekly Budget',
                  icon: Icons.check_circle_outline,
                  isLoading: isSaving,
                  onPressed: () {
                    viewModel.saveBudget();
                  },
                );
              },
            ),
          ],
        );
      },
    );
  }
}
