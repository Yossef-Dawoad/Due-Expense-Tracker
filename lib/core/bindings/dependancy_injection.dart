import 'package:expancetracker/core/common/domain/intrefaces/firebase_base.dart';
import 'package:expancetracker/features/categories/domain/models/transaction_category.dart';
import 'package:expancetracker/features/categories/domain/services/categories_service.dart';
import 'package:expancetracker/features/categories/logic/categories_bloc/categories_bloc.dart';
import 'package:expancetracker/features/transactions/logic/transactions_bloc/transactions_bloc.dart';
import 'package:expancetracker/features/transactions/domain/models/user_transaction.dart';
import 'package:expancetracker/features/transactions/domain/services/transactions_service.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

typedef CategoriesServiceType = BaseFireBaseDB<TransactionCategory>;
typedef TransactionServiceType = BaseFireBaseDB<UserTransaction>;

void initializeDependencies() {
  /// Register Services
  sl.registerLazySingleton<CategoriesServiceType>(
    () => FirebaseCategoriesServiceImpl(),
  );
  sl.registerLazySingleton<TransactionServiceType>(
    () => FirebaseTransctionServiceImpl(),
  );

  // Regsiter Blocs
  sl.registerFactory(() => CategoriesBloc(sl()));
  sl.registerFactory(() => TransactionsBloc(sl()));
}
