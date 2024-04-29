part of 'categories_bloc.dart';

@freezed
class CategoriesEvent with _$CategoriesEvent {
  const factory CategoriesEvent.started() = _Started;
  const factory CategoriesEvent.categoryAdded(
    TransactionCategory category,
  ) = CategoryAdded;
  const factory CategoriesEvent.cateoriesFetched() = CategoriesFetched;
}
