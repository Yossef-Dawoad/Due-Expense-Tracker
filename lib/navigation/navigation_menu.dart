import 'package:expancetracker/core/utils/navigation/routes.dart';
import 'package:expancetracker/core/utils/extensions/context_ext.dart';
import 'package:expancetracker/home/views/home_screen.dart';
import 'package:expancetracker/navigation/viewmodels/navigation_view_model.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'package:expancetracker/wallet/wallet_details/views/wallet_details_screen.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  late final NavigationViewModel _viewModel = NavigationViewModel();
  final screens = [const HomeScreen(), const WalletDetailsScreen()];

  @override
  void dispose() {
    _viewModel.dipose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: _viewModel.currentPageIndex,
      builder: (context, currentIndex, _) {
        return Scaffold(
          body: screens[currentIndex],
          bottomNavigationBar: ClipRRect(
            child: Container(
              height: 90,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NavItem(
                    index: 0,
                    icon: Iconsax.home,
                    selectedIcon: Iconsax.element_equal5,
                    label: 'HOME',
                    currentIndex: currentIndex,
                    onTap: _viewModel.updatePageIndex,
                  ),
                  NavItem(
                    index: 1,
                    icon: Icons.bar_chart,
                    selectedIcon: Iconsax.element_equal5,
                    label: 'STATS',
                    currentIndex: currentIndex,
                    onTap: _viewModel.updatePageIndex,
                  ),
                  GestureDetector(
                    onTap: () => context.pushNamedRoute(Routes.addTransaction),
                    child: Container(
                      width: 120,
                      height: 55,
                      decoration: BoxDecoration(
                        color: const Color(0xFF39E079),
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
                      child: const Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                  NavItem(
                    index: 2,
                    icon: Iconsax.status_up,
                    selectedIcon: Iconsax.wallet,
                    label: 'Wallet',
                    currentIndex: currentIndex,
                    onTap: _viewModel.updatePageIndex,
                  ),
                  NavItem(
                    index: 3,
                    icon: Iconsax.status_up,
                    selectedIcon: Icons.person,
                    label: 'Profile',
                    currentIndex: currentIndex,
                    onTap: _viewModel.updatePageIndex,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class NavItem extends StatelessWidget {
  final int index;
  final IconData icon;
  final IconData selectedIcon;
  final String label;
  final int currentIndex;
  final ValueChanged<int> onTap;

  const NavItem({
    super.key,
    required this.index,
    required this.icon,
    required this.selectedIcon,
    required this.label,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = currentIndex == index;
    final color = isSelected ? const Color(0xFF39E079) : Colors.grey;

    return GestureDetector(
      onTap: () => onTap(index),
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
