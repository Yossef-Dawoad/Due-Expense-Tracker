import 'package:expancetracker/features/categories/domain/models/transaction_category.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_transaction.freezed.dart';
part 'user_transaction.g.dart';

@freezed
class UserTransaction with _$UserTransaction {
  const factory UserTransaction({
    required String id,
    required double amount,
    required DateTime datetime,
    required TransactionCategory category,
    String? note,
  }) = _UserTransaction;

  factory UserTransaction.fromJson(Map<String, dynamic> json) =>
      _$UserTransactionFromJson(json);
}
