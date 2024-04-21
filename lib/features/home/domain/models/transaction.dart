import 'package:flutter/material.dart';

class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime datetime;
  final String? category;
  final String? description;
  final TransactionStatus status;

  final IconData icon;
  final Color color;

  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.datetime,
    required this.color,
    required this.status,
    required this.icon,
    this.description,
    this.category,
  });
}

enum TransactionStatus {
  income,
  expense,
}
