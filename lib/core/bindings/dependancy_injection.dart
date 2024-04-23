import 'package:expancetracker/core/common/domain/services/firebase_base_impl.dart';
import 'package:expancetracker/core/common/domain/services/intrefaces/firebase_base.dart';
import 'package:expancetracker/features/add_expense/blocs/categories/categories_bloc.dart';
import 'package:expancetracker/features/add_expense/blocs/expenses/add_expense_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void initializeDependencies() {
  /// Register Services
  sl.registerLazySingleton<BaseFirebaseTransctionDB>(
    () => FirebaseTransctionDB(),
  );

  // Regsiter Blocs
  sl.registerFactory(() => CategoriesBloc(sl()));
  sl.registerFactory(() => AddExpenseBloc(sl()));
}
