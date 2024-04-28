// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserTransactionImpl _$$UserTransactionImplFromJson(
        Map<String, dynamic> json) =>
    _$UserTransactionImpl(
      id: json['id'] as String,
      amount: (json['amount'] as num).toDouble(),
      datetime: DateTime.parse(json['datetime'] as String),
      category: TransactionCategory.fromJson(
          json['category'] as Map<String, dynamic>),
      note: json['note'] as String?,
    );

Map<String, dynamic> _$$UserTransactionImplToJson(
        _$UserTransactionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'datetime': instance.datetime.toIso8601String(),
      'category': instance.category,
      'note': instance.note,
    };
