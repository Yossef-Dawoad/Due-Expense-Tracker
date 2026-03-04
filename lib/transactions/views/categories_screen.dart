import 'package:expancetracker/core/utils/locator.dart';
import 'package:expancetracker/transactions/viewmodels/categories_viewmodel.dart';
import 'package:expancetracker/transactions/repositories/category_repository.dart';
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
    _viewModel = CategoriesViewModel(repository: locator<CategoryRepository>());
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Categories')),
      body: ValueListenableBuilder<bool>(
        valueListenable: _viewModel.isLoading,
        builder: (context, isLoading, _) {
          if (isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return ValueListenableBuilder<String?>(
            valueListenable: _viewModel.error,
            builder: (context, error, _) {
              if (error != null) {
                return Center(child: Text('Error: $error'));
              }
              return ValueListenableBuilder<List>(
                valueListenable: _viewModel.categories,
                builder: (context, categories, _) {
                  if (categories.isEmpty) {
                    return const Center(child: Text('No categories found.'));
                  }

                  return ListView.builder(
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      final category = categories[index];
                      return ListTile(
                        leading: Text(category.icon),
                        title: Text(category.name),
                        subtitle: Text(category.id),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () =>
                              _viewModel.deleteCategory(category.id),
                        ),
                      );
                    },
                  );
                },
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
