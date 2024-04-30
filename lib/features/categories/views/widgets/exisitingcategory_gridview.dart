import 'package:expancetracker/core/bindings/dependancy_injection.dart';
import 'package:expancetracker/features/categories/domain/models/transaction_category.dart';
import 'package:expancetracker/features/categories/logic/categories_bloc/categories_bloc.dart';
import 'package:expancetracker/features/categories/logic/category_user_input_provider/category_user_input_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ExsistingCategoryGridViewContainer extends StatefulWidget {
  const ExsistingCategoryGridViewContainer({super.key});

  @override
  State<ExsistingCategoryGridViewContainer> createState() =>
      _ExsistingCategoryGridViewContainerState();
}

class _ExsistingCategoryGridViewContainerState
    extends State<ExsistingCategoryGridViewContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.blue),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<CategoriesBloc, CategoriesState>(
          bloc: sl<CategoriesBloc>()..add(const CategoriesFetched()),
          builder: (context, state) {
            return state.maybeWhen(
              orElse: () => const Center(child: CircularProgressIndicator()),
              fetshedsuccess: (categories) =>
                  ExsistingCategoryGridView(categories),
            );
          },
        ),
      ),
    );
  }
}

class ExsistingCategoryGridView extends StatefulWidget {
  const ExsistingCategoryGridView(this.categories, {super.key});
  final List<TransactionCategory> categories;

  @override
  State<ExsistingCategoryGridView> createState() =>
      _ExsistingCategoryGridViewState();
}

class _ExsistingCategoryGridViewState extends State<ExsistingCategoryGridView> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    final userData = CategoryUserInputProvider.of(context);
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        crossAxisSpacing: 6.0,
        mainAxisSpacing: 6.0,
      ),
      itemCount: widget.categories.length,
      itemBuilder: (_, index) {
        final category = widget.categories[index];
        return GestureDetector(
          onTap: () {
            setState(() => selectedIndex = index);
            userData.updateCategoryItem(category);
          },
          child: PredfiendCategoryItem(
            category: category,
            isSelected: (selectedIndex == index),
          ),
        );
      },
    );
  }
}

class PredfiendCategoryItem extends StatelessWidget {
  final TransactionCategory category;
  final bool isSelected;

  const PredfiendCategoryItem({
    super.key,
    required this.category,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            color: Color(category.color),
            shape: BoxShape.circle,
            border: isSelected ? Border.all(width: 4) : null,
          ),
          child: Icon(
            category.icon,
            color: Colors.white,
          ),
        ),
        Text(
          category.title,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: Colors.grey),
        )
      ],
    );
  }
}
