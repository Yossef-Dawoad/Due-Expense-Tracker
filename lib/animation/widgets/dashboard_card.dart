// AnimatedDashboardCard - an example widget demonstrating animation composition.

import 'package:flutter/material.dart';

import 'fade_in.dart';
import 'slide_in.dart';

/// An example widget demonstrating how to compose animations for a lively UI card.
///
/// **When to use**:
/// *   As a reference for combining [SlideInAnimation] and [FadeInAnimation].
/// *   For dashboard summary cards.
///
/// **Usage**:
/// ```dart
/// AnimatedDashboardCard(
///   title: "Steps",
///   value: "5,432",
///   icon: Icons.directions_walk,
///   gradient: LinearGradient(colors: [Colors.blue, Colors.lightBlue]),
///   onTap: () {},
/// )
/// ```
class AnimatedDashboardCard extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final LinearGradient gradient;
  final VoidCallback onTap;

  const AnimatedDashboardCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.gradient,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SlideInAnimation(
      beginOffset: const Offset(0, 0.2),
      child: FadeInAnimation(
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              gradient: gradient,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(icon, color: Colors.white, size: 32),
                const Spacer(),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
