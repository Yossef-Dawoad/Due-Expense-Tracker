import 'package:expancetracker/features/categories/domain/models/transaction_category.dart';
import 'package:expancetracker/features/categories/domain/repositories/categories_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'categories_event.dart';
part 'categories_state.dart';

class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  final CategoriesRepository _categoriesRepo;
  CategoriesBloc(this._categoriesRepo) : super(const _CategoriesInitial()) {
    on<AddedNewCategory>(_onCategoryAdded);
    on<FetchedAllCategories>(_onCategoriesFetched);
  }
  void _onCategoryAdded(event, emit) async {
    emit(const CategoriesLoading());
    try {
      final category = await _categoriesRepo.addNewCategory(event.category);
      emit(CategoryAddSuccess(category));
    } catch (e) {
      emit(CategoryFailure(e.toString()));
    }
  }

  void _onCategoriesFetched(event, emit) async {
    emit(const CategoriesLoading());
    try {
      final categories = await _categoriesRepo.getAllCategories();
      emit(CategoriesFetchSuccess(categories));
    } catch (e) {
      emit(CategoryFailure(e.toString()));
    }
  }
}
