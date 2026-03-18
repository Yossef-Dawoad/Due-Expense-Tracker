import 'package:expancetracker/budgeting/models/create_budget_scope.dart';
import 'package:expancetracker/core/common/widgets/colored_feature_icon.dart';
import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:flutter/material.dart';

class CreateBudgetScopeSelector extends StatelessWidget {
  const CreateBudgetScopeSelector({
    super.key,
    required this.selectedScope,
    required this.onChanged,
  });

  final CreateBudgetScope selectedScope;
  final ValueChanged<CreateBudgetScope> onChanged;

  @override
  Widget build(BuildContext context) {
    final spacing = context.spacing;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isCompact = constraints.maxWidth < 420;
        final options = CreateBudgetScope.values
            .map(
              (scope) => _CreateBudgetScopeOption(
                scope: scope,
                isSelected: scope == selectedScope,
                onTap: () => onChanged(scope),
              ),
            )
            .toList(growable: false);

        if (isCompact) {
          return Column(
            children: [
              for (var index = 0; index < options.length; index++) ...[
                options[index],
                if (index != options.length - 1) SizedBox(height: spacing.s3),
              ],
            ],
          );
        }

        return Row(
          children: [
            Expanded(child: options.first),
            SizedBox(width: spacing.s3),
            Expanded(child: options.last),
          ],
        );
      },
    );
  }
}

class _CreateBudgetScopeOption extends StatelessWidget {
  const _CreateBudgetScopeOption({
    required this.scope,
    required this.isSelected,
    required this.onTap,
  });

  final CreateBudgetScope scope;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final textStyles = context.textStyles;
    final accentColor = isSelected ? colors.brandPrimary : colors.textSecondary;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: context.borderRadius.xl,
        child: AnimatedContainer(
          duration: context.durations.duration200,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isSelected
                ? colors.brandPrimary.withValues(alpha: 0.08)
                : colors.bgBase,
            borderRadius: context.borderRadius.xl,
            border: Border.all(
              color: isSelected
                  ? colors.brandPrimary.withValues(alpha: 0.24)
                  : colors.borderLight,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ColoredFeatureIcon(
                    icon: scope.icon,
                    baseColor: accentColor,
                    containerSize: 40,
                  ),
                  const Spacer(),
                  Icon(
                    isSelected
                        ? Icons.check_circle_rounded
                        : Icons.radio_button_unchecked_rounded,
                    color: accentColor,
                    size: 20,
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                scope.title,
                style: textStyles.bodyMD.copyWith(
                  color: colors.textPrimary,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                scope.description,
                style: textStyles.bodySM.copyWith(
                  color: colors.textTertiary,
                  fontWeight: FontWeight.w500,
                  height: 1.4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
