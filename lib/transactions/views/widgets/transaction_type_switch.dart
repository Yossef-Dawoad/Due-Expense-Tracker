import 'package:expancetracker/animation/animation.dart';
import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:expancetracker/transactions/models/transaction.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Segmented control for switching between Expense and Income transaction types.
///
/// Uses a [Stack] with an [AnimatedPositioned] sliding pill indicator so the
/// selected-tab background physically slides from one option to the other
/// (iOS-style), instead of each segment independently fading its own
/// background in/out which reads as a jarring double-blink.
class TransactionTypeSwitch extends StatelessWidget {
  const TransactionTypeSwitch({
    super.key,
    required this.selectedType,
    required this.onChanged,
  });

  final ValueListenable<TransactionType> selectedType;
  final ValueChanged<TransactionType> onChanged;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 48,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: colors.brandPrimary.withValues(alpha: 0.08),
          borderRadius: BorderRadius.circular(12),
        ),
        child: ValueListenableBuilder<TransactionType>(
          valueListenable: selectedType,
          builder: (context, type, _) {
            final isExpense = type == TransactionType.expense;

            return LayoutBuilder(
              builder: (context, constraints) {
                // The pill occupies exactly half the available width.
                final pillWidth = constraints.maxWidth / 2;
                // Offset 0 → left pill (Expense), pillWidth → right pill (Income).
                final pillLeft = isExpense ? 0.0 : pillWidth;

                return Stack(
                  children: [
                    // ── Sliding pill indicator ───────────────────────────────
                    AnimatedPositioned(
                      duration: const Duration(milliseconds: 280),
                      curve: AnimationCurves.decelerate,
                      left: pillLeft,
                      top: 0,
                      bottom: 0,
                      width: pillWidth,
                      child: Container(
                        decoration: BoxDecoration(
                          color: colors.bgSurface,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.07),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // ── Tap targets (above the pill) ─────────────────────────
                    Row(
                      children: [
                        _TransactionTypeTab(
                          label: 'Expense',
                          isSelected: isExpense,
                          onTap: () => onChanged(TransactionType.expense),
                        ),
                        _TransactionTypeTab(
                          label: 'Income',
                          isSelected: !isExpense,
                          onTap: () => onChanged(TransactionType.income),
                        ),
                      ],
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }
}

/// A single tap target inside [TransactionTypeSwitch].
///
/// Wrapped in [ScaleFeedback] for tactile press response.
/// Text color cross-fades via [AnimatedDefaultTextStyle].
class _TransactionTypeTab extends StatelessWidget {
  const _TransactionTypeTab({
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;

    return Expanded(
      child: ScaleFeedback(
        onTap: onTap,
        minScale: 0.96,
        duration: AnimationDurations.rapid,
        child: Container(
          // Transparent hit-test area — actual background is the sliding pill.
          color: Colors.transparent,
          alignment: Alignment.center,
          child: AnimatedDefaultTextStyle(
            duration: const Duration(milliseconds: 220),
            curve: AnimationCurves.standard,
            style: GoogleFonts.manrope(
              color: isSelected ? colors.textPrimary : colors.textTertiary,
              fontSize: 14,
              fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
            ),
            child: Text(label),
          ),
        ),
      ),
    );
  }
}
