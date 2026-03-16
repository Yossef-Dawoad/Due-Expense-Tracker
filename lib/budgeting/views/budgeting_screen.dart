import 'package:expancetracker/animation/animation.dart';
import 'package:expancetracker/budgeting/viewmodels/budgeting_view_model.dart';
import 'package:expancetracker/budgeting/views/widgets/budget_category_list.dart';
import 'package:expancetracker/budgeting/views/widgets/budget_overview_card.dart';
import 'package:expancetracker/budgeting/views/widgets/budget_overview_header.dart';
import 'package:expancetracker/budgeting/views/widgets/budget_status_alert.dart';

import 'package:expancetracker/core/ui/app_theme.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.kitColors.bgBase,
      body: SafeArea(child: _BudgetingScrollableBody(viewModel: _viewModel)),
    );
  }
}

class _BudgetingScrollableBody extends StatelessWidget {
  const _BudgetingScrollableBody({required this.viewModel});

  final BudgetingViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    // We can infer screen padding to be 20 from previous layout
    const screenHorizontalPadding = 20.0;
    const screenTopPadding = 16.0;

    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: const EdgeInsets.symmetric(
            horizontal: screenHorizontalPadding,
          ),
          sliver: SliverList(
            delegate: SliverChildListDelegate([
              const SizedBox(height: screenTopPadding),
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
              ValueListenableBuilder(
                valueListenable: viewModel.summary,
                builder: (context, summary, _) =>
                    ClassicSlideWithFadeInAnimation(
                      delay: const Duration(milliseconds: 80),
                      child: BudgetOverviewCard(summary: summary),
                    ),
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
                builder: (context, categories, _) =>
                    ClassicSlideWithFadeInAnimation(
                      delay: const Duration(milliseconds: 220),
                      child: BudgetCategoryList(categories: categories),
                    ),
              ),
              const SizedBox(height: 120),
            ]),
          ),
        ),
      ],
    );
  }
}
