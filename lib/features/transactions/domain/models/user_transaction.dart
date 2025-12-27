import 'package:dart_mappable/dart_mappable.dart';
import 'package:expancetracker/features/categories/domain/models/transaction_category.dart';

part 'user_transaction.mapper.dart';

@MappableClass()
class UserTransaction with UserTransactionMappable {
  const UserTransaction({
    required this.id,
    required this.amount,
    required this.datetime,
    required this.category,
    this.note,
  });
  final String id;
  final double amount;
  final DateTime datetime;
  final TransactionCategory category;
  final String? note;

  static final fromMap = UserTransactionMapper.fromMap;
  static final fromJson = UserTransactionMapper.fromJson;
}
