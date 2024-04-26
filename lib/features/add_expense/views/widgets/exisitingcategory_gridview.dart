import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:expancetracker/features/add_expense/blocs/categories/categories_bloc.dart';

class ExsistingCategoryGridView extends StatefulWidget {
  const ExsistingCategoryGridView({
    super.key,
    required this.onCategorySelected,
  });

  final ValueChanged onCategorySelected;

  @override
  State<ExsistingCategoryGridView> createState() =>
      _ExsistingCategoryGridViewState();
}

class _ExsistingCategoryGridViewState extends State<ExsistingCategoryGridView> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.blue)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: BlocBuilder<CategoriesBloc, CategoriesState>(
          builder: (context, state) {
            state.maybeWhen(
              orElse: () => const Center(child: CircularProgressIndicator()),
              fetshedsuccess: (categories) => GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 6.0,
                    mainAxisSpacing: 6.0,
                  ),
                  itemCount: categories.length,
                  itemBuilder: (_, index) {
                    final category = categories[index];
                    return Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() => selectedIndex = index);
                            widget.onCategorySelected(selectedIndex);
                          },
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                                color: Color(category.color),
                                shape: BoxShape.circle,
                                border: (selectedIndex == index)
                                    ? Border.all(width: 4)
                                    : null),
                            child: Icon(category.icon),
                          ),
                        ),
                        Text(
                          category.title,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(color: Colors.grey),
                        )
                      ],
                    );
                  }),
            );
            return const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
