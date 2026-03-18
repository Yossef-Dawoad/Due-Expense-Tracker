import 'package:flutter/material.dart';

enum CreateBudgetScope {
  general(
    title: 'General budget',
    description: 'One flexible limit that covers all spending.',
    icon: Icons.account_balance_wallet_rounded,
  ),
  categories(
    title: 'Specific categories',
    description: 'Split the budget across one or more categories.',
    icon: Icons.grid_view_rounded,
  );

  const CreateBudgetScope({
    required this.title,
    required this.description,
    required this.icon,
  });

  final String title;
  final String description;
  final IconData icon;
}
