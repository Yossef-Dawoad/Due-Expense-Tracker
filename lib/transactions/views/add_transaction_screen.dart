import 'package:expancetracker/animation/animation.dart';
import 'package:expancetracker/core/utils/locator.dart';
import 'package:expancetracker/core/services/transaction_service.dart';
import 'package:expancetracker/core/services/wallet_service.dart';
import 'package:expancetracker/core/common/widgets/app_section_header.dart';
import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:expancetracker/core/utils/navigation/router_service.dart';
import 'package:expancetracker/core/utils/navigation/routes.dart';
import 'package:expancetracker/transactions/models/category.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../viewmodels/add_transaction_viewmodel.dart';
import 'package:expancetracker/core/utils/internal_notification/notify_service.dart';
import 'widgets/add_transaction_app_bar.dart';
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
    final colors = context.kitColors;
    const staggerStep = Duration(milliseconds: 80);

    return Scaffold(
      backgroundColor: colors.bgBase,
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.only(bottom: 100),
              child: Column(
                children: [
                  // App Bar
                  FadeInAnimation(
                    duration: AnimationDurations.medium,
                    child: AddTransactionAppBar(
                      onClose: _viewModel.navigateToHome,
                      onReset: _viewModel.reset,
                    ),
                  ),

                  // Transaction Type Switch
                  ClassicSlideWithFadeInAnimation(
                    delay: staggerStep,
                    child: TransactionTypeSwitch(
                      selectedType: _viewModel.transactionType,
                      onChanged: _viewModel.setTransactionType,
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Amount Input
                  ClassicSlideWithFadeInAnimation(
                    delay: staggerStep * 2,
                    child: TransactionAmountInput(
                      amountString: _viewModel.amountString,
                      onAmountChanged: _viewModel.setAmount,
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Category Selection
                  ClassicSlideWithFadeInAnimation(
                    delay: staggerStep * 3,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(''),
                          AppSectionHeader(
                            title: 'Category',
                            titleStyle: GoogleFonts.manrope(
                              color: colors.textPrimary,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            spacing: 0,
                          ),
                          const SizedBox(height: 16),
                          TransactionCategoryGrid(
                            selectedCategory: _viewModel.selectedCategory,
                            persistedCategories: _viewModel.categories,
                            onPresetSelected:
                                _viewModel.selectOrInsertPresetCategory,
                            onOtherSelected: () async {
                              final result = await context.push<CategoryModel>(
                                Routes.addCategory,
                              );
                              if (result != null) {
                                _viewModel.setCategory(result);
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 32),

                  // Details (Date + Tags + Notes)
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

            // Floating Save Button — hidden when keyboard is open
            Positioned(
              left: 16,
              right: 16,
              bottom: 24,
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: MediaQuery.of(context).viewInsets.bottom > 0
                    ? const SizedBox.shrink()
                    : SlideInAnimation(
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
            ),
          ],
        ),
      ),
    );
  }
}
