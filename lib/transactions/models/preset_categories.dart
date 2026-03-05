import 'package:flutter/material.dart';

/// A single preset category definition.
///
/// These are the built-in defaults shown to the user during transaction entry.
/// They are **not** pre-seeded in the database; instead they are inserted
/// lazily the first time a user selects them.
class PresetCategory {
  const PresetCategory({
    required this.name,
    required this.icon,
    required this.color,
  });

  /// Human-readable label (e.g., "Food").
  final String name;

  /// Material icon to display.
  final IconData icon;

  /// Brand color for the category tile.
  final Color color;
}

/// The default preset categories available in the Add Transaction screen.
const List<PresetCategory> kPresetCategories = [
  PresetCategory(
    name: 'Food',
    icon: Icons.restaurant,
    color: Color(0xFFFF6B6B),
  ),
  PresetCategory(
    name: 'Shopping',
    icon: Icons.shopping_bag,
    color: Color(0xFF4ECDC4),
  ),
  PresetCategory(
    name: 'Transport',
    icon: Icons.directions_car,
    color: Color(0xFF45B7D1),
  ),
  PresetCategory(
    name: 'Health',
    icon: Icons.monitor_heart,
    color: Color(0xFF96CEB4),
  ),
  PresetCategory(name: 'Rent', icon: Icons.house, color: Color(0xFFFFEAA7)),
  PresetCategory(
    name: 'Entertainment',
    icon: Icons.movie,
    color: Color(0xFFDDA0DD),
  ),
  PresetCategory(
    name: 'Education',
    icon: Icons.school,
    color: Color(0xFF87CEEB),
  ),
  PresetCategory(
    name: 'Other',
    icon: Icons.more_horiz,
    color: Color(0xFFB0B0B0),
  ),
];
