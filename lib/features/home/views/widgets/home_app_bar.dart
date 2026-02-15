import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        CircleAvatar(
          radius: 26.0,
          backgroundColor: theme.colorScheme.surface,
          child: const CircleAvatar(
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
              style: theme.textTheme.bodyMedium?.copyWith(
                color: Colors.grey,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'Youssef Dawoud', // In a real app, this comes from a User Service
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w900,
                color: theme.colorScheme.onSurface,
              ),
            ),
          ],
        ),
        const Spacer(),
        IconButton(
          icon: Icon(
            Icons.notifications_outlined,
            color: theme.colorScheme.onSurface,
          ),
          onPressed: () {},
        ),
      ],
    );
  }
}
