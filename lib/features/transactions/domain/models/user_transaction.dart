// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:expancetracker/features/categories/domain/models/transaction_category.dart';

part 'user_transaction.freezed.dart';
part 'user_transaction.g.dart';

@freezed
class UserTransaction with _$UserTransaction {
  // needed for nested serialization
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true)
  const factory UserTransaction({
    required String id,
    required double amount,
    required DateTime datetime,
    required TransactionCategory category,
    String? note,
  }) = _UserTransaction;

  factory UserTransaction.fromJson(Map<String, Object?> json) => _$UserTransactionFromJson(json);
}
