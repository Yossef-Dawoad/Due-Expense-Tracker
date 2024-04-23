part of 'categories_bloc.dart';

@freezed
class CategoriesState with _$CategoriesState {
  const factory CategoriesState.initial() = _Initial;
  const factory CategoriesState.loading() = _Loading;
  const factory CategoriesState.addedsuccess() = _AddedSuccess;
  const factory CategoriesState.fetshedsuccess(
      List<TransactionCategory> categories) = _Fetshedsuccess;
  const factory CategoriesState.failure(String error) = _Failure;
}
