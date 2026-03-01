import 'package:expancetracker/features/transactions/data/models/category.dart';
import 'package:expancetracker/features/transactions/data/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class RecentTransactionsList extends StatelessWidget {
  final List<Transaction> transactions;
  final List<Category> categories;

  const RecentTransactionsList({
    super.key,
    required this.transactions,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final tx = transactions[index];
        final category = categories.firstWhere(
          (c) => c.id == tx.categoryId,
          orElse: () => Category(
            id: 'unknown',
            name: 'Unknown',
            icon: '❓',
            color: '0xFF9E9E9E', // Grey
            userId: '',
          ),
        );

        final isExpense = tx.type == TransactionType.expense;
        final color = Color(int.parse(category.color));

        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: Colors.grey.withValues(alpha: 0.05)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.02),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Text(category.icon, style: TextStyle(fontSize: 24)),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        (tx.note?.isNotEmpty ?? false)
                            ? tx.note!
                            : category.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '${category.name} • ${DateFormat('MMM dd').format(tx.date)}',
                        style: TextStyle(
                          color: Colors.grey[400],
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  '${isExpense ? "-" : "+"}\$${tx.amount.toStringAsFixed(2)}',
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.w800,
                    fontSize: 16,
                    color: isExpense ? Colors.black : const Color(0xff059669),
                  ),
                ),
              ],
            ),
          ),
        );
      }, childCount: transactions.length),
    );
  }
}
