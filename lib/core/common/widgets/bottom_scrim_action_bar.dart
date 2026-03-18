import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:flutter/material.dart';

class BottomScrimActionBar extends StatelessWidget {
  const BottomScrimActionBar({
    super.key,
    required this.child,
    this.isVisible = true,
    this.hideWhenKeyboardVisible = true,
    this.horizontalPadding = 16,
    this.topPadding = 24,
    this.bottomPadding = 24,
  });

  final Widget child;
  final bool isVisible;
  final bool hideWhenKeyboardVisible;
  final double horizontalPadding;
  final double topPadding;
  final double bottomPadding;

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    final keyboardVisible = MediaQuery.viewInsetsOf(context).bottom > 0;
    final safeBottom = MediaQuery.paddingOf(context).bottom;
    final shouldShow =
        isVisible && (!hideWhenKeyboardVisible || !keyboardVisible);

    return Align(
      alignment: Alignment.bottomCenter,
      child: IgnorePointer(
        ignoring: !shouldShow,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: !shouldShow
              ? const SizedBox.shrink()
              : Container(
                  key: const ValueKey('bottom-scrim-action-bar'),
                  width: double.infinity,
                  padding: EdgeInsets.fromLTRB(
                    horizontalPadding,
                    topPadding,
                    horizontalPadding,
                    bottomPadding + safeBottom,
                  ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        colors.bgBase.withValues(alpha: 0.0),
                        colors.bgBase.withValues(alpha: 0.9),
                        colors.bgBase,
                      ],
                    ),
                  ),
                  child: child,
                ),
        ),
      ),
    );
  }
}
