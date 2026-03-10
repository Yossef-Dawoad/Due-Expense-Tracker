import 'package:expancetracker/core/services/transaction_service.dart';
import 'package:expancetracker/core/ui/constants/kit_colors.dart';
import 'package:expancetracker/transactions/models/category.dart';
import 'package:expancetracker/transactions/models/preset_categories.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

/// ViewModel for the Select Category screen.
///
/// Manages preset filtering, selection, and custom category creation.
/// Either a preset OR a custom name can be active — they are mutually exclusive.
class SelectCategoryViewModel {
  final TransactionService _transactionService;

  // ── State ──────────────────────────────────────────────────────────────
  final ValueNotifier<String> searchQuery = ValueNotifier('');
  final ValueNotifier<CategoryModel?> selectedCategory = ValueNotifier(null);
  final ValueNotifier<int> selectedIconIndex = ValueNotifier(0);

  // ── Controllers ────────────────────────────────────────────────────────
  final TextEditingController searchController = TextEditingController();
  final TextEditingController categoryNameController = TextEditingController();

  SelectCategoryViewModel({required TransactionService transactionService})
    : _transactionService = transactionService {
    searchController.addListener(() {
      searchQuery.value = searchController.text;
    });
    categoryNameController.addListener(_onCustomNameChanged);
  }

  // ── Computed ────────────────────────────────────────────────────────────

  /// DB categories stream.
  ValueNotifier<List<CategoryModel>> get allDbCategories =>
      _transactionService.categories;

  /// Combined list of default presets AND custom database categories.
  List<CategoryModel> get displayCategories {
    final dbCategories = allDbCategories.value;
    final merged = <CategoryModel>[];

    // Add default presets as CategoryModels
    for (final p in kPresetCategories.where((p) => p.name != 'Other')) {
      final inDb = dbCategories
          .where((c) => c.name.toLowerCase() == p.name.toLowerCase())
          .firstOrNull;
      if (inDb != null) {
        merged.add(inDb);
      } else {
        merged.add(
          CategoryModel(
            id: const Uuid().v4(),
            userId: '',
            name: p.name,
            icon: p.icon.codePoint.toString(),
            color: p.color.toARGB32().toRadixString(16).padLeft(8, '0'),
            isDirty: true,
          ),
        );
      }
    }

    // Append any DB categories that are pure customs
    for (final c in dbCategories) {
      if (!merged.any((m) => m.name.toLowerCase() == c.name.toLowerCase())) {
        merged.add(c);
      }
    }

    return merged;
  }

  /// Categories filtered by the current search query.
  List<CategoryModel> get filteredCategories {
    final query = searchQuery.value.toLowerCase().trim();
    if (query.isEmpty) return displayCategories;
    return displayCategories
        .where((c) => c.name.toLowerCase().contains(query))
        .toList();
  }

  /// Whether a valid selection exists (preset chosen or custom name filled).
  bool get hasValidSelection =>
      selectedCategory.value != null ||
      categoryNameController.text.trim().isNotEmpty;

  // ── Actions ─────────────────────────────────────────────────────────────

  void selectCategory(CategoryModel category) {
    selectedCategory.value = category;
    categoryNameController.clear();
  }

  void selectIcon(int index) {
    selectedIconIndex.value = index;
  }

  void _onCustomNameChanged() {
    if (categoryNameController.text.isNotEmpty) {
      selectedCategory.value = null;
    }
  }

  /// Returns the chosen CategoryModel (delayed saving).
  Future<CategoryModel?> confirmSelection() async {
    final category = selectedCategory.value;
    if (category != null) return category;

    final customName = categoryNameController.text.trim();
    if (customName.isNotEmpty) {
      final icon = kCustomCategoryIcons[selectedIconIndex.value];
      return CategoryModel(
        id: const Uuid().v4(),
        userId: '',
        name: customName,
        icon: icon.codePoint.toString(),
        color: KitColors.brandPrimary
            .toARGB32()
            .toRadixString(16)
            .padLeft(8, '0'),
        isDirty: true,
      );
    }
    return null;
  }

  void dispose() {
    searchQuery.dispose();
    selectedCategory.dispose();
    selectedIconIndex.dispose();
    searchController.dispose();
    categoryNameController.dispose();
  }
}
