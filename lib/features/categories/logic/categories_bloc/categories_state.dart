part of 'categories_bloc.dart';

sealed class CategoriesState {
  const CategoriesState();
}

class _CategoriesInitial extends CategoriesState {
  const _CategoriesInitial();
}

class CategoriesLoading extends CategoriesState {
  const CategoriesLoading();
}

class CategoryAddSuccess extends CategoriesState {
  const CategoryAddSuccess(this.category);
  final TransactionCategory category;
}

class CategoriesFetchSuccess extends CategoriesState {
  const CategoriesFetchSuccess(this.categories);
  final List<TransactionCategory> categories;
}

class CategoryFailure extends CategoriesState {
  const CategoryFailure(this.error);
  final String error;
}
