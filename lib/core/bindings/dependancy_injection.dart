import 'package:expancetracker/features/categories/domain/datasources/categories_remote_datasource.dart';
import 'package:expancetracker/features/categories/domain/repositories/categories_repository.dart';
import 'package:expancetracker/features/categories/logic/categories_bloc/categories_bloc.dart';
import 'package:expancetracker/features/overview_card/domain/repositories/summary_service.dart';
import 'package:expancetracker/features/overview_card/logic/overview_summary_bloc/overview_summary_bloc.dart';
import 'package:expancetracker/features/transactions/logic/transactions_bloc/transactions_bloc.dart';
import 'package:expancetracker/features/transactions/domain/datasources/transactions_remote_source.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void initializeDependencies() {
  /// Register DataSources
  sl.registerLazySingleton<CategoriesRemoteService>(
    () => CategoriesRemoteDataSource(),
  );

  sl.registerLazySingleton<UserTransactionServiceType>(
    () => TransctionRemoteDataSource(),
  );
  sl.registerLazySingleton<OverviewSummaryRepository>(
    () => OverviewSummaryRepository(sl()),
  );

  /// Register Repos
  sl.registerLazySingleton(() => CategoriesRepository(categoriesRemoteSource: sl()));

  // Regsiter Blocs
  sl.registerFactory(() => CategoriesBloc(sl()));
  sl.registerFactory(() => TransactionsBloc(sl()));
  sl.registerFactory(() => OverviewSummaryBloc(sl()));
}
