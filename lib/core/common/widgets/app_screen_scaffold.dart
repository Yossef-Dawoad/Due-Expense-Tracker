import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:flutter/material.dart';

class AppScreenScaffold extends StatelessWidget {
  const AppScreenScaffold({
    super.key,
    required this.child,
    this.backgroundColor,
    this.useSafeArea = true,
    this.resizeToAvoidBottomInset,
  });

  final Widget child;
  final Color? backgroundColor;
  final bool useSafeArea;
  final bool? resizeToAvoidBottomInset;

  @override
  Widget build(BuildContext context) {
    final body = useSafeArea ? SafeArea(child: child) : child;

    return Scaffold(
      backgroundColor: backgroundColor ?? context.kitColors.bgBase,
      resizeToAvoidBottomInset: resizeToAvoidBottomInset,
      body: body,
    );
  }
}
