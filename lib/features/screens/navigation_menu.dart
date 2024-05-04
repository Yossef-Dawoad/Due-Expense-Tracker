import 'dart:math';

import 'package:expancetracker/core/routes/routes.dart';
import 'package:expancetracker/core/utils/extensions/context_ext.dart';
import 'package:expancetracker/features/stats/views/stats.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'home_screen.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int currentPageIndex = 0;
  final screens = [
    const HomeScreen(),
    const StatsScreen(),
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
            onPressed: () => context.pushNamedRoute(Routes.addExpense),
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
