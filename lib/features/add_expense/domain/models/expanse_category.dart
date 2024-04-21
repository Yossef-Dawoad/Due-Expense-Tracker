import 'package:flutter/material.dart';

class ExpanseCategory {
  final String id;
  final String name;
  final String? description;
  final IconData icon;
  final Color color;

  ExpanseCategory({
    required this.id,
    required this.name,
    required this.color,
    required this.icon,
    this.description,
  });
}
