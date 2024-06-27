import 'package:expancetracker/features/categories/domain/models/transaction_category.dart';
import 'package:expancetracker/features/transactions/domain/datasources/remote/transactions_remote_source.dart';

class OverviewSummaryRepository {
  final UserTransactionServiceType _transactionService;
  OverviewSummaryRepository(this._transactionService);

  Future<double> getTotalTransactionsAmount() async {
    final transactions = await _transactionService.getAllItems();
    final total = transactions.fold(0.0, (prev, ele) => prev + ele.amount);
    return total;
  }

  Future<double> getTotalIncomeAmount() async {
    final transactions = await _transactionService.getAllItems();
    final incomeTransactions = transactions.where(
      (transaction) => transaction.category.status == TransactionStatus.income,
    );
    final total = incomeTransactions.fold(0.0, (prev, el) => prev + el.amount);
    return total;
  }

  Future<double> getTotalExpanseAmount() async {
    final transactions = await _transactionService.getAllItems();
    final incomeTransactions = transactions.where(
      (transaction) => transaction.category.status == TransactionStatus.expense,
    );
    final total = incomeTransactions.fold(0.0, (prev, el) => prev + el.amount);
    return total;
  }
}
