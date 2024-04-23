import 'package:expancetracker/core/common/domain/models/transaction_category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'money_transaction.freezed.dart';
part 'money_transaction.g.dart';

@freezed
class MoneyTransaction with _$MoneyTransaction {
  const factory MoneyTransaction({
    required String id,
    required double amount,
    required DateTime datetime,
    required TransactionCategory category,
    String? note,
  }) = _MoneyTransaction;

  factory MoneyTransaction.fromJson(Map<String, dynamic> json) =>
      _$MoneyTransactionFromJson(json);
}
