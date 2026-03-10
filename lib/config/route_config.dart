import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:expancetracker/core/utils/navigation/routes.dart';
import 'package:expancetracker/onboarding/views/onboarding_screen.dart';
import 'package:expancetracker/navigation/navigation_menu.dart';
import 'package:expancetracker/wallet/wallet_details/views/wallet_details_screen.dart';
import 'package:expancetracker/transactions/views/add_transaction_screen.dart';
import 'package:expancetracker/transactions/views/select_category_screen.dart';
import 'package:expancetracker/not_found/not_found_view.dart';

final routes = [
  GoRoute(
    path: Routes.onBoarding,
    pageBuilder: (context, state) =>
        _buildPage(const OnBoardingScreen(), state),
  ),
  GoRoute(
    path: Routes.home,
    pageBuilder: (context, state) => CustomTransitionPage(
      key: state.pageKey,
      child: const NavigationMenu(),
      transitionDuration: const Duration(milliseconds: 500),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return FadeTransition(
          opacity: CurveTween(curve: Curves.easeInOutCubic).animate(animation),
          child: child,
        );
      },
    ),
  ),
  GoRoute(
    path: Routes.walletDetails,
    pageBuilder: (context, state) =>
        _buildPage(const WalletDetailsScreen(), state),
  ),
  GoRoute(
    path: Routes.addTransaction,
    pageBuilder: (context, state) => CustomTransitionPage(
      key: state.pageKey,
      child: const AddTransactionScreen(),
      transitionDuration: const Duration(milliseconds: 350),
      reverseTransitionDuration: const Duration(milliseconds: 300),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Slide up on entry, slide down on exit — modal sheet feel
        final slideAnimation =
            Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeOutCubic,
                reverseCurve: Curves.easeInCubic,
              ),
            );
        // Gentle fade accompanies the slide
        final fadeAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOut,
        );
        return SlideTransition(
          position: slideAnimation,
          child: FadeTransition(opacity: fadeAnimation, child: child),
        );
      },
    ),
  ),
  GoRoute(
    path: Routes.addCategory,
    pageBuilder: (context, state) => CustomTransitionPage(
      key: state.pageKey,
      child: const SelectCategoryScreen(),
      transitionDuration: const Duration(milliseconds: 400),
      reverseTransitionDuration: const Duration(milliseconds: 350),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // Smooth slide-up with subtle scale + fade — premium feel
        final slideAnimation =
            Tween<Offset>(
              begin: const Offset(0, 0.15),
              end: Offset.zero,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.easeOutCubic,
                reverseCurve: Curves.easeInCubic,
              ),
            );
        final scaleAnimation = Tween<double>(begin: 0.96, end: 1.0).animate(
          CurvedAnimation(parent: animation, curve: Curves.easeOutCubic),
        );
        final fadeAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeOut,
        );
        return SlideTransition(
          position: slideAnimation,
          child: FadeTransition(
            opacity: fadeAnimation,
            child: ScaleTransition(scale: scaleAnimation, child: child),
          ),
        );
      },
    ),
  ),
  GoRoute(
    path: Routes.notFound,
    pageBuilder: (context, state) => _buildPage(const NotFoundView(), state),
  ),
];

Page<void> _buildPage(Widget child, GoRouterState state) {
  if (kIsWeb) {
    return NoTransitionPage(key: state.pageKey, child: child);
  }
  return MaterialPage(key: state.pageKey, child: child);
}
