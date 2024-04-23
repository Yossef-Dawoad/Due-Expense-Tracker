// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'money_transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

MoneyTransaction _$MoneyTransactionFromJson(Map<String, dynamic> json) {
  return _MoneyTransaction.fromJson(json);
}

/// @nodoc
mixin _$MoneyTransaction {
  String get id => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  DateTime get datetime => throw _privateConstructorUsedError;
  TransactionCategory get category => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MoneyTransactionCopyWith<MoneyTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MoneyTransactionCopyWith<$Res> {
  factory $MoneyTransactionCopyWith(
          MoneyTransaction value, $Res Function(MoneyTransaction) then) =
      _$MoneyTransactionCopyWithImpl<$Res, MoneyTransaction>;
  @useResult
  $Res call(
      {String id,
      double amount,
      DateTime datetime,
      TransactionCategory category,
      String? note});

  $TransactionCategoryCopyWith<$Res> get category;
}

/// @nodoc
class _$MoneyTransactionCopyWithImpl<$Res, $Val extends MoneyTransaction>
    implements $MoneyTransactionCopyWith<$Res> {
  _$MoneyTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? datetime = null,
    Object? category = null,
    Object? note = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      datetime: null == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as TransactionCategory,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $TransactionCategoryCopyWith<$Res> get category {
    return $TransactionCategoryCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MoneyTransactionImplCopyWith<$Res>
    implements $MoneyTransactionCopyWith<$Res> {
  factory _$$MoneyTransactionImplCopyWith(_$MoneyTransactionImpl value,
          $Res Function(_$MoneyTransactionImpl) then) =
      __$$MoneyTransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      double amount,
      DateTime datetime,
      TransactionCategory category,
      String? note});

  @override
  $TransactionCategoryCopyWith<$Res> get category;
}

/// @nodoc
class __$$MoneyTransactionImplCopyWithImpl<$Res>
    extends _$MoneyTransactionCopyWithImpl<$Res, _$MoneyTransactionImpl>
    implements _$$MoneyTransactionImplCopyWith<$Res> {
  __$$MoneyTransactionImplCopyWithImpl(_$MoneyTransactionImpl _value,
      $Res Function(_$MoneyTransactionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? amount = null,
    Object? datetime = null,
    Object? category = null,
    Object? note = freezed,
  }) {
    return _then(_$MoneyTransactionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      datetime: null == datetime
          ? _value.datetime
          : datetime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      category: null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as TransactionCategory,
      note: freezed == note
          ? _value.note
          : note // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MoneyTransactionImpl implements _MoneyTransaction {
  const _$MoneyTransactionImpl(
      {required this.id,
      required this.amount,
      required this.datetime,
      required this.category,
      this.note});

  factory _$MoneyTransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$MoneyTransactionImplFromJson(json);

  @override
  final String id;
  @override
  final double amount;
  @override
  final DateTime datetime;
  @override
  final TransactionCategory category;
  @override
  final String? note;

  @override
  String toString() {
    return 'MoneyTransaction(id: $id, amount: $amount, datetime: $datetime, category: $category, note: $note)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MoneyTransactionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.datetime, datetime) ||
                other.datetime == datetime) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.note, note) || other.note == note));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, amount, datetime, category, note);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MoneyTransactionImplCopyWith<_$MoneyTransactionImpl> get copyWith =>
      __$$MoneyTransactionImplCopyWithImpl<_$MoneyTransactionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MoneyTransactionImplToJson(
      this,
    );
  }
}

abstract class _MoneyTransaction implements MoneyTransaction {
  const factory _MoneyTransaction(
      {required final String id,
      required final double amount,
      required final DateTime datetime,
      required final TransactionCategory category,
      final String? note}) = _$MoneyTransactionImpl;

  factory _MoneyTransaction.fromJson(Map<String, dynamic> json) =
      _$MoneyTransactionImpl.fromJson;

  @override
  String get id;
  @override
  double get amount;
  @override
  DateTime get datetime;
  @override
  TransactionCategory get category;
  @override
  String? get note;
  @override
  @JsonKey(ignore: true)
  _$$MoneyTransactionImplCopyWith<_$MoneyTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
