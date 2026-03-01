import 'package:expancetracker/core/common/intrefaces/datasource_interfaces.dart';
import 'package:expancetracker/features/wallet/data/models/account.dart';

/// Abstract interface for Wallet Repository.
///
/// Defines the contract for interacting with wallet accounts data.
abstract interface class WalletRepository
    implements OfflineFirstRepository<Account> {}
