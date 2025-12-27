part of 'categories_bloc.dart';

sealed class CategoriesEvent {
  const CategoriesEvent();
}

class AddedNewCategory extends CategoriesEvent {
  const AddedNewCategory(this.category);
  final TransactionCategory category;
}

class FetchedAllCategories extends CategoriesEvent {
  const FetchedAllCategories();
}

class DeletedCategory extends CategoriesEvent {
  const DeletedCategory(this.categoryId);
  final String categoryId;
}

class UpdatedCategory extends CategoriesEvent {
  const UpdatedCategory(this.category);
  final TransactionCategory category;
}
