import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreenV2 extends StatelessWidget {
  const HomeScreenV2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 0),
              sliver: SliverList(
                delegate: SliverChildListDelegate([
                  const SizedBox(height: 12.0),
                  const ProfileAppBar(),
                  const SizedBox(height: 36.0),
                  const ExpenseSummaryCard(),
                  const SizedBox(height: 24.0),
                  const FinancialQuickActions(),
                  const SizedBox(height: 24.0),
                  Text(
                    'Recent Transactions',
                    style: GoogleFonts.manrope(fontWeight: FontWeight.w800, fontSize: 18),
                  ),
                  const SizedBox(height: 16.0),
                ]),
              ),
            ),
            RecentTransactions(),
            const SliverToBoxAdapter(child: SizedBox(height: 80.0)),
          ],
        ),
      ),
    );
  }
}

class RecentTransactions extends StatelessWidget {
  const RecentTransactions({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate((context, index) {
          return Column(
            children: [
              ListTile(
                contentPadding: EdgeInsets.all(16.0),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(12.0),
                ),
                tileColor: Colors.white,
                leading: Container(
                  width: 55,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.red.withAlpha(50),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: const Icon(Icons.shopping_cart_outlined, color: Colors.red),
                ),
                title: Text(
                  'Transaction ${index + 1}',
                  style: GoogleFonts.manrope(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                    letterSpacing: .2,
                  ),
                ),
                subtitle: Text(
                  'Entertainment • Oct 12',
                  style: GoogleFonts.manrope(color: Colors.grey, fontSize: 12.0, letterSpacing: .2),
                ),
                trailing: Text(
                  '-\$100.00',
                  style: GoogleFonts.manrope(fontWeight: FontWeight.bold, fontSize: 15.0),
                ),
              ),
              const SizedBox(height: 14.0),
            ],
          );
        }, childCount: 10),
      ),
    );
  }
}

class ProfileAppBar extends StatelessWidget {
  const ProfileAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        const CircleAvatar(
          radius: 26.0,
          child: CircleAvatar(
            radius: 24.0,
            backgroundImage: AssetImage('assets/images/profile.png'),
          ),
        ),
        const SizedBox(width: 12.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              'Good morning,',
              style: GoogleFonts.manrope(color: Colors.grey, fontWeight: FontWeight.w700),
            ),
            Text(
              'Youssef Dawoud',
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w900),
            ),
          ],
        ),
        const Spacer(),
        IconButton(icon: const Icon(Icons.notifications_outlined), onPressed: () {}),
      ],
    );
  }
}

class ExpenseSummaryCard extends StatelessWidget {
  const ExpenseSummaryCard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(24.0),
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [-0.5, 0.5, 1.5],
          colors: [Color(0xff1e3a8a), Color(0xff581c87), Color(0xff122017)],
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Total Balance',
                    style: theme.textTheme.bodyLarge?.copyWith(color: Colors.grey[300]),
                  ),
                  Text(
                    '\$12,450.80',
                    style: theme.textTheme.displaySmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.2,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                color: Colors.white.withValues(alpha: .2), // Updated alpha
                width: 50,
                height: 50,
                child: const Icon(Icons.wallet, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Row(
            children: [
              // Income Card
              IndicatorCard(
                title: 'INCOME',
                value: '\$3,200.80',
                icon: Icon(Icons.arrow_upward, color: Colors.green),
              ),
              Spacer(),
              // Expense Card
              IndicatorCard(
                title: 'EXPENSES',
                value: '\$1,850.80',
                icon: Icon(Icons.arrow_downward, color: Colors.red),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class IndicatorCard extends StatelessWidget {
  final String title;
  final String value;
  final Widget icon;

  const IndicatorCard({super.key, required this.title, required this.value, required this.icon});

  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.sizeOf(context);
    return Container(
      padding: const EdgeInsets.all(12.0),
      width: mediaSize.width * 0.40,
      height: 90,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 0.6),
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white.withValues(alpha: .15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              icon,
              const SizedBox(width: 8.0),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class FinancialQuickActions extends StatelessWidget {
  const FinancialQuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    final actions = [
      (icon: Icons.swap_horiz, label: 'Send', color: Colors.green),
      (icon: Icons.receipt_long, label: 'Bills', color: Colors.blue),
      (icon: Icons.bar_chart, label: 'Reports', color: Colors.purple),
      (icon: Icons.grid_view, label: 'More', color: Colors.orange),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Actions',
          style: GoogleFonts.manrope(fontWeight: FontWeight.w800, fontSize: 18),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: actions.asMap().entries.map((entry) {
            final index = entry.key;
            final action = entry.value;
            return Padding(
              padding: EdgeInsets.only(left: index == 0 ? 12.0 : 0.0),
              child: QuickActionItem(icon: action.icon, label: action.label, color: action.color),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class QuickActionItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;

  const QuickActionItem({super.key, required this.icon, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      children: [
        Container(
          width: 60, // Restored to 60 as per design fix
          height: 60,
          decoration: BoxDecoration(
            color: color.withValues(alpha: .15),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Icon(icon, color: color, size: 28),
        ),
        const SizedBox(height: 8),
        Text(label, style: theme.textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w800)),
      ],
    );
  }
}
