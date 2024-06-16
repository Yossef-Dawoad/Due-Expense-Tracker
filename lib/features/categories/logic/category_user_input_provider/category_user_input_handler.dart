import 'package:expancetracker/features/categories/domain/models/transaction_category.dart';
import 'package:flutter/material.dart';

class CategoryUserInputs extends ChangeNotifier {
  String categoryTitle = '';
  IconData? categoryIcon;
  Color? categoryColor;
  TransactionStatus status = TransactionStatus.expense;
  TransactionCategory? category;

  void updateCategoryTitle(String value) {
    categoryTitle = value;
    notifyListeners();
  }

  void updateCategoryIcon(IconData value) {
    categoryIcon = value;
    notifyListeners();
  }

  void updateCategoryColor(Color value) {
    categoryColor = value;
    notifyListeners();
  }

  void updateCategoryStatus(TransactionStatus value) {
    status = value;
    notifyListeners();
  }

  void updateCategoryItem(TransactionCategory value) {
    category = value;
    notifyListeners();
  }
}
