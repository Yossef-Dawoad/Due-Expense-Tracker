import 'package:expancetracker/core/ui/app_theme.dart';
import 'package:expancetracker/home/views/home_screen.dart';
import 'package:expancetracker/navigation/viewmodels/navigation_view_model.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'package:expancetracker/wallet/wallet_details/views/wallet_details_screen.dart';

import '../core/utils/locator.dart';
import '../core/utils/navigation/router_service.dart';

class NavigationMenu extends StatefulWidget {
  const NavigationMenu({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  late final NavigationViewModel _viewModel = NavigationViewModel(
    routerService: locator<RouterService>(),
  );
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
              color: context.kitColors.bgSurface,
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
                  _AddTransactionFloatingButton(
                    onTap: () => _viewModel.goToAddTransaction(),
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
    final colors = context.kitColors;
    final isSelected = currentIndex == index;
    final color = isSelected ? colors.brandPrimary : colors.textPlaceholder;

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

class _AddTransactionFloatingButton extends StatelessWidget {
  final VoidCallback onTap;

  const _AddTransactionFloatingButton({required this.onTap});

  @override
  Widget build(BuildContext context) {
    final colors = context.kitColors;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 120,
        height: 55,
        decoration: BoxDecoration(
          color: colors.brandPrimary,
          border: Border.all(color: colors.bgSurface, width: 4),
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
              color: colors.brandPrimary.withValues(alpha: 0.3),
              spreadRadius: 1,
              blurRadius: 6,
              offset: const Offset(2, 3),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Icon(Icons.add, color: colors.textOnPrimary, size: 30),
      ),
    );
  }
}
