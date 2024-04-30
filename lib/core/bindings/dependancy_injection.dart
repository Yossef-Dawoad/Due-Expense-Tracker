import 'package:expancetracker/features/categories/domain/services/categories_service.dart';
import 'package:expancetracker/features/categories/logic/categories_bloc/categories_bloc.dart';
import 'package:expancetracker/features/overview_card/data/services/summary_service.dart';
import 'package:expancetracker/features/overview_card/logic/overview_summary_bloc/overview_summary_bloc.dart';
import 'package:expancetracker/features/transactions/logic/transactions_bloc/transactions_bloc.dart';
import 'package:expancetracker/features/transactions/domain/services/transactions_service.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void initializeDependencies() {
  /// Register Services
  sl.registerLazySingleton<CategoriesServiceType>(
    () => FirebaseCategoriesServiceImpl(),
  );
  sl.registerLazySingleton<TransactionServiceType>(
    () => FirebaseTransctionServiceImpl(),
  );
  sl.registerLazySingleton<OverviewSummaryService>(
    () => OverviewSummaryService(sl()),
  );

  // Regsiter Blocs
  sl.registerFactory(() => CategoriesBloc(sl()));
  sl.registerFactory(() => TransactionsBloc(sl()));
  sl.registerFactory(() => OverviewSummaryBloc(sl()));
}
