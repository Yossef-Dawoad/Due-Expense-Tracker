import 'package:flutter/foundation.dart';

import 'package:expancetracker/transactions/datasources/local/categories_local_source.dart';
import 'package:expancetracker/transactions/datasources/remote/categories_remote_datasource.dart';
import 'package:expancetracker/transactions/repositories/category_repository.dart';
import 'package:expancetracker/transactions/datasources/local/transaction_local_source.dart';
import 'package:expancetracker/transactions/datasources/remote/transaction_remote_source.dart';
import 'package:expancetracker/transactions/repositories/transaction_repository.dart';
import 'package:expancetracker/transactions/datasources/local/tag_local_source.dart';
import 'package:expancetracker/transactions/datasources/remote/tag_remote_source.dart';
import 'package:expancetracker/transactions/repositories/tag_repository.dart';

import 'package:expancetracker/core/database/app_database.dart';
import 'package:expancetracker/core/services/wallet_service.dart';
import 'package:expancetracker/wallet/data/datasources/wallet_local_source.dart';
import 'package:expancetracker/wallet/data/datasources/wallet_remote_source.dart';
import 'package:expancetracker/wallet/data/repositories/wallet_repository.dart';
import 'package:expancetracker/wallet/data/repositories/wallet_repository_impl.dart';
import 'package:expancetracker/core/services/transaction_service.dart';

import 'package:expancetracker/core/abstractions/database_abstraction.dart';
import 'package:expancetracker/core/services/connectivity_service.dart';
import 'package:expancetracker/core/services/sync_orchestration_service.dart';
import 'package:expancetracker/core/utils/http/http_abstraction.dart';
import 'package:expancetracker/core/utils/http/http_interceptor.dart';
import 'package:expancetracker/core/utils/internal_notification/notify_service.dart';
import 'package:expancetracker/core/utils/locator.dart';
import 'package:expancetracker/core/utils/navigation/router_service.dart';
import 'package:expancetracker/config/route_config.dart';

final modules = [
  Module<RouterService>(
    builder: () => RouterService(routes: routes),
    lazy: false,
  ),
  Module<NotifyService>(builder: () => NotifyService(), lazy: false),
  Module<OfflineDatabaseAbstraction>(
    builder: () => DriftDatabaseProvider(AppDatabase.instance),
    lazy: false,
  ),
  Module<HttpAbstraction>(
    builder: () => HttpAbstraction(
      interceptors: [
        LoggingInterceptor(
          logBody: !kReleaseMode, // Only log bodies in debug mode
        ),
      ],
    ),
    lazy: true,
  ),

  /// Register Database
  Module<AppDatabase>(builder: () => AppDatabase.instance, lazy: true),

  /// Register DataSources
  Module<CategoriesLocalSource>(
    builder: () =>
        CategoriesLocalSource(database: locator<OfflineDatabaseAbstraction>()),
    lazy: true,
  ),
  Module<CategoriesRemoteDataSource>(
    builder: () => CategoriesRemoteDataSource(),
    lazy: true,
  ),

  // Wallet Data Sources
  Module<WalletLocalSource>(
    builder: () =>
        WalletLocalSource(database: locator<OfflineDatabaseAbstraction>()),
    lazy: true,
  ),
  Module<WalletRemoteSource>(builder: () => WalletRemoteSource(), lazy: true),

  // Transaction Data Sources
  Module<TransactionLocalSource>(
    builder: () =>
        TransactionLocalSource(database: locator<OfflineDatabaseAbstraction>()),
    lazy: true,
  ),
  Module<TransactionRemoteSource>(
    builder: () => TransactionRemoteSource(),
    lazy: true,
  ),

  /// Register Repos
  Module<CategoryRepository>(
    builder: () => CategoryRepository(
      localSource: locator(),
      remoteSource: locator(),
      connectivityService: locator(),
    ),
    lazy: true,
  ),
  Module<WalletRepository>(
    builder: () => WalletRepositoryImpl(
      localSource: locator(),
      remoteSource: locator(),
      connectivityService: locator(),
    ),
    lazy: true,
  ),
  Module<TransactionRepository>(
    builder: () => TransactionRepository(
      localSource: locator(),
      remoteSource: locator(),
      connectivityService: locator(),
    ),
    lazy: true,
  ),

  // Tag Data Sources
  Module<TagLocalSource>(
    builder: () =>
        TagLocalSource(database: locator<OfflineDatabaseAbstraction>()),
    lazy: true,
  ),
  Module<TagRemoteSource>(builder: () => TagRemoteSource(), lazy: true),

  Module<TagRepository>(
    builder: () => TagRepository(
      localSource: locator(),
      remoteSource: locator(),
      connectivityService: locator(),
    ),
    lazy: true,
  ),

  /// Register Services
  Module<WalletService>(
    builder: () => WalletService(
      repository: locator(),
      syncOrchestrationService: locator(),
    ),
    lazy: true,
  ),
  Module<ConnectivityService>(
    builder: () => ConnectivityService(),
    lazy: false,
  ),
  Module<SyncOrchestrationService>(
    builder: () => SyncOrchestrationService(
      repositories: [
        locator<TransactionRepository>(),
        locator<WalletRepository>(),
        locator<CategoryRepository>(),
        locator<TagRepository>(),
      ],
      connectivityService: locator(),
      notifyService: locator(),
    ),
    lazy: false,
  ),
  Module<TransactionService>(
    builder: () => TransactionService(
      repository: locator(),
      categoryRepository: locator(),
      tagRepository: locator(),
      syncOrchestrationService: locator(),
    ),
    lazy: true,
  ),
];
