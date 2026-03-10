import 'package:expancetracker/animation/animation.dart';
import 'package:expancetracker/core/services/transaction_service.dart';
import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:expancetracker/core/utils/locator.dart';
import 'package:expancetracker/transactions/models/category.dart';

import 'package:expancetracker/transactions/viewmodels/select_category_viewmodel.dart';
import 'package:expancetracker/transactions/views/widgets/add_custom_category_tile.dart';
import 'package:expancetracker/transactions/views/widgets/category_grid_tile.dart';
import 'package:expancetracker/transactions/views/widgets/category_search_bar.dart';
import 'package:expancetracker/transactions/views/widgets/create_custom_category_section.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Full-screen category picker.
///
/// Shows a searchable 3-column grid of preset categories, an "Add Custom"
/// tile, a custom category creation form, and a floating "Done" button.
/// Returns the selected [CategoryModel] via [Navigator.pop].
class SelectCategoryScreen extends StatefulWidget {
  const SelectCategoryScreen({super.key});

  @override
  State<SelectCategoryScreen> createState() => _SelectCategoryScreenState();
}

class _SelectCategoryScreenState extends State<SelectCategoryScreen> {
  late final SelectCategoryViewModel _viewModel;
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _customSectionKey = GlobalKey();
  final FocusNode _customNameFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _viewModel = SelectCategoryViewModel(
      transactionService: locator<TransactionService>(),
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    _scrollController.dispose();
    _customNameFocusNode.dispose();
    super.dispose();
  }

  void _scrollToCustomSection() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final renderBox =
          _customSectionKey.currentContext?.findRenderObject() as RenderBox?;
      if (renderBox == null) return;
      final offset = renderBox.localToGlobal(
        Offset.zero,
        ancestor: _scrollController.position.context.storageContext
            .findRenderObject(),
      );
      _scrollController
          .animateTo(
            _scrollController.offset + offset.dy - 100,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeOutCubic,
          )
          .then((_) {
            // Request focus on the custom category name input after scrolling
            if (mounted) {
              _customNameFocusNode.requestFocus();
            }
          });
    });
  }

  Future<void> _handleDone() async {
    final category = await _viewModel.confirmSelection();
    if (category != null && mounted) {
      Navigator.of(context).pop(category);
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final spacing = context.spacing;
    const stagger = Duration(milliseconds: 80);

    return Scaffold(
      backgroundColor: colors.bgBase,
      body: SafeArea(
        child: Stack(
          children: [
            // ── Scrollable content ───────────────────────────────────────
            SingleChildScrollView(
              controller: _scrollController,
              padding: const EdgeInsets.only(bottom: 120),
              child: Column(
                children: [
                  // App bar
                  FadeInAnimation(
                    duration: AnimationDurations.medium,
                    child: _SelectCategoryAppBar(
                      onBack: () => Navigator.of(context).pop(),
                    ),
                  ),

                  // Search bar
                  ClassicSlideWithFadeInAnimation(
                    delay: stagger,
                    child: CategorySearchBar(
                      controller: _viewModel.searchController,
                    ),
                  ),

                  SizedBox(height: spacing.s2),

                  // Category grid
                  ClassicSlideWithFadeInAnimation(
                    delay: stagger * 2,
                    child: _CategoryGridSection(
                      viewModel: _viewModel,
                      onAddCustomTap: _scrollToCustomSection,
                    ),
                  ),

                  SizedBox(height: spacing.s8),

                  // Create custom section
                  ClassicSlideWithFadeInAnimation(
                    delay: stagger * 3,
                    child: CreateCustomCategorySection(
                      key: _customSectionKey,
                      nameController: _viewModel.categoryNameController,
                      selectedIconIndex: _viewModel.selectedIconIndex,
                      onIconSelected: _viewModel.selectIcon,
                      nameFocusNode: _customNameFocusNode,
                    ),
                  ),

                  SizedBox(height: spacing.s16),
                ],
              ),
            ),

            // ── Floating Done button ─────────────────────────────────────
            _FloatingDoneButton(onPressed: _handleDone),
          ],
        ),
      ),
    );
  }
}

// ═══════════════════════════════════════════════════════════════════════════════
// SUB-WIDGETS
// ═══════════════════════════════════════════════════════════════════════════════

/// App bar with back arrow and centered title.
class _SelectCategoryAppBar extends StatelessWidget {
  const _SelectCategoryAppBar({required this.onBack});

  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final spacing = context.spacing;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: spacing.s4,
        vertical: spacing.s2,
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: onBack,
            child: SizedBox(
              width: spacing.s12,
              height: spacing.s12,
              child: Icon(Icons.arrow_back_ios, color: colors.textPrimary),
            ),
          ),
          Expanded(
            child: Text(
              'SELECT CATEGORY',
              textAlign: TextAlign.center,
              style: GoogleFonts.manrope(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: colors.textPrimary,
                letterSpacing: 2,
              ),
            ),
          ),
          SizedBox(width: spacing.s12),
        ],
      ),
    );
  }
}

class _CategoryGridSection extends StatelessWidget {
  const _CategoryGridSection({
    required this.viewModel,
    required this.onAddCustomTap,
  });

  final SelectCategoryViewModel viewModel;
  final VoidCallback onAddCustomTap;

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;

    return ValueListenableBuilder<List<CategoryModel>>(
      valueListenable: viewModel.allDbCategories,
      builder: (context, _, __) {
        return ValueListenableBuilder<String>(
          valueListenable: viewModel.searchQuery,
          builder: (context, _, __) {
            final categories = viewModel.filteredCategories;

            return ValueListenableBuilder<CategoryModel?>(
              valueListenable: viewModel.selectedCategory,
              builder: (context, selected, _) {
                final totalItems = categories.length + 1; // +1 for Add Custom

                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: spacing.s4),
                  child: GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: spacing.s3,
                      mainAxisSpacing: spacing.s3,
                      childAspectRatio: 1,
                    ),
                    itemCount: totalItems,
                    itemBuilder: (context, index) {
                      // Last item is "Add Custom"
                      if (index == categories.length) {
                        return AddCustomCategoryTile(onTap: onAddCustomTap);
                      }

                      final category = categories[index];
                      final isSelected =
                          selected != null &&
                          selected.name.toLowerCase() ==
                              category.name.toLowerCase();

                      return CategoryGridTile(
                        category: category,
                        isSelected: isSelected,
                        onTap: () => viewModel.selectCategory(category),
                      );
                    },
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}

/// Gradient-faded floating "Done" button anchored to the bottom.
class _FloatingDoneButton extends StatelessWidget {
  const _FloatingDoneButton({required this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final spacing = context.spacing;

    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: Container(
        padding: EdgeInsets.all(spacing.s6),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              colors.bgBase.withValues(alpha: 0),
              colors.bgBase,
              colors.bgBase,
            ],
            stops: const [0.0, 0.35, 1.0],
          ),
        ),
        child: GestureDetector(
          onTap: onPressed,
          child: Container(
            height: 56,
            decoration: BoxDecoration(
              color: colors.brandPrimary,
              borderRadius: context.borderRadius.lg,
              boxShadow: [
                BoxShadow(
                  color: colors.brandPrimary.withValues(alpha: 0.2),
                  blurRadius: 16,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Done',
                  style: GoogleFonts.manrope(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: colors.textOnPrimary,
                  ),
                ),
                SizedBox(width: spacing.s2),
                Icon(Icons.check_circle, color: colors.textOnPrimary),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
