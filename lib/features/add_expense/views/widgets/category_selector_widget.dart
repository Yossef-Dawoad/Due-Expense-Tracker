import 'package:expancetracker/core/common/domain/models/transaction_category.dart';
import 'package:expancetracker/core/constants/textstyles.dart';
import 'package:expancetracker/core/utils/extensions/context_ext.dart';
import 'package:expancetracker/features/add_expense/blocs/categories/categories_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:uuid/uuid.dart';

import 'custom_textfield.dart';
import 'exisitingcategory_gridview.dart';
import 'gategoryicon_gridview.dart';
import 'myflex_colorpicker.dart';

class CategorySelectorWidget extends StatefulWidget {
  const CategorySelectorWidget({super.key});

  @override
  State<CategorySelectorWidget> createState() => _CategorySelectorWidgetState();
}

class _CategorySelectorWidgetState extends State<CategorySelectorWidget> {
  int? selectedPredefinedCategoryIdx;
  bool addNewCategory = false;

  final _categoryNameController = TextEditingController();
  IconData? selectedCategoryIcon;
  Color? selectedColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),

            if (!addNewCategory)
              Column(
                children: [
                  Text('Select Category',
                      style: f18BlackBold.copyWith(color: Colors.black54)),
                  const SizedBox(height: 20),
                  // Pre-defined Categories
                  ExsistingCategoryGridView(
                    onCategorySelected: (idx) =>
                        selectedPredefinedCategoryIdx = idx,
                  ),
                  const SizedBox(height: 20),
                  const Divider(),
                  const SizedBox(height: 20),

                  const SizedBox(height: 20),
                ],
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                    addNewCategory
                        ? 'Want to Select Existing One?'
                        : 'Or You Add New Category',
                    style: f18BlackBold.copyWith(color: Colors.black54)),
                IconButton(
                  icon: Icon(
                    addNewCategory
                        ? Iconsax.arrow_square_up
                        : Iconsax.arrow_square_down,
                    color: Colors.blue,
                  ),
                  onPressed: () {
                    setState(() => addNewCategory = !addNewCategory);
                  },
                )
              ],
            ),
            const SizedBox(height: 20),
            // Add new category form
            if (addNewCategory)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MyTextField(
                    hintText: 'Category Name',
                    contentPadding: 12,
                    hintTextStyle: f14greyRegularText,
                    showBorder: true,
                    controller: _categoryNameController,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Category Icon',
                    style: f14greyRegularText,
                  ),
                  const SizedBox(height: 10),
                  CategoryIconGridView(
                    onCategoryIconTap: (icon) => selectedCategoryIcon = icon,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Category Color',
                    style: f14greyRegularText,
                  ),
                  const SizedBox(height: 10),
                  MyFlexColorPicker(
                    onColorSelected: (color) => selectedColor = color,
                  ),
                ],
              ),

            // Submit the new category choosed
            const SizedBox(height: 20),
            SizedBox(
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
                onPressed: () {
                  if (selectedCategoryIcon != null &&
                      selectedColor != null &&
                      _categoryNameController.text.isNotEmpty) {
                    // Add new category logic here
                    final newCategory = TransactionCategory(
                        id: const Uuid().v4(),
                        status: TransactionStatus.expense,
                        title: _categoryNameController.text,
                        icon: selectedCategoryIcon!,
                        color: selectedColor!.value);
                    context
                        .read<CategoriesBloc>()
                        .add(CategoryAdded(newCategory));
                    context.popRoute();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          backgroundColor: Colors.green,
                          content: Text('New category added')),
                    );
                  } else {
                    context.popRoute();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('Please fill all the required fields')),
                    );
                  }
                },
                child: Text(
                  'Add Category',
                  style: f18BlackBold.copyWith(
                      color: Theme.of(context).colorScheme.primary),
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
