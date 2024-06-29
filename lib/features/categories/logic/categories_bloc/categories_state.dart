part of 'categories_bloc.dart';

@freezed
class CategoriesState with _$CategoriesState {
  const factory CategoriesState.initial() = _Initial;
  const factory CategoriesState.loading() = CategoryLoading;
  const factory CategoriesState.addedsuccess(TransactionCategory category) = CategoryAddSuccess;
  const factory CategoriesState.fetchedsuccess(List<TransactionCategory> categories) =
      CategoryFetchSuccess;
  const factory CategoriesState.failure(String error) = CategoryFailure;
}
