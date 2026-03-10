import 'package:expancetracker/animation/animation.dart';
import 'package:expancetracker/budgeting/models/budget_summary_model.dart';
import 'package:expancetracker/budgeting/models/budget_category_model.dart';
import 'package:expancetracker/budgeting/viewmodels/budgeting_view_model.dart';
import 'package:expancetracker/budgeting/views/widgets/budget_category_list.dart';
import 'package:expancetracker/budgeting/views/widgets/budget_period_toggle.dart';
import 'package:expancetracker/budgeting/views/widgets/budget_summary_header.dart';
import 'package:expancetracker/core/ui/constants/kit_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:expancetracker/core/ui/app_theme.dart';

/// The main Budgeting screen — composing all budgeting organisms.
/// Wired as the BUDGETS tab in the bottom navigation bar.
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

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;

    return Scaffold(
      backgroundColor: colors.bgBase,
      body: SafeArea(
        child: Stack(
          children: [
            const _BudgetingBackgroundDecor(),
            _BudgetingScrollableBody(viewModel: _viewModel),
            _BudgetingAddFab(onTap: _onAddBudgetTapped),
          ],
        ),
      ),
    );
  }

  void _onAddBudgetTapped() {
    // TODO: Navigate to add budget flow when implemented.
  }
}

class _BudgetingScrollableBody extends StatelessWidget {
  const _BudgetingScrollableBody({required this.viewModel});

  final BudgetingViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;
    final colors = context.kitColors;

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: spacing.screenHorizontalPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: spacing.screenTopPadding),
                FadeInAnimation(
                  duration: AnimationDurations.short,
                  child: _BudgetingHeroIntro(colors: colors),
                ),
                SizedBox(height: spacing.s6),
                ValueListenableBuilder(
                  valueListenable: viewModel.summary,
                  builder: (context, summary, _) =>
                      ClassicSlideWithFadeInAnimation(
                        delay: const Duration(milliseconds: 80),
                        child: BudgetSummaryHeader(summary: summary),
                      ),
                ),
                SizedBox(height: spacing.s5),
                ValueListenableBuilder(
                  valueListenable: viewModel.selectedPeriod,
                  builder: (context, period, _) =>
                      ClassicSlideWithFadeInAnimation(
                        delay: const Duration(milliseconds: 140),
                        child: _BudgetPeriodSection(
                          selectedPeriod: period,
                          onToggle: viewModel.togglePeriod,
                        ),
                      ),
                ),
                SizedBox(height: spacing.sectionGap),
                ValueListenableBuilder(
                  valueListenable: viewModel.categories,
                  builder: (context, categories, _) =>
                      ClassicSlideWithFadeInAnimation(
                        delay: const Duration(milliseconds: 220),
                        child: _BudgetCategorySection(
                          categories: categories,
                          summary: viewModel.summary,
                        ),
                      ),
                ),
                // Bottom padding so FAB doesn't overlap last card
                const SizedBox(height: 96),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _BudgetingAddFab extends StatelessWidget {
  const _BudgetingAddFab({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final shadows = context.shadows;
    final borderRadius = context.borderRadius;
    final textStyles = context.textStyles;

    return Positioned(
      bottom: 24,
      right: 20,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: borderRadius.pill,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 16),
            decoration: BoxDecoration(
              color: colors.brandPrimary,
              borderRadius: borderRadius.pill,
              boxShadow: shadows.elevation3,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.add_rounded, color: colors.textOnPrimary, size: 22),
                const SizedBox(width: 8),
                Text(
                  'New Budget',
                  style: textStyles.caption.copyWith(
                    color: colors.textOnPrimary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _BudgetingBackgroundDecor extends StatelessWidget {
  const _BudgetingBackgroundDecor();

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;

    return IgnorePointer(
      child: Stack(
        children: [
          Positioned(
            top: -80,
            right: -40,
            child: _GlowOrb(
              size: 220,
              color: colors.brandPrimary.withValues(alpha: 0.12),
            ),
          ),
          Positioned(
            top: 180,
            left: -70,
            child: _GlowOrb(
              size: 170,
              color: colors.brandPrimary.withValues(alpha: 0.06),
            ),
          ),
        ],
      ),
    );
  }
}

class _GlowOrb extends StatelessWidget {
  const _GlowOrb({required this.size, required this.color});

  final double size;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: RadialGradient(colors: [color, color.withValues(alpha: 0)]),
      ),
    );
  }
}

class _BudgetingHeroIntro extends StatelessWidget {
  const _BudgetingHeroIntro({required this.colors});

  final KitColorsExtension colors;

  @override
  Widget build(BuildContext context) {
    final textStyles = context.textStyles;
    final spacing = context.spacing;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Budgets',
                style: textStyles.displayMD.copyWith(
                  color: colors.textPrimary,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: spacing.s2),
              Text(
                'Shape your spending with the same calm, focused rhythm as the rest of the app.',
                style: textStyles.bodyMD.copyWith(
                  color: colors.textSecondary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: spacing.s4),
        Container(
          padding: EdgeInsets.symmetric(
            horizontal: spacing.s3,
            vertical: spacing.s2,
          ),
          decoration: BoxDecoration(
            color: colors.bgSurface,
            borderRadius: context.borderRadius.pill,
            border: Border.all(color: colors.borderLight),
          ),
          child: Text(
            'Live',
            style: textStyles.caption.copyWith(
              color: colors.brandPrimary,
              fontWeight: FontWeight.w800,
            ),
          ),
        ),
      ],
    );
  }
}

