import 'dart:async';

import 'package:expancetracker/transactions/models/category.dart';
import 'package:expancetracker/transactions/repositories/category_repository.dart';
import 'package:flutter/foundation.dart';

class CategoriesViewModel {
  CategoriesViewModel({required CategoryRepository repository})
    : _repository = repository {
    _loadCategories();
  }

  final CategoryRepository _repository;
  StreamSubscription<List<CategoryModel>>? _categoriesSubscription;

  // State
  final ValueNotifier<List<CategoryModel>> categories = ValueNotifier([]);
  final ValueNotifier<bool> isLoading = ValueNotifier(false);
  final ValueNotifier<String?> error = ValueNotifier(null);

  // Load categories
  void _loadCategories() {
    isLoading.value = true;
    try {
      _categoriesSubscription = _repository.watchAll().listen(
        (data) {
          categories.value = data;
          isLoading.value = false;
        },
        onError: (Object e) {
          error.value = e.toString();
          isLoading.value = false;
        },
      );
    } catch (e) {
      error.value = e.toString();
      isLoading.value = false;
    }
  }

  // Add category
  Future<void> addCategory(CategoryModel category) async {
    try {
      await _repository.add(category);
    } catch (e) {
      error.value = e.toString();
    }
  }

  // Update category
  Future<void> updateCategory(CategoryModel category) async {
    try {
      await _repository.update(category);
    } catch (e) {
      error.value = e.toString();
    }
  }

  // Delete category
  Future<void> deleteCategory(String id) async {
    try {
      await _repository.delete(id);
    } catch (e) {
      error.value = e.toString();
    }
  }

  void dispose() {
    _categoriesSubscription?.cancel();
    categories.dispose();
    isLoading.dispose();
    error.dispose();
  }
}
