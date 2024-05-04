import 'package:expancetracker/features/transactions/views/all_transactions_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:expancetracker/core/bindings/dependancy_injection.dart';
import 'package:expancetracker/features/categories/logic/categories_bloc/categories_bloc.dart';
import 'package:expancetracker/features/onboarding/views/onboarding_screen.dart';
import 'package:expancetracker/features/screens/navigation_menu.dart';
import 'package:expancetracker/features/stats/views/stats.dart';
import 'package:expancetracker/features/transactions/logic/transactions_bloc/transactions_bloc.dart';
import 'package:expancetracker/features/transactions/views/add_expense.dart';

import 'routes.dart';

class AppRouter {
  Route onGenerateRoute(RouteSettings settings) {
    return switch (settings.name) {
      Routes.onBoarding =>
        MaterialPageRoute(builder: (_) => const OnBoardingScreen()),
      Routes.home => MaterialPageRoute(builder: (_) => const NavigationMenu()),
      Routes.allTransactions =>
        MaterialPageRoute(builder: (_) => const AllTransactionsScreen()),
      Routes.addExpense => MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider<CategoriesBloc>(
                create: (context) => sl<CategoriesBloc>(),
              ),
              BlocProvider<TransactionsBloc>(
                create: (context) => sl<TransactionsBloc>(),
              ),
            ],
            child: const AddExpenseScreen(),
          ),
        ),
      Routes.status => MaterialPageRoute(builder: (_) => const StatsScreen()),
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
