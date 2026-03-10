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
  final ValueNotifier<PresetCategory?> selectedPreset = ValueNotifier(null);
  final ValueNotifier<int> selectedIconIndex = ValueNotifier(0);

  // ── Controllers ────────────────────────────────────────────────────────
  final TextEditingController searchController = TextEditingController();
  final TextEditingController categoryNameController = TextEditingController();

  SelectCategoryViewModel({
    required TransactionService transactionService,
  }) : _transactionService = transactionService {
    searchController.addListener(() {
      searchQuery.value = searchController.text;
    });
    categoryNameController.addListener(_onCustomNameChanged);
  }

  // ── Computed ────────────────────────────────────────────────────────────

  /// Available presets (excluding "Other" which triggers this screen).
  List<PresetCategory> get availablePresets =>
      kPresetCategories.where((p) => p.name != 'Other').toList();

  /// Presets filtered by the current search query.
  List<PresetCategory> get filteredPresets {
    final query = searchQuery.value.toLowerCase().trim();
    if (query.isEmpty) return availablePresets;
    return availablePresets
        .where((p) => p.name.toLowerCase().contains(query))
        .toList();
  }

  /// Whether a valid selection exists (preset chosen or custom name filled).
  bool get hasValidSelection =>
      selectedPreset.value != null ||
      categoryNameController.text.trim().isNotEmpty;

  // ── Actions ─────────────────────────────────────────────────────────────

  void selectPreset(PresetCategory preset) {
    selectedPreset.value = preset;
    categoryNameController.clear();
  }

  void selectIcon(int index) {
    selectedIconIndex.value = index;
  }

  void _onCustomNameChanged() {
    if (categoryNameController.text.isNotEmpty) {
      selectedPreset.value = null;
    }
  }

  /// Persists the chosen/created category and returns it, or null on failure.
  Future<CategoryModel?> confirmSelection() async {
    final preset = selectedPreset.value;
    if (preset != null) return _persistPreset(preset);

    final customName = categoryNameController.text.trim();
    if (customName.isNotEmpty) return _createCustom(customName);

    return null;
  }

  // ── Private helpers ─────────────────────────────────────────────────────

  Future<CategoryModel?> _persistPreset(PresetCategory preset) async {
    final categories = _transactionService.categories.value;
    final existing = categories.firstWhere(
      (c) => c.name.toLowerCase() == preset.name.toLowerCase(),
      orElse: () =>
          CategoryModel(id: '', name: '', icon: '', color: '', userId: ''),
    );

    if (existing.id.isNotEmpty) return existing;

    final newCategory = CategoryModel(
      id: const Uuid().v4(),
      userId: '',
      name: preset.name,
      icon: preset.icon.codePoint.toString(),
      color: preset.color.toARGB32().toRadixString(16).padLeft(8, '0'),
      isDirty: true,
    );

    try {
      return await _transactionService.addCategory(newCategory);
    } catch (e) {
      debugPrint('Error inserting preset category: $e');
      return null;
    }
  }

  Future<CategoryModel?> _createCustom(String name) async {
    final icon = kCustomCategoryIcons[selectedIconIndex.value];
    final newCategory = CategoryModel(
      id: const Uuid().v4(),
      userId: '',
      name: name,
      icon: icon.codePoint.toString(),
      color: KitColors.brandPrimary.toARGB32().toRadixString(16).padLeft(
        8,
        '0',
      ),
      isDirty: true,
    );

    try {
      return await _transactionService.addCategory(newCategory);
    } catch (e) {
      debugPrint('Error creating custom category: $e');
      return null;
    }
  }

  void dispose() {
    searchQuery.dispose();
    selectedPreset.dispose();
    selectedIconIndex.dispose();
    searchController.dispose();
    categoryNameController.dispose();
  }
}
