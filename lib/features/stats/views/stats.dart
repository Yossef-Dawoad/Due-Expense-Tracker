import 'package:expancetracker/core/constants/textstyles.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'widgets/expanses_tab.dart';
import 'widgets/income_expanse_tab_switcher.dart';

class StatsScreen extends StatelessWidget {
  const StatsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.surface,
          elevation: 0.0,
          title: Text('Transactions', style: f24BlackBold),
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(Iconsax.back_square),
          ),
          actions: [
            IconButton.filled(
              onPressed: () {},
              icon: const Icon(Iconsax.setting),
            )
          ],
        ),
        body: const SafeArea(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              children: [
                IncomeExpenseTabSwitcher(),
                Expanded(
                  child: TabBarView(
                    children: [
                      ExpansesTabScreen(),
                      ExpansesTabScreen(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
