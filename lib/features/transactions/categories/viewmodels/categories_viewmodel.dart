import 'package:expancetracker/features/transactions/data/models/category.dart';
import 'package:expancetracker/features/transactions/data/repositories/category_repository.dart';
import 'package:flutter/material.dart';

class CategoriesViewModel extends ChangeNotifier {
  final CategoryRepository _repository;

  CategoriesViewModel({required CategoryRepository repository})
    : _repository = repository {
    _loadCategories();
  }

  // State
  List<Category> _categories = [];
  List<Category> get categories => _categories;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String? _error;
  String? get error => _error;

  // Load categories
  Future<void> _loadCategories() async {
    _setLoading(true);
    try {
      final stream = _repository.watchAll();
      stream.listen((data) {
        _categories = data;
        _setLoading(false);
      });
    } catch (e) {
      _error = e.toString();
      _setLoading(false);
    }
  }

  // Add category
  Future<void> addCategory(Category category) async {
    try {
      await _repository.add(category);
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  // Update category
  Future<void> updateCategory(Category category) async {
    try {
      await _repository.update(category);
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  // Delete category
  Future<void> deleteCategory(String id) async {
    try {
      await _repository.delete(id);
    } catch (e) {
      _error = e.toString();
      notifyListeners();
    }
  }

  void _setLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }
}
