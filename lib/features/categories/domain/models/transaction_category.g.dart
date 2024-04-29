// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TransactionCategoryImpl _$$TransactionCategoryImplFromJson(
        Map<String, dynamic> json) =>
    _$TransactionCategoryImpl(
      uid: json['uid'] as String,
      title: json['title'] as String,
      totalAmount: (json['totalAmount'] as num?)?.toDouble() ?? 0.0,
      color: (json['color'] as num).toInt(),
      status: $enumDecode(_$TransactionStatusEnumMap, json['status']),
      icon: const IconDataConverter()
          .fromJson(json['icon'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TransactionCategoryImplToJson(
        _$TransactionCategoryImpl instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'title': instance.title,
      'totalAmount': instance.totalAmount,
      'color': instance.color,
      'status': _$TransactionStatusEnumMap[instance.status]!,
      'icon': const IconDataConverter().toJson(instance.icon),
    };

const _$TransactionStatusEnumMap = {
  TransactionStatus.income: 'income',
  TransactionStatus.expense: 'expense',
};
