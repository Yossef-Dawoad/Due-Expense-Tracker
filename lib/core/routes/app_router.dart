import 'package:flutter/material.dart';

import 'package:expancetracker/features/onboarding/views/onboarding_screen.dart';
import 'package:expancetracker/navigation_menu.dart';

import 'package:expancetracker/features/transactions/add_transaction/views/add_transaction_screen.dart';
import 'package:expancetracker/features/wallet/wallet_details/views/wallet_details_screen.dart';
import 'routes.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    return switch (settings.name) {
      Routes.onBoarding => MaterialPageRoute(
        builder: (_) => const OnBoardingScreen(),
      ),
      Routes.home => MaterialPageRoute(builder: (_) => const NavigationMenu()),

      Routes.walletDetails => MaterialPageRoute(
        builder: (_) => const WalletDetailsScreen(),
      ),
      Routes.addTransaction => MaterialPageRoute(
        builder: (_) => const AddTransactionScreen(),
      ),
      _ => _errorRoute(settings.name),
    };
  }

  static Route<dynamic> _errorRoute(String? pageName) {
    return MaterialPageRoute(
      builder: (_) => const Scaffold(
        body: Center(
          child: Text('404 not Found', style: TextStyle(fontSize: 32.0)),
        ),
      ),
    );
  }
}
