import 'package:expancetracker/animation/animation.dart';
import 'package:expancetracker/core/common/widgets/app_content_section.dart';
import 'package:expancetracker/core/common/widgets/app_flow_header_bar.dart';
import 'package:expancetracker/core/common/widgets/app_screen_scaffold.dart';
import 'package:expancetracker/core/utils/locator.dart';
import 'package:expancetracker/core/common/widgets/bottom_scrim_action_bar.dart';
import 'package:expancetracker/core/services/transaction_service.dart';
import 'package:expancetracker/core/services/wallet_service.dart';
import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:expancetracker/core/utils/navigation/router_service.dart';
import 'package:expancetracker/core/utils/navigation/routes.dart';
import 'package:expancetracker/transactions/models/category.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../viewmodels/add_transaction_viewmodel.dart';
import 'package:expancetracker/core/utils/internal_notification/notify_service.dart';
import 'widgets/transaction_type_switch.dart';
import 'widgets/transaction_amount_input.dart';
import 'widgets/transaction_category_grid.dart';
import 'widgets/transaction_details_section.dart';
import 'widgets/transaction_save_button.dart';

class AddTransactionScreen extends StatefulWidget {
  const AddTransactionScreen({super.key});

  @override
  State<AddTransactionScreen> createState() => _AddTransactionScreenState();
}

class _AddTransactionScreenState extends State<AddTransactionScreen> {
  late final AddTransactionViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = AddTransactionViewModel(
      walletService: locator<WalletService>(),
      transactionService: locator<TransactionService>(),
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
    const staggerStep = Duration(milliseconds: 80);

    return AppScreenScaffold(
      child: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 100),
            child: Column(
              children: [
                FadeInAnimation(
                  duration: AnimationDurations.medium,
                  child: AppFlowHeaderBar(
                    title: 'Add New Transaction',
                    leadingIcon: Icons.close,
                    leadingLabel: 'Close add transaction',
                    onLeadingPressed: _viewModel.navigateToHome,
                    trailingLabel: 'Reset',
                    onTrailingPressed: _viewModel.reset,
                  ),
                ),
                ClassicSlideWithFadeInAnimation(
                  delay: staggerStep,
                  child: TransactionTypeSwitch(
                    selectedType: _viewModel.transactionType,
                    onChanged: _viewModel.setTransactionType,
                  ),
                ),
                const SizedBox(height: 32),
                ClassicSlideWithFadeInAnimation(
                  delay: staggerStep * 2,
                  child: TransactionAmountInput(
                    amountString: _viewModel.amountString,
                    onAmountChanged: _viewModel.setAmount,
                  ),
                ),
                const SizedBox(height: 32),
                ClassicSlideWithFadeInAnimation(
                  delay: staggerStep * 3,
                  child: AppContentSection(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    title: 'Category',
                    titleStyle: GoogleFonts.manrope(
                      color: context.kitColors.textPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    headerSpacing: 16,
                    child: TransactionCategoryGrid(
                      selectedCategory: _viewModel.selectedCategory,
                      persistedCategories: _viewModel.categories,
                      onPresetSelected: _viewModel.selectOrInsertPresetCategory,
                      onOtherSelected: () async {
                        final result = await context.push<CategoryModel>(
                          Routes.addCategory,
                        );
                        if (result != null) {
                          _viewModel.setCategory(result);
                        }
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                ClassicSlideWithFadeInAnimation(
                  delay: staggerStep * 4,
                  child: TransactionDetailsSection(
                    date: _viewModel.date,
                    onDateChanged: _viewModel.setDate,
                    notesController: _viewModel.notesController,
                    pendingTagNames: _viewModel.pendingTagNames,
                    allTags: _viewModel.allTags,
                    onAddTag: _viewModel.addTagName,
                    onRemoveTag: _viewModel.removeTagName,
                  ),
                ),
                const SizedBox(height: 100),
              ],
            ),
          ),
          BottomScrimActionBar(
            child: SlideInAnimation(
              beginOffset: const Offset(0, 1.0),
              delay: staggerStep * 5,
              duration: AnimationDurations.long,
              curve: AnimationCurves.decelerate,
              child: TransactionSaveButton(
                isSaving: _viewModel.isSaving,
                onPressed: () async {
                  final success = await _viewModel.saveTransaction();
                  if (success && context.mounted) {
                    _viewModel.navigateToHome();
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
