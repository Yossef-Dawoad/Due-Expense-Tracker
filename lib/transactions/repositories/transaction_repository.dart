import 'package:expancetracker/core/common/intrefaces/datasource_interfaces.dart';
import 'package:expancetracker/transactions/models/transaction.dart';

/// Repository interface for Transactions.
///
/// Follows Clean Architecture: Domain defines the contract, Data implements it.
abstract interface class TransactionRepository
    implements OfflineFirstRepository<Transaction> {}