class _BudgetPeriodSection extends StatelessWidget {
  const _BudgetPeriodSection({
    required this.selectedPeriod,
    required this.onToggle,
  });

  final BudgetPeriod selectedPeriod;
  final ValueChanged<BudgetPeriod> onToggle;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final textStyles = context.textStyles;
    final spacing = context.spacing;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(spacing.cardPadding),
      decoration: BoxDecoration(
        color: colors.bgSurface.withValues(alpha: 0.78),
        borderRadius: context.borderRadius.xl,
        border: Border.all(color: colors.borderLight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'View cadence',
            style: textStyles.headingMD.copyWith(
              color: colors.textPrimary,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(height: spacing.s1),
          Text(
            'Switch between big-picture monthly planning and weekly check-ins.',
            style: textStyles.bodySM.copyWith(
              color: colors.textTertiary,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: spacing.s4),
          BudgetPeriodToggle(
            selectedPeriod: selectedPeriod,
            onToggle: onToggle,
          ),
        ],
      ),
    );
  }
}

class _BudgetCategorySection extends StatelessWidget {
  const _BudgetCategorySection({
    required this.categories,
    required this.summary,
  });

  final List<BudgetCategoryModel> categories;
  final ValueListenable<BudgetSummaryModel> summary;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ValueListenableBuilder<BudgetSummaryModel>(
          valueListenable: summary,
          builder: (context, value, _) {
            return _BudgetInsightBanner(summary: value, categories: categories);
          },
        ),
        SizedBox(height: context.spacing.s5),
        BudgetCategoryList(categories: categories),
      ],
    );
  }
}

class _BudgetInsightBanner extends StatelessWidget {
  const _BudgetInsightBanner({required this.summary, required this.categories});

  final BudgetSummaryModel summary;
  final List<BudgetCategoryModel> categories;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final textStyles = context.textStyles;
    final spacing = context.spacing;
    final atRiskCount = categories
        .where((category) => category.spentFraction >= 0.8)
        .length;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(spacing.cardPaddingLG),
      decoration: BoxDecoration(
        color: colors.bgSurface,
        borderRadius: context.borderRadius.xl,
        border: Border.all(color: colors.borderLight),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              color: colors.brandPrimary.withValues(alpha: 0.12),
              borderRadius: context.borderRadius.iconContainer,
            ),
            child: Icon(
              Icons.insights_rounded,
              color: colors.brandPrimary,
              size: 22,
            ),
          ),
          SizedBox(width: spacing.s4),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  atRiskCount == 0
                      ? 'You still have breathing room.'
                      : '$atRiskCount budget ${atRiskCount == 1 ? 'is' : 'are'} nearing the edge.',
                  style: textStyles.bodyMD.copyWith(
                    color: colors.textPrimary,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                SizedBox(height: spacing.s1),
                Text(
                  'Remaining overall: \$${summary.remainingAmount.toStringAsFixed(0)}.',
                  style: textStyles.bodySM.copyWith(
                    color: colors.textTertiary,
                    fontWeight: FontWeight.w600,
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
