import 'dart:async';

import 'package:expancetracker/core/common/domain/types/result.dart';
import 'package:expancetracker/features/categories/domain/models/transaction_category.dart';
import 'package:expancetracker/features/categories/domain/repositories/categories_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_event.dart';
part 'categories_state.dart';
part 'categories_bloc.freezed.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final CategoriesRepository _categoriesRepo;
  CategoriesBloc(this._categoriesRepo) : super(const _Initial()) {
    on<CategoryAdded>(_onCategoryAdded);
    on<CategoriesFetched>(_onCategoriesFetched);
  }
  FutureOr<void> _onCategoryAdded(event, emit) async {
    emit(const CategoriesState.loading());
    final categoryResult = await _categoriesRepo.addNewCategory(event.category);
    return switch (categoryResult) {
      Success(data: TransactionCategory category) => emit(CategoriesState.addedsuccess(category)),
      Failure(err: String message) => emit(CategoriesState.failure(message)),
    };
  }

  FutureOr<void> _onCategoriesFetched(event, emit) async {
    emit(const CategoriesState.loading());
    final categoriesResult = await _categoriesRepo.fetchAllCategories();
    return switch (categoriesResult) {
      Success(data: final categories) => emit(CategoriesState.fetchedsuccess(categories!)),
      Failure(err: String message) => emit(CategoriesState.failure(message)),
    };
  }
}
