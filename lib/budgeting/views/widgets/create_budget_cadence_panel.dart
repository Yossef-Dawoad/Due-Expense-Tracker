import 'package:expancetracker/budgeting/models/budget_period.dart';
import 'package:expancetracker/budgeting/models/create_budget_scope.dart';
import 'package:expancetracker/budgeting/views/widgets/budget_period_toggle.dart';
import 'package:expancetracker/core/common/widgets/app_pill_badge.dart';
import 'package:expancetracker/core/common/widgets/app_surface_card.dart';
import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CreateBudgetCadencePanel extends StatelessWidget {
  const CreateBudgetCadencePanel({
    super.key,
    required this.amountController,
    required this.selectedPeriod,
    required this.selectedScope,
    required this.budgetName,
    required this.onPeriodChanged,
    this.onAmountFocusChanged,
  });

  final TextEditingController amountController;
  final BudgetPeriod selectedPeriod;
  final CreateBudgetScope selectedScope;
  final String budgetName;
  final ValueChanged<BudgetPeriod> onPeriodChanged;
  final ValueChanged<bool>? onAmountFocusChanged;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final spacing = context.spacing;
    final textStyles = context.textStyles;
    final periodLabel = selectedPeriod == BudgetPeriod.monthly
        ? 'MONTHLY'
        : 'WEEKLY';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BudgetPeriodToggle(
          selectedPeriod: selectedPeriod,
          onToggle: onPeriodChanged,
        ),
        SizedBox(height: spacing.s5),
        AppSurfaceCard(
          padding: EdgeInsets.all(spacing.cardPaddingLG),
          backgroundColor: colors.bgBase,
          borderColor: colors.brandPrimary.withValues(alpha: 0.14),
          borderRadius: context.borderRadius.xl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppPillBadge(
                label: budgetName,
                backgroundColor: colors.brandPrimary.withValues(alpha: 0.1),
                textColor: colors.brandPrimaryDark,
                borderColor: colors.brandPrimary.withValues(alpha: 0.18),
              ),
              SizedBox(height: spacing.s4),
              Text(
                'TOTAL $periodLabel LIMIT',
                style: textStyles.labelSM.copyWith(
                  color: colors.textTertiary,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.1,
                ),
              ),
              SizedBox(height: spacing.s2),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 4),
                    child: Text(
                      r'$',
                      style: textStyles.displayMD.copyWith(
                        color: colors.brandPrimaryDark,
                        fontSize: 28,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  SizedBox(width: spacing.s2),
                  Expanded(
                    child: _CreateBudgetHeadlineAmountField(
                      controller: amountController,
                      style: textStyles.displayXL.copyWith(
                        color: colors.textPrimary,
                        fontSize: 44,
                        fontWeight: FontWeight.w900,
                        height: 1.0,
                      ),
                      cursorColor: colors.brandPrimaryDark,
                      onFocusChanged: onAmountFocusChanged,
                    ),
                  ),
                ],
              ),
              SizedBox(height: spacing.s2),
              Text(
                selectedScope == CreateBudgetScope.general
                    ? 'This gives all of your spending one clear ceiling for the period.'
                    : 'This becomes the master amount you can split across the categories below.',
                style: textStyles.bodySM.copyWith(
                  color: colors.textSecondary,
                  fontWeight: FontWeight.w500,
                  height: 1.45,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _CreateBudgetHeadlineAmountField extends StatefulWidget {
  const _CreateBudgetHeadlineAmountField({
    required this.controller,
    required this.style,
    required this.cursorColor,
    this.onFocusChanged,
  });

  final TextEditingController controller;
  final TextStyle style;
  final Color cursorColor;
  final ValueChanged<bool>? onFocusChanged;

  @override
  State<_CreateBudgetHeadlineAmountField> createState() =>
      _CreateBudgetHeadlineAmountFieldState();
}

class _CreateBudgetHeadlineAmountFieldState
    extends State<_CreateBudgetHeadlineAmountField> {
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _focusNode.dispose();
    super.dispose();
  }

  void _handleFocusChange() {
    if (_focusNode.hasFocus) {
      _moveCursorToEnd();
    }
    widget.onFocusChanged?.call(_focusNode.hasFocus);
  }

  void _moveCursorToEnd() {
    final text = widget.controller.text;
    widget.controller.selection = TextSelection.collapsed(offset: text.length);
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      focusNode: _focusNode,
      showCursor: true,
      cursorColor: widget.cursorColor,
      cursorWidth: 3,
      cursorRadius: const Radius.circular(2),
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))],
      style: widget.style,
      onTap: _moveCursorToEnd,
      decoration: const InputDecoration(
        isDense: true,
        filled: false,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        contentPadding: EdgeInsets.zero,
        hintText: '0',
      ),
    );
  }
}
