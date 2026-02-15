import 'package:expancetracker/features/transactions/data/datasources/categories_local_source.dart';
import 'package:expancetracker/features/transactions/data/datasources/categories_remote_datasource.dart';
import 'package:expancetracker/features/transactions/data/repositories/category_repository.dart';
import 'package:expancetracker/features/transactions/data/datasources/transaction_local_source.dart';
import 'package:expancetracker/features/transactions/data/datasources/transaction_remote_source.dart';
import 'package:expancetracker/features/transactions/data/repositories/transaction_repository_impl.dart';
import 'package:expancetracker/features/transactions/data/datasources/tag_local_source.dart';
import 'package:expancetracker/features/transactions/data/datasources/tag_remote_source.dart';
import 'package:expancetracker/features/transactions/data/repositories/tag_repository.dart';

import 'package:expancetracker/core/database/app_database.dart';
import 'package:expancetracker/core/services/wallet_service.dart';
import 'package:expancetracker/features/wallet/data/datasources/wallet_local_source.dart';
import 'package:expancetracker/features/wallet/data/datasources/wallet_remote_source.dart';
import 'package:expancetracker/features/wallet/data/repositories/wallet_repository.dart';
import 'package:expancetracker/features/wallet/data/repositories/wallet_repository_impl.dart';
import 'package:expancetracker/core/services/transaction_service.dart';
import 'package:expancetracker/features/transactions/data/repositories/transaction_repository.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void initializeDependencies() {
  /// Register Database
  sl.registerLazySingleton<AppDatabase>(() => AppDatabase.instance);

  /// Register DataSources
  sl.registerLazySingleton<CategoriesLocalSource>(
    () => CategoriesLocalSource(database: sl()),
  );
  sl.registerLazySingleton<CategoriesRemoteDataSource>(
    () => CategoriesRemoteDataSource(),
  );

  // Wallet Data Sources
  sl.registerLazySingleton<WalletLocalSource>(
    () => WalletLocalSource(database: sl()),
  );
  sl.registerLazySingleton<WalletRemoteSource>(() => WalletRemoteSource());

  // Transaction Data Sources
  sl.registerLazySingleton<TransactionLocalSource>(
    () => TransactionLocalSource(database: sl()),
  );
  sl.registerLazySingleton<TransactionRemoteSource>(
    () => TransactionRemoteSource(),
  );

  /// Register Repos
  sl.registerLazySingleton(
    () => CategoryRepository(localSource: sl(), remoteSource: sl()),
  );
  sl.registerLazySingleton<WalletRepository>(
    () => WalletRepositoryImpl(localSource: sl(), remoteSource: sl()),
  );
  sl.registerLazySingleton<TransactionRepository>(
    () => TransactionRepositoryImpl(localSource: sl(), remoteSource: sl()),
  );

  /// Register Services
  sl.registerLazySingleton<WalletService>(
    () => WalletService(repository: sl()),
  );
  sl.registerLazySingleton<TransactionService>(
    () => TransactionService(repository: sl(), categoryRepository: sl()),
  );

  // Tag Data Sources
  sl.registerLazySingleton<TagLocalSource>(
    () => TagLocalSource(database: sl()),
  );
  sl.registerLazySingleton<TagRemoteSource>(() => TagRemoteSource());

  sl.registerLazySingleton<TagRepository>(
    () => TagRepository(localSource: sl(), remoteSource: sl()),
  );
}
