import 'package:flutter/foundation.dart';

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

import '../core/abstractions/database_abstraction.dart';
import '../core/utils/http/http_abstraction.dart';
import '../core/utils/http/http_interceptor.dart';
import '../core/utils/internal_notification/notify_service.dart';
import '../core/utils/locator.dart';
import '../core/utils/navigation/router_service.dart';
import 'route_config.dart';

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
    builder: () => CategoriesLocalSource(database: locator()),
    lazy: true,
  ),
  Module<CategoriesRemoteDataSource>(
    builder: () => CategoriesRemoteDataSource(),
    lazy: true,
  ),

  // Wallet Data Sources
  Module<WalletLocalSource>(
    builder: () => WalletLocalSource(database: locator()),
    lazy: true,
  ),
  Module<WalletRemoteSource>(builder: () => WalletRemoteSource(), lazy: true),

  // Transaction Data Sources
  Module<TransactionLocalSource>(
    builder: () => TransactionLocalSource(database: locator()),
    lazy: true,
  ),
  Module<TransactionRemoteSource>(
    builder: () => TransactionRemoteSource(),
    lazy: true,
  ),

  /// Register Repos
  Module<CategoryRepository>(
    builder: () =>
        CategoryRepository(localSource: locator(), remoteSource: locator()),
    lazy: true,
  ),
  Module<WalletRepository>(
    builder: () =>
        WalletRepositoryImpl(localSource: locator(), remoteSource: locator()),
    lazy: true,
  ),
  Module<TransactionRepository>(
    builder: () => TransactionRepositoryImpl(
      localSource: locator(),
      remoteSource: locator(),
    ),
    lazy: true,
  ),

  /// Register Services
  Module<WalletService>(
    builder: () => WalletService(repository: locator()),
    lazy: true,
  ),
  Module<TransactionService>(
    builder: () => TransactionService(
      repository: locator(),
      categoryRepository: locator(),
    ),
    lazy: true,
  ),

  // Tag Data Sources
  Module<TagLocalSource>(
    builder: () => TagLocalSource(database: locator()),
    lazy: true,
  ),
  Module<TagRemoteSource>(builder: () => TagRemoteSource(), lazy: true),

  Module<TagRepository>(
    builder: () =>
        TagRepository(localSource: locator(), remoteSource: locator()),
    lazy: true,
  ),
];
