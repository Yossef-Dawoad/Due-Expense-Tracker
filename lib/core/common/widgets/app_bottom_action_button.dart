import 'package:expancetracker/core/common/widgets/app_surface_card.dart';
import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:flutter/material.dart';

class AppBottomActionButton extends StatelessWidget {
  const AppBottomActionButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.isLoading = false,
    this.height = 56,
    this.backgroundColor,
    this.foregroundColor,
    this.shadowColor,
  });

  final String label;
  final VoidCallback onPressed;
  final IconData? icon;
  final bool isLoading;
  final double height;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? shadowColor;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final textColor = foregroundColor ?? colors.textOnPrimary;
    final fillColor = backgroundColor ?? colors.brandPrimary;

    return AppSurfaceCard(
      padding: EdgeInsets.zero,
      borderColor: Colors.transparent,
      backgroundColor: fillColor,
      borderRadius: context.borderRadius.button,
      boxShadow: [
        BoxShadow(
          color: (shadowColor ?? fillColor).withValues(alpha: 0.28),
          blurRadius: 18,
          offset: const Offset(0, 8),
        ),
      ],
      child: SizedBox(
        height: height,
        width: double.infinity,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: isLoading ? null : onPressed,
            borderRadius: context.borderRadius.button,
            child: Center(
              child: isLoading
                  ? SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        color: textColor,
                        strokeWidth: 2,
                      ),
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        if (icon != null) ...[
                          Icon(icon, color: textColor, size: 22),
                          const SizedBox(width: 8),
                        ],
                        Text(
                          label,
                          style: context.textStyles.cta.copyWith(
                            color: textColor,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
