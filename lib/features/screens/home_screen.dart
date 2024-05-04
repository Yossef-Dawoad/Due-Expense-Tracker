import 'package:expancetracker/core/routes/routes.dart';
import 'package:expancetracker/core/utils/extensions/context_ext.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'package:expancetracker/core/constants/textstyles.dart';
import 'package:expancetracker/features/screens/widgets/avater_profile.dart';
import 'package:expancetracker/features/screens/widgets/balance_card.dart';
import 'package:expancetracker/features/transactions/views/widgets/transactions_list_view.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const AvaterInformationWidget(
                    image: 'assets/images/profile.png',
                    title: 'Welcome!',
                    subtitle: 'John Doe',
                  ),
                  IconButton.filled(
                    onPressed: () {},
                    icon: const Icon(Iconsax.setting),
                  )
                ],
              ),
              const SizedBox(height: 20),
              const BalanceCardSkelton(
                child: CardContentWidget(),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Transactions', style: f18BlackBold),
                    InkWell(
                      onTap: () =>
                          context.pushNamedRoute(Routes.allTransactions),
                      child: Text('View All', style: f14greyRegularText),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              const Expanded(child: TransactionListView())
            ],
          ),
        ),
      ),
    );
  }
}
