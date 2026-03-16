import 'package:expancetracker/animation/animation.dart';
import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:expancetracker/transactions/models/category.dart';
import 'package:expancetracker/transactions/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

/// Recent activity section displayed as individually bordered cards.
/// Supports multi-select via long-press, with a premium bottom-sheet
/// confirmation for bulk deletion.
class RecentActivitySection extends StatefulWidget {
  const RecentActivitySection({
    super.key,
    required this.transactions,
    required this.categories,
    required this.onDeleteTransactions,
    this.animationDelay = Duration.zero,
  });

  final List<Transaction> transactions;
  final List<CategoryModel> categories;

  /// Callback invoked with one or more transaction IDs after user confirms.
  final Future<void> Function(List<String> transactionIds) onDeleteTransactions;

  /// Delay before starting the staggered entrance animation.
  final Duration animationDelay;

  @override
  State<RecentActivitySection> createState() => _RecentActivitySectionState();
}

class _RecentActivitySectionState extends State<RecentActivitySection> {
  final Set<String> _selectedIds = {};

  bool get _isSelectionMode => _selectedIds.isNotEmpty;

  void _toggleSelection(String id) {
    setState(() {
      if (_selectedIds.contains(id)) {
        _selectedIds.remove(id);
      } else {
        _selectedIds.add(id);
      }
    });
  }

  void _enterSelectionMode(String id) {
    setState(() {
      _selectedIds.add(id);
    });
  }

  void _clearSelection() {
    setState(() {
      _selectedIds.clear();
    });
  }

  void _selectAll() {
    setState(() {
      _selectedIds.addAll(widget.transactions.map((tx) => tx.id));
    });
  }

  Future<void> _confirmAndDelete() async {
    if (_selectedIds.isEmpty) return;

    final confirmed = await _showDeleteBottomSheet(
      context,
      _selectedIds.length,
    );
    if (confirmed == true) {
      await widget.onDeleteTransactions(_selectedIds.toList());
      _clearSelection();
    }
  }

