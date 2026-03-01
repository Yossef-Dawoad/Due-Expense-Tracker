import 'package:flutter/material.dart';

import 'category_user_input_handler.dart';

class CategoryUserInputProvider extends InheritedWidget {
  final CategoryUserInputs userData;

  const CategoryUserInputProvider({
    super.key,
    required this.userData,
    required super.child,
  });

  @override
  bool updateShouldNotify(CategoryUserInputProvider oldWidget) {
    return oldWidget.userData != userData;
  }

  static CategoryUserInputs of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<CategoryUserInputProvider>()!
        .userData;
  }
}
