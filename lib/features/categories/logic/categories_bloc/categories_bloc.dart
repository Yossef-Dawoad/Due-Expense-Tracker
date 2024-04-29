import 'package:expancetracker/features/categories/domain/models/transaction_category.dart';
import 'package:expancetracker/core/common/domain/intrefaces/firebase_base.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'categories_event.dart';
part 'categories_state.dart';
part 'categories_bloc.freezed.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final BaseFireBaseDB<TransactionCategory> _categoriesService;
  CategoriesBloc(this._categoriesService) : super(const _Initial()) {
    on<CategoryAdded>(_onCategoryAdded);
    on<CategoriesFetched>(_onCategoriesFetched);
  }
  void _onCategoryAdded(event, emit) async {
    emit(const CategoriesState.loading());
    try {
      final category = await _categoriesService.addNewItem(event.category);
      emit(CategoriesState.addedsuccess(category));
    } catch (e) {
      emit(CategoriesState.failure(e.toString()));
    }
  }

  void _onCategoriesFetched(event, emit) async {
    emit(const CategoriesState.loading());
    try {
      final categories = await _categoriesService.getAllItems();
      emit(CategoriesState.fetshedsuccess(categories));
    } catch (e) {
      emit(CategoriesState.failure(e.toString()));
    }
  }
}