  Future<bool?> _showDeleteBottomSheet(BuildContext context, int count) {
    final colors = context.kitColors;
    final radii = context.borderRadius;

    return showModalBottomSheet<bool>(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (sheetContext) {
        return Container(
          margin: const EdgeInsets.fromLTRB(16, 0, 16, 32),
          decoration: BoxDecoration(
            color: colors.bgSurface,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 28, 24, 24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // ── Warning icon ──
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: colors.semanticNegative.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.delete_outline_rounded,
                    color: colors.semanticNegative,
                    size: 28,
                  ),
                ),
                const SizedBox(height: 20),

                // ── Title ──
                Text(
                  count == 1
                      ? 'Delete Transaction?'
                      : 'Delete $count Transactions?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                    color: colors.textPrimary,
                    letterSpacing: -0.3,
                  ),
                ),
                const SizedBox(height: 8),

                // ── Description ──
                Text(
                  count == 1
                      ? 'This transaction will be permanently removed and cannot be recovered.'
                      : 'These transactions will be permanently removed and cannot be recovered.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: colors.textTertiary,
                  ),
                ),
                const SizedBox(height: 28),

                // ── Delete button ──
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(sheetContext).pop(true),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colors.semanticNegative,
                      foregroundColor: Colors.white,
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: radii.card),
                    ),
                    child: Text(
                      count == 1 ? 'Delete' : 'Delete All ($count)',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // ── Cancel button ──
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: OutlinedButton(
                    onPressed: () => Navigator.of(sheetContext).pop(false),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: colors.textPrimary,
                      side: BorderSide(color: colors.borderLight),
                      elevation: 0,
                      shape: RoundedRectangleBorder(borderRadius: radii.card),
                    ),
                    child: const Text(
                      'Cancel',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.transactions.isEmpty) {
      return const SizedBox.shrink();
    }

    final items = widget.transactions.map((tx) {
      final category = widget.categories.firstWhere(
        (c) => c.id == tx.categoryId,
        orElse: () => CategoryModel(
          id: 'unknown',
          name: 'Unknown',
          icon: '❓',
          color: '0xFF9E9E9E',
          userId: '',
        ),
      );
      return Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: _RecentActivityItem(
          transaction: tx,
          category: category,
          isSelected: _selectedIds.contains(tx.id),
          isSelectionMode: _isSelectionMode,
          onTap: () {
            if (_isSelectionMode) {
              _toggleSelection(tx.id);
            }
          },
          onLongPress: () {
            if (!_isSelectionMode) {
              _enterSelectionMode(tx.id);
            }
          },
        ),
      );
    }).toList();

    return Column(
      children: [
        // ── Selection action bar ──
        _SelectionActionBar(
          isVisible: _isSelectionMode,
          selectedCount: _selectedIds.length,
          totalCount: widget.transactions.length,
          onSelectAll: _selectAll,
          onClearSelection: _clearSelection,
          onDelete: _confirmAndDelete,
        ),
        // ── Transaction list ──
        StaggeredListAnimation(
          delay: widget.animationDelay,
          staggerDuration: const Duration(milliseconds: 50),
          itemDuration: AnimationDurations.medium,
          children: items,
        ),
      ],
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Selection Action Bar
// ─────────────────────────────────────────────────────────────────────────────

class _SelectionActionBar extends StatelessWidget {
  const _SelectionActionBar({
    required this.isVisible,
    required this.selectedCount,
    required this.totalCount,
    required this.onSelectAll,
    required this.onClearSelection,
    required this.onDelete,
  });

  final bool isVisible;
  final int selectedCount;
  final int totalCount;
  final VoidCallback onSelectAll;
  final VoidCallback onClearSelection;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;

    return AnimatedSize(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
      child: isVisible
          ? Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Row(
                children: [
                  // Selected count
                  Text(
                    '$selectedCount selected',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: colors.textPrimary,
                    ),
                  ),
                  const Spacer(),

                  // Select all / Deselect all
                  GestureDetector(
                    onTap: selectedCount == totalCount
                        ? onClearSelection
                        : onSelectAll,
                    child: Text(
                      selectedCount == totalCount
                          ? 'Deselect All'
                          : 'Select All',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: colors.brandPrimary,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),

                  // Delete button
                  GestureDetector(
                    onTap: onDelete,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: colors.semanticNegative,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.delete_outline_rounded,
                            color: Colors.white,
                            size: 16,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            'Delete',
                            style: const TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          : const SizedBox.shrink(),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Single Activity Item
// ─────────────────────────────────────────────────────────────────────────────

class _RecentActivityItem extends StatelessWidget {
  const _RecentActivityItem({
    required this.transaction,
    required this.category,
    required this.isSelected,
    required this.isSelectionMode,
    required this.onTap,
    required this.onLongPress,
  });

  final Transaction transaction;
  final CategoryModel category;
  final bool isSelected;
  final bool isSelectionMode;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final isExpense = transaction.type == TransactionType.expense;
    final formattedTime = DateFormat('h:mm a').format(transaction.date);

    // Fallback if note is empty, use category name, but mock specifies note for title
    final title = (transaction.note?.isNotEmpty == true)
        ? transaction.note!
        : category.name;

    // HTML: p-4 border-b border-white/50 active:bg-black/5
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        decoration: BoxDecoration(
          color: isSelected
              ? colors.semanticNegative.withValues(alpha: 0.04)
              : Colors.transparent, // Solid background
          borderRadius: context.borderRadius.xxl, // Card-like rounding
          border: Border.all(
            color: isSelected
                ? colors.semanticNegative
                : colors.borderDefault, // Thin line border
            width: 1.0,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 18,
          ), // p-4
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Selection indicator / Category icon ──
              _AnimatedSelectionIcon(
                isSelected: isSelected,
                isSelectionMode: isSelectionMode,
                category: category,
                isExpense: isExpense, // Pass expense to color the icon
              ),
              const SizedBox(width: 12), // gap-3
              // ── Text content ──
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // HTML: text-[15px] font-black text-text-main mb-0.5
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w900, // black
                        color: colors.textPrimary,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 2), // mb-0.5
                    // HTML: text-[12px] font-bold text-text-muted
                    Text(
                      formattedTime,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w700, // bold
                        color: colors.textTertiary,
                      ),
                    ),
                  ],
                ),
              ),

              // ── Right side: Amount and Category badge ──
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  // HTML: text-[15px] font-black text-rose-600 mb-0.5
                  Text(
                    '${isExpense ? "-" : "+"}'
                    r'$'
                    '${transaction.amount.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w900, // black
                      color: isExpense
                          ? const Color(0xFFE11D48)
                          : const Color(
                              0xFF059669,
                            ), // text-rose-600 or text-emerald-600 for income
                    ),
                  ),
                  const SizedBox(height: 4), // mb-0.5 approx visual height
                  // HTML: bg-surface px-2 py-0.5 rounded text-[10px] font-extrabold text-text-muted inline-block
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: colors.bgSurface,
                      borderRadius: BorderRadius.circular(4), // rounded
                    ),
                    child: Text(
                      category.name,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w800, // extrabold
                        color: colors.textTertiary,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────────────────────────────────────
// Animated Selection Icon — crossfades between category icon & checkmark
// ─────────────────────────────────────────────────────────────────────────────

class _AnimatedSelectionIcon extends StatelessWidget {
  const _AnimatedSelectionIcon({
    required this.isSelected,
    required this.isSelectionMode,
    required this.category,
    required this.isExpense,
  });

  final bool isSelected;
  final bool isSelectionMode;
  final CategoryModel category;
  final bool isExpense;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;

    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 250),
      switchInCurve: Curves.easeOutBack,
      switchOutCurve: Curves.easeIn,
      child: isSelected
          ? Container(
              key: const ValueKey('selected'),
              width: 48, // size-11
              height: 48,
              decoration: BoxDecoration(
                color: colors.semanticNegative,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check_rounded,
                color: Colors.white,
                size: 24,
              ),
            )
          : Container(
              key: const ValueKey('unselected'),
              // HTML: size-11 rounded-full bg-surface border border-border-light shadow-soft flex items-center justify-center text-rose-600
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                // color: colors.bgSurface,
                shape: BoxShape.circle, // rounded-full
                border: Border.all(color: colors.borderDefault),
                // boxShadow: [
                //   BoxShadow(
                //     color: Colors.black.withValues(alpha: 0.05), // shadow-soft
                //     blurRadius: 4,
                //     offset: const Offset(0, 1),
                //   ),
                // ],
              ),
              child: Center(
                child: _buildIconWidget(
                  category.icon,
                  isExpense ? const Color(0xFFE11D48) : const Color(0xFF059669),
                ),
              ),
            ),
    );
  }

  Widget _buildIconWidget(String iconValue, Color? color) {
    final codePoint = int.tryParse(iconValue);
    if (codePoint != null) {
      return Icon(
        IconData(codePoint, fontFamily: 'MaterialIcons'),
        size: 22,
        color: color,
      ); // text-[22px]
    }
    return Text(
      iconValue,
      style: const TextStyle(fontSize: 22),
    ); // Handle emoji
  }
}
