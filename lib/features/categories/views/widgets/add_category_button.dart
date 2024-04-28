import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import 'package:expancetracker/core/constants/textstyles.dart';
import 'package:expancetracker/core/utils/extensions/context_ext.dart';
import 'package:expancetracker/features/categories/domain/models/transaction_category.dart';
import 'package:expancetracker/features/categories/logic/categories_bloc/categories_bloc.dart';
import 'package:expancetracker/features/categories/logic/category_user_input_provider/category_user_input_provider.dart';

class AddCategoryButton extends StatelessWidget {
  const AddCategoryButton({super.key, required this.categoryTite});
  final TextEditingController categoryTite;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: 0.0,
            padding: const EdgeInsets.all(16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
              side: const BorderSide(
                color: Colors.blue,
              ),
            )),
        onPressed: () => _onUserSelectedCategory(context),
        child: Text(
          'Add Category',
          style: f18BlackBold.copyWith(
              color: Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }

  void _onUserSelectedCategory(BuildContext context) {
    final userData = CategoryUserInputProvider.of(context);

    // user Selected one of existing category
    if (userData.category != null) {
      context.read<CategoriesBloc>().add(CategoryAdded(userData.category!));
      return;
    }
    // User is try to add entirely new category
    if (userData.categoryIcon != null &&
        userData.categoryColor != null &&
        categoryTite.text.isNotEmpty) {
      final newCategory = TransactionCategory(
        id: const Uuid().v4(),
        status: TransactionStatus.expense,
        title: categoryTite.text.trim(),
        icon: userData.categoryIcon!,
        color: userData.categoryColor!.value,
      );
      context.read<CategoriesBloc>().add(CategoryAdded(newCategory));

      // pop-up the current route and display sanckbar
      context.popRoute();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.green, content: Text('New category added')),
      );
    } else {
      context.popRoute();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            backgroundColor: Colors.red,
            content: Text('Please fill all the required fields')),
      );
    }
  }
}
