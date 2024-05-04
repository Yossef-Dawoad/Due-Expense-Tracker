import 'package:flutter/material.dart';

import 'widgets/transactions_list_view.dart';

class AllTransactionsScreen extends StatelessWidget {
  const AllTransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const TransactionListView(),
    );
  }
}
