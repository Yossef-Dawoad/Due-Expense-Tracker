import 'package:flutter/material.dart';

class QuickActions extends StatelessWidget {
  const QuickActions({super.key});

  @override
  Widget build(BuildContext context) {
    final actions = [
      (
        icon: Icons.swap_horiz,
        label: 'Send',
        color: const Color(0xff10B981),
      ), // Emerald
      (
        icon: Icons.receipt_long,
        label: 'Bills',
        color: const Color(0xff3B82F6),
      ), // Blue
      (
        icon: Icons.bar_chart,
        label: 'Reports',
        color: const Color(0xff8B5CF6),
      ), // Purple
      (
        icon: Icons.grid_view,
        label: 'More',
        color: const Color(0xffF59E0B),
      ), // Amber
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Actions',
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w800,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween, // Equal spacing
          children: actions
              .map((action) => QuickActionItem(action: action))
              .toList(),
        ),
      ],
    );
  }
}

class QuickActionItem extends StatelessWidget {
  final ({Color color, IconData icon, String label}) action;

  const QuickActionItem({super.key, required this.action});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withValues(alpha: 0.08),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Icon(action.icon, color: action.color, size: 28),
        ),
        const SizedBox(height: 8),
        Text(
          action.label,
          style: TextStyle(
            color: Colors.grey[700],
            fontWeight: FontWeight.w600,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
