import 'dart:math';

import 'package:expancetracker/features/add_expense/views/add_expense.dart';
import 'package:expancetracker/features/status/views/status.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'mainscreen.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int currentPageIndex = 0;
  final screens = [
    const HomeScreen(),
    const StatusScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentPageIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50.0),
          topRight: Radius.circular(50.0),
        ),
        child: SizedBox(
          height: 100,
          child: NavigationBar(
            selectedIndex: currentPageIndex,
            onDestinationSelected: (idx) =>
                setState(() => currentPageIndex = idx),
            indicatorColor:
                Theme.of(context).colorScheme.secondary.withAlpha(100),
            destinations: const [
              NavigationDestination(
                icon: Icon(Iconsax.element_equal),
                selectedIcon: Icon(Iconsax.element_equal5, color: Colors.grey),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Iconsax.status_up),
                selectedIcon: Icon(
                  Iconsax.status_up5,
                  color: Colors.grey,
                ),
                label: 'Status',
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        height: 80.0,
        width: 80.0,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddExpenseScreen()),
            ),
            shape: const CircleBorder(),
            child: Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Theme.of(context).colorScheme.tertiary,
                    Theme.of(context).colorScheme.secondary,
                    Theme.of(context).colorScheme.primary,
                  ],
                  transform: const GradientRotation(pi / 4),
                ),
              ),
              child: const Icon(Icons.add),
            ),
          ),
        ),
      ),
    );
  }
}
