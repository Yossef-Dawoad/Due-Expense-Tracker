import 'package:expancetracker/core/common/domain/models/transaction_category.dart';
import 'package:expancetracker/core/constants/textstyles.dart';
import 'package:expancetracker/features/home/domain/models/money_transaction.dart';
import 'package:expancetracker/features/home/views/widgets/avater_profile.dart';
import 'package:expancetracker/features/home/views/widgets/balance_card.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'widgets/transaction_card.dart';

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
                    Text('View All', style: f14greyRegularText),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Expanded(child: TransactionHistory())
            ],
          ),
        ),
      ),
    );
  }
}

class TransactionHistory extends StatelessWidget {
  TransactionHistory({super.key});
  final transactions = [
    MoneyTransaction(
      id: '0',
      amount: 45.0,
      datetime: DateTime.now(),
      category: TransactionCategory.home(),
    ),
    MoneyTransaction(
      id: '1',
      amount: 90.0,
      datetime: DateTime.now(),
      category: TransactionCategory.shopping(),
    ),
    MoneyTransaction(
      id: '3',
      amount: 60.0,
      datetime: DateTime.now(),
      category: TransactionCategory.food(),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        final transction = transactions[index];
        return TransactionCard(transaction: transction);
      },
      separatorBuilder: (context, index) => const SizedBox(height: 10),
      itemCount: transactions.length,
    );
  }
}
