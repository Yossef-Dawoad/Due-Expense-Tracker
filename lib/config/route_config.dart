import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:expancetracker/core/utils/navigation/routes.dart';
import 'package:expancetracker/onboarding/views/onboarding_screen.dart';
import 'package:expancetracker/navigation/navigation_menu.dart';
import 'package:expancetracker/wallet/wallet_details/views/wallet_details_screen.dart';
import 'package:expancetracker/transactions/add_transaction/views/add_transaction_screen.dart';
import 'package:expancetracker/not_found/not_found_view.dart';

final routes = [
  GoRoute(
    path: Routes.onBoarding,
    pageBuilder: (context, state) =>
        _buildPage(const OnBoardingScreen(), state),
  ),
  GoRoute(
    path: Routes.home,
    pageBuilder: (context, state) => _buildPage(const NavigationMenu(), state),
  ),
  GoRoute(
    path: Routes.walletDetails,
    pageBuilder: (context, state) =>
        _buildPage(const WalletDetailsScreen(), state),
  ),
  GoRoute(
    path: Routes.addTransaction,
    pageBuilder: (context, state) =>
        _buildPage(const AddTransactionScreen(), state),
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
