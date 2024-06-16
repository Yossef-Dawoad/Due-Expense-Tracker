import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';

import 'package:expancetracker/core/common/widgets/custom_textfield.dart';
import 'package:expancetracker/core/common/widgets/header_title.dart';
import 'package:expancetracker/core/constants/textstyles.dart';
import 'package:expancetracker/core/utils/extensions/context_ext.dart';
import 'package:expancetracker/features/categories/domain/models/transaction_category.dart';
import 'package:expancetracker/features/categories/logic/categories_bloc/categories_bloc.dart';
import 'package:expancetracker/features/categories/logic/category_user_input_provider/category_user_input_handler.dart';
import 'package:expancetracker/features/categories/logic/category_user_input_provider/category_user_input_provider.dart';

import 'widgets/add_category_button.dart';
import 'widgets/exisitingcategory_gridview.dart';
import 'widgets/expense_action_choice.dart';
import 'widgets/gategoryicon_gridview.dart';
import 'widgets/myflex_colorpicker.dart';

class CategorySelectorWidget extends StatefulWidget {
  const CategorySelectorWidget({super.key, required this.onChanged});
  final ValueChanged<TransactionCategory> onChanged;

  @override
  State<CategorySelectorWidget> createState() => _CategorySelectorWidgetState();
}

class _CategorySelectorWidgetState extends State<CategorySelectorWidget> {
  bool addNewCategory = false;
  final _categoryNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return CategoryUserInputProvider(
      userData: CategoryUserInputs(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              if (!addNewCategory)
                Column(
                  children: [
                    Text('Select Category', style: f18BlackBold.copyWith(color: Colors.black54)),
                    const SizedBox(height: 20),
                    // Pre-defined Categories
                    const ExsistingCategoryGridViewContainer(),
                    const SizedBox(height: 20),
                    const Divider(),
                    const SizedBox(height: 20),
                  ],
                ),
              // change the header title based on the user selecting existing category or new one
              addNewCategory
                  ? HeaderTitle(
                      title: 'Want to Select Existing One?',
                      actionIcon: Iconsax.arrow_square_up,
                      onActionTap: () => setState(() => addNewCategory = !addNewCategory))
                  : HeaderTitle(
                      title: 'Or You Add New Category',
                      actionIcon: Iconsax.arrow_square_down,
                      onActionTap: () => setState(() => addNewCategory = !addNewCategory),
                    ),
              const SizedBox(height: 20),
              // show the category form if user want to enter new category
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
                    Text('Category Icon', style: f14greyRegularText),
                    const SizedBox(height: 10),
                    const CategoryIconGridView(),
                    const SizedBox(height: 30),
                    Text('Category Color', style: f14greyRegularText),
                    const SizedBox(height: 10),
                    const MyFlexColorPicker(),
                    const SizedBox(height: 30),
                    Text('Expense Type', style: f14greyRegularText),
                    const SizedBox(height: 10),
                    const ExpenseActionChoice()
                  ],
                ),

              // Submit the new category choosed
              const SizedBox(height: 20),
              AddCategoryButton(categoryTite: _categoryNameController),
              const SizedBox(height: 30),
              // a listener when user add new category
              BlocListener<CategoriesBloc, CategoriesState>(
                listenWhen: (prev, curr) => curr is CategoryAddSuccess,
                listener: (context, state) => state.maybeWhen(
                  addedsuccess: (category) {
                    widget.onChanged(category);
                    context.popRoute();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          backgroundColor: Colors.green, content: Text('New category added')),
                    );
                    return null;
                  },
                  orElse: () {
                    context.popRoute();
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('Please fill all the required fields')),
                    );
                    return null;
                  },
                ),
                child: const SizedBox.shrink(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
