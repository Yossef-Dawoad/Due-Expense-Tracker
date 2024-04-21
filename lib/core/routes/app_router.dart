import 'package:expancetracker/features/add_expense/views/add_expense.dart';
import 'package:expancetracker/features/home/views/navigation_menu.dart';
import 'package:expancetracker/features/onboarding/views/onboarding_screen.dart';
import 'package:expancetracker/features/status/views/status.dart';
import 'package:flutter/material.dart';

import 'routes.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    return switch (settings.name) {
      Routes.onBoarding =>
        MaterialPageRoute(builder: (_) => const OnBoardingScreen()),
      Routes.home => MaterialPageRoute(builder: (_) => const NavigationMenu()),
      Routes.addExpense =>
        MaterialPageRoute(builder: (_) => const AddExpenseScreen()),
      Routes.status => MaterialPageRoute(builder: (_) => const StatusScreen()),
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
