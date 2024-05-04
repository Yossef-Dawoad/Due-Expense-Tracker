// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_transaction.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserTransaction _$UserTransactionFromJson(Map<String, dynamic> json) {
  return _UserTransaction.fromJson(json);
}

/// @nodoc
mixin _$UserTransaction {
  String get id => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;
  DateTime get datetime => throw _privateConstructorUsedError;
  TransactionCategory get category => throw _privateConstructorUsedError;
  String? get note => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserTransactionCopyWith<UserTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserTransactionCopyWith<$Res> {
  factory $UserTransactionCopyWith(
          UserTransaction value, $Res Function(UserTransaction) then) =
      _$UserTransactionCopyWithImpl<$Res, UserTransaction>;
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
class _$UserTransactionCopyWithImpl<$Res, $Val extends UserTransaction>
    implements $UserTransactionCopyWith<$Res> {
  _$UserTransactionCopyWithImpl(this._value, this._then);

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
abstract class _$$UserTransactionImplCopyWith<$Res>
    implements $UserTransactionCopyWith<$Res> {
  factory _$$UserTransactionImplCopyWith(_$UserTransactionImpl value,
          $Res Function(_$UserTransactionImpl) then) =
      __$$UserTransactionImplCopyWithImpl<$Res>;
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
class __$$UserTransactionImplCopyWithImpl<$Res>
    extends _$UserTransactionCopyWithImpl<$Res, _$UserTransactionImpl>
    implements _$$UserTransactionImplCopyWith<$Res> {
  __$$UserTransactionImplCopyWithImpl(
      _$UserTransactionImpl _value, $Res Function(_$UserTransactionImpl) _then)
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
    return _then(_$UserTransactionImpl(
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

@JsonSerializable(explicitToJson: true)
class _$UserTransactionImpl
    with DiagnosticableTreeMixin
    implements _UserTransaction {
  const _$UserTransactionImpl(
      {required this.id,
      required this.amount,
      required this.datetime,
      required this.category,
      this.note});

  factory _$UserTransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserTransactionImplFromJson(json);

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
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserTransaction(id: $id, amount: $amount, datetime: $datetime, category: $category, note: $note)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserTransaction'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('amount', amount))
      ..add(DiagnosticsProperty('datetime', datetime))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('note', note));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserTransactionImpl &&
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
  _$$UserTransactionImplCopyWith<_$UserTransactionImpl> get copyWith =>
      __$$UserTransactionImplCopyWithImpl<_$UserTransactionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserTransactionImplToJson(
      this,
    );
  }
}

abstract class _UserTransaction implements UserTransaction {
  const factory _UserTransaction(
      {required final String id,
      required final double amount,
      required final DateTime datetime,
      required final TransactionCategory category,
      final String? note}) = _$UserTransactionImpl;

  factory _UserTransaction.fromJson(Map<String, dynamic> json) =
      _$UserTransactionImpl.fromJson;

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
  _$$UserTransactionImplCopyWith<_$UserTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
