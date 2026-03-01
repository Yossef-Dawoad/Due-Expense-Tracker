import 'package:expancetracker/transactions/models/category.dart';
import 'package:expancetracker/transactions/models/transaction.dart';
import 'package:flutter/material.dart';

class CategoryUserInputs extends ChangeNotifier {
  String categoryTitle = '';
  IconData? categoryIcon;
  Color? categoryColor;
  TransactionType transactionType = TransactionType.expense;
  Category? category;

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

  void updateTransactionType(TransactionType value) {
    transactionType = value;
    notifyListeners();
  }

  void updateCategoryItem(Category value) {
    category = value;
    notifyListeners();
  }
}
