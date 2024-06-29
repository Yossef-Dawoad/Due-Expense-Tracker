import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:expancetracker/core/utils/network/network_manager.dart';
import 'package:expancetracker/features/categories/domain/datasources/local/database/category_table.dart';
import 'package:expancetracker/features/categories/domain/datasources/local/transaction_local_source.dart';
import 'package:expancetracker/features/categories/domain/datasources/remote/categories_remote_source.dart';
import 'package:expancetracker/features/categories/domain/repositories/categories_repository.dart';
import 'package:expancetracker/features/categories/logic/categories_bloc/categories_bloc.dart';
import 'package:expancetracker/features/overview_card/domain/repositories/summary_service.dart';
import 'package:expancetracker/features/overview_card/logic/overview_summary_bloc/overview_summary_bloc.dart';
import 'package:expancetracker/features/transactions/domain/datasources/local/database/transaction_table.dart';
import 'package:expancetracker/features/transactions/domain/datasources/local/transaction_local_source.dart';
import 'package:expancetracker/features/transactions/domain/repositories/transaction_repository.dart';
import 'package:expancetracker/features/transactions/logic/transactions_bloc/transactions_bloc.dart';
import 'package:expancetracker/features/transactions/domain/datasources/remote/transactions_remote_source.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void initializeDependencies() {
  /////////////----------- APP Services---------///////////////
  sl.registerLazySingleton(() => Connectivity());
  sl.registerLazySingleton<NetworkManagerInterface>(() => NetworkManager(sl()));

  /// Register DataSources

  sl.registerLazySingleton<OverviewSummaryRepository>(
    () => OverviewSummaryRepository(sl()),
  );

  /// /////////////----------- Features Dependencies---------///////////////
  initTransactionDependencies();
  initCategoriesDependencies();

  // Regsiter Blocs
  sl.registerFactory(() => CategoriesBloc(sl()));
  sl.registerFactory(() => TransactionsBloc(sl()));
  sl.registerFactory(() => OverviewSummaryBloc(sl()));
}

void initTransactionDependencies() {
  //////////////////// DataSources ////////////////////
  ///Remote
  sl.registerLazySingleton<UserTransactionRemoteInterface>(
    () => TransctionRemoteSource(),
  );

  ///Local
  sl.registerLazySingleton(() => TransactionsDao(sl()));
  sl.registerLazySingleton<TransactionLocalSourceInterface>(
    () => TransactionLocalSource(sl()),
  );

  /// Register Repos
  sl.registerLazySingleton(
    () => TransactionRepository(
      transactionLocalSource: sl(),
      transctionRemoteSource: sl(),
    ),
  );

  /// Blocs
}

void initCategoriesDependencies() {
  //////////////////// DataSources ////////////////////
  ///Remote
  sl.registerLazySingleton<CategoriesRemoteInterface>(
    () => CategoriesRemoteDataSource(),
  );

  ///Local
  sl.registerLazySingleton(() => CategoriesDao(sl()));
  sl.registerLazySingleton<CategoryLocalInterface>(
    () => CategoryLocalSource(sl()),
  );

  //////////////////// Repositories ////////////////////
  sl.registerLazySingleton(
    () => CategoriesRepository(
      categoriesLocalSource: sl(),
      categoriesRemoteSource: sl(),
    ),
  );

  /// Blocs
}
