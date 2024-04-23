// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'money_transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MoneyTransactionImpl _$$MoneyTransactionImplFromJson(
        Map<String, dynamic> json) =>
    _$MoneyTransactionImpl(
      id: json['id'] as String,
      amount: (json['amount'] as num).toDouble(),
      datetime: DateTime.parse(json['datetime'] as String),
      category: TransactionCategory.fromJson(
          json['category'] as Map<String, dynamic>),
      note: json['note'] as String?,
    );

Map<String, dynamic> _$$MoneyTransactionImplToJson(
        _$MoneyTransactionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'datetime': instance.datetime.toIso8601String(),
      'category': instance.category,
      'note': instance.note,
    };
