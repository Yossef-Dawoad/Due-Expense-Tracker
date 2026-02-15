import 'package:expancetracker/core/bindings/dependancy_injection.dart';
import 'package:expancetracker/features/transactions/categories/viewmodels/categories_viewmodel.dart';
import 'package:expancetracker/features/transactions/data/repositories/category_repository.dart';
import 'package:flutter/material.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  late final CategoriesViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = CategoriesViewModel(repository: sl<CategoryRepository>());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Categories')),
      body: ListenableBuilder(
        listenable: _viewModel,
        builder: (context, _) {
          if (_viewModel.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (_viewModel.error != null) {
            return Center(child: Text('Error: ${_viewModel.error}'));
          }
          if (_viewModel.categories.isEmpty) {
            return const Center(child: Text('No categories found.'));
          }

          return ListView.builder(
            itemCount: _viewModel.categories.length,
            itemBuilder: (context, index) {
              final category = _viewModel.categories[index];
              return ListTile(
                leading: Text(category.icon),
                title: Text(category.name),
                subtitle: Text(category.id),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () => _viewModel.deleteCategory(category.id),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Implement add category dialog
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
