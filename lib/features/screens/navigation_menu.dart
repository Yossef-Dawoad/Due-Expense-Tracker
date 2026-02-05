import 'package:expancetracker/core/routes/routes.dart';
import 'package:expancetracker/core/utils/extensions/context_ext.dart';
import 'package:expancetracker/features/screens/home_screen_v2.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../stats/views/stats_screen.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  int currentPageIndex = 0;
  final screens = [const HomeScreenV2(), const StatsScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentPageIndex],
      bottomNavigationBar: ClipRRect(
        child: Container(
          height: 90,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNavItem(0, Iconsax.home, Iconsax.element_equal5, 'HOME'),
              _buildNavItem(
                1,
                Icons.bar_chart,
                Iconsax.element_equal5,
                'STATS',
              ),
              GestureDetector(
                onTap: () => context.pushNamedRoute(Routes.addExpense),
                child: Container(
                  width: 120,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Color(0xFF39E079),
                    border: Border.all(color: Colors.white, width: 4),
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.2),
                        spreadRadius: 1,
                        blurRadius: 6,
                        offset: const Offset(2, 3),
                      ),
                    ],
                  ),
                  alignment: Alignment.center,
                  child: const Icon(Icons.add, color: Colors.white, size: 30),
                ),
              ),
              _buildNavItem(2, Iconsax.status_up, Iconsax.wallet, 'Wallet'),
              _buildNavItem(3, Iconsax.status_up, Icons.person, 'Profile'),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    int index,
    IconData icon,
    IconData selectedIcon,
    String label,
  ) {
    final isSelected = currentPageIndex == index;
    final color = isSelected ? Color(0xFF39E079) : Colors.grey;
    return GestureDetector(
      onTap: () => setState(() => currentPageIndex = index),
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(isSelected ? selectedIcon : icon, color: color, size: 26),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: isSelected ? FontWeight.w900 : FontWeight.normal,
            ),
          ),
        ],
      ),
    );
  }
}
