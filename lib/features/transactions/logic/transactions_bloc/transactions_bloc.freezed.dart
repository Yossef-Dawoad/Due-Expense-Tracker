// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transactions_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$TransactionEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(UserTransaction transaction) addedNewExpense,
    required TResult Function() fetchedExpense,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(UserTransaction transaction)? addedNewExpense,
    TResult? Function()? fetchedExpense,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(UserTransaction transaction)? addedNewExpense,
    TResult Function()? fetchedExpense,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(AddedNewTransaction value) addedNewExpense,
    required TResult Function(FetchedAllTransactions value) fetchedExpense,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(AddedNewTransaction value)? addedNewExpense,
    TResult? Function(FetchedAllTransactions value)? fetchedExpense,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(AddedNewTransaction value)? addedNewExpense,
    TResult Function(FetchedAllTransactions value)? fetchedExpense,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionEventCopyWith<$Res> {
  factory $TransactionEventCopyWith(
          TransactionEvent value, $Res Function(TransactionEvent) then) =
      _$TransactionEventCopyWithImpl<$Res, TransactionEvent>;
}

/// @nodoc
class _$TransactionEventCopyWithImpl<$Res, $Val extends TransactionEvent>
    implements $TransactionEventCopyWith<$Res> {
  _$TransactionEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$TransactionEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'TransactionEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(UserTransaction transaction) addedNewExpense,
    required TResult Function() fetchedExpense,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(UserTransaction transaction)? addedNewExpense,
    TResult? Function()? fetchedExpense,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(UserTransaction transaction)? addedNewExpense,
    TResult Function()? fetchedExpense,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(AddedNewTransaction value) addedNewExpense,
    required TResult Function(FetchedAllTransactions value) fetchedExpense,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(AddedNewTransaction value)? addedNewExpense,
    TResult? Function(FetchedAllTransactions value)? fetchedExpense,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(AddedNewTransaction value)? addedNewExpense,
    TResult Function(FetchedAllTransactions value)? fetchedExpense,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements TransactionEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$AddedNewTransactionImplCopyWith<$Res> {
  factory _$$AddedNewTransactionImplCopyWith(_$AddedNewTransactionImpl value,
          $Res Function(_$AddedNewTransactionImpl) then) =
      __$$AddedNewTransactionImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UserTransaction transaction});

  $UserTransactionCopyWith<$Res> get transaction;
}

/// @nodoc
class __$$AddedNewTransactionImplCopyWithImpl<$Res>
    extends _$TransactionEventCopyWithImpl<$Res, _$AddedNewTransactionImpl>
    implements _$$AddedNewTransactionImplCopyWith<$Res> {
  __$$AddedNewTransactionImplCopyWithImpl(_$AddedNewTransactionImpl _value,
      $Res Function(_$AddedNewTransactionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transaction = null,
  }) {
    return _then(_$AddedNewTransactionImpl(
      null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as UserTransaction,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $UserTransactionCopyWith<$Res> get transaction {
    return $UserTransactionCopyWith<$Res>(_value.transaction, (value) {
      return _then(_value.copyWith(transaction: value));
    });
  }
}

/// @nodoc

class _$AddedNewTransactionImpl implements AddedNewTransaction {
  const _$AddedNewTransactionImpl(this.transaction);

  @override
  final UserTransaction transaction;

  @override
  String toString() {
    return 'TransactionEvent.addedNewExpense(transaction: $transaction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddedNewTransactionImpl &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, transaction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddedNewTransactionImplCopyWith<_$AddedNewTransactionImpl> get copyWith =>
      __$$AddedNewTransactionImplCopyWithImpl<_$AddedNewTransactionImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(UserTransaction transaction) addedNewExpense,
    required TResult Function() fetchedExpense,
  }) {
    return addedNewExpense(transaction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(UserTransaction transaction)? addedNewExpense,
    TResult? Function()? fetchedExpense,
  }) {
    return addedNewExpense?.call(transaction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(UserTransaction transaction)? addedNewExpense,
    TResult Function()? fetchedExpense,
    required TResult orElse(),
  }) {
    if (addedNewExpense != null) {
      return addedNewExpense(transaction);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(AddedNewTransaction value) addedNewExpense,
    required TResult Function(FetchedAllTransactions value) fetchedExpense,
  }) {
    return addedNewExpense(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(AddedNewTransaction value)? addedNewExpense,
    TResult? Function(FetchedAllTransactions value)? fetchedExpense,
  }) {
    return addedNewExpense?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(AddedNewTransaction value)? addedNewExpense,
    TResult Function(FetchedAllTransactions value)? fetchedExpense,
    required TResult orElse(),
  }) {
    if (addedNewExpense != null) {
      return addedNewExpense(this);
    }
    return orElse();
  }
}

abstract class AddedNewTransaction implements TransactionEvent {
  const factory AddedNewTransaction(final UserTransaction transaction) =
      _$AddedNewTransactionImpl;

  UserTransaction get transaction;
  @JsonKey(ignore: true)
  _$$AddedNewTransactionImplCopyWith<_$AddedNewTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchedAllTransactionsImplCopyWith<$Res> {
  factory _$$FetchedAllTransactionsImplCopyWith(
          _$FetchedAllTransactionsImpl value,
          $Res Function(_$FetchedAllTransactionsImpl) then) =
      __$$FetchedAllTransactionsImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchedAllTransactionsImplCopyWithImpl<$Res>
    extends _$TransactionEventCopyWithImpl<$Res, _$FetchedAllTransactionsImpl>
    implements _$$FetchedAllTransactionsImplCopyWith<$Res> {
  __$$FetchedAllTransactionsImplCopyWithImpl(
      _$FetchedAllTransactionsImpl _value,
      $Res Function(_$FetchedAllTransactionsImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchedAllTransactionsImpl implements FetchedAllTransactions {
  const _$FetchedAllTransactionsImpl();

  @override
  String toString() {
    return 'TransactionEvent.fetchedExpense()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetchedAllTransactionsImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(UserTransaction transaction) addedNewExpense,
    required TResult Function() fetchedExpense,
  }) {
    return fetchedExpense();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(UserTransaction transaction)? addedNewExpense,
    TResult? Function()? fetchedExpense,
  }) {
    return fetchedExpense?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(UserTransaction transaction)? addedNewExpense,
    TResult Function()? fetchedExpense,
    required TResult orElse(),
  }) {
    if (fetchedExpense != null) {
      return fetchedExpense();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(AddedNewTransaction value) addedNewExpense,
    required TResult Function(FetchedAllTransactions value) fetchedExpense,
  }) {
    return fetchedExpense(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(AddedNewTransaction value)? addedNewExpense,
    TResult? Function(FetchedAllTransactions value)? fetchedExpense,
  }) {
    return fetchedExpense?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(AddedNewTransaction value)? addedNewExpense,
    TResult Function(FetchedAllTransactions value)? fetchedExpense,
    required TResult orElse(),
  }) {
    if (fetchedExpense != null) {
      return fetchedExpense(this);
    }
    return orElse();
  }
}

abstract class FetchedAllTransactions implements TransactionEvent {
  const factory FetchedAllTransactions() = _$FetchedAllTransactionsImpl;
}

/// @nodoc
mixin _$TransactionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() addedSuccess,
    required TResult Function(List<UserTransaction> transactions)
        fetshedSuccess,
    required TResult Function(String message) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? addedSuccess,
    TResult? Function(List<UserTransaction> transactions)? fetshedSuccess,
    TResult? Function(String message)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? addedSuccess,
    TResult Function(List<UserTransaction> transactions)? fetshedSuccess,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_AddedSuccess value) addedSuccess,
    required TResult Function(_FetshedSuccess value) fetshedSuccess,
    required TResult Function(_Failure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AddedSuccess value)? addedSuccess,
    TResult? Function(_FetshedSuccess value)? fetshedSuccess,
    TResult? Function(_Failure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_AddedSuccess value)? addedSuccess,
    TResult Function(_FetshedSuccess value)? fetshedSuccess,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionStateCopyWith<$Res> {
  factory $TransactionStateCopyWith(
          TransactionState value, $Res Function(TransactionState) then) =
      _$TransactionStateCopyWithImpl<$Res, TransactionState>;
}

/// @nodoc
class _$TransactionStateCopyWithImpl<$Res, $Val extends TransactionState>
    implements $TransactionStateCopyWith<$Res> {
  _$TransactionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$TransactionStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'TransactionState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() addedSuccess,
    required TResult Function(List<UserTransaction> transactions)
        fetshedSuccess,
    required TResult Function(String message) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? addedSuccess,
    TResult? Function(List<UserTransaction> transactions)? fetshedSuccess,
    TResult? Function(String message)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? addedSuccess,
    TResult Function(List<UserTransaction> transactions)? fetshedSuccess,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_AddedSuccess value) addedSuccess,
    required TResult Function(_FetshedSuccess value) fetshedSuccess,
    required TResult Function(_Failure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AddedSuccess value)? addedSuccess,
    TResult? Function(_FetshedSuccess value)? fetshedSuccess,
    TResult? Function(_Failure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_AddedSuccess value)? addedSuccess,
    TResult Function(_FetshedSuccess value)? fetshedSuccess,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements TransactionState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$TransactionStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl implements _Loading {
  const _$LoadingImpl();

  @override
  String toString() {
    return 'TransactionState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() addedSuccess,
    required TResult Function(List<UserTransaction> transactions)
        fetshedSuccess,
    required TResult Function(String message) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? addedSuccess,
    TResult? Function(List<UserTransaction> transactions)? fetshedSuccess,
    TResult? Function(String message)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? addedSuccess,
    TResult Function(List<UserTransaction> transactions)? fetshedSuccess,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_AddedSuccess value) addedSuccess,
    required TResult Function(_FetshedSuccess value) fetshedSuccess,
    required TResult Function(_Failure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AddedSuccess value)? addedSuccess,
    TResult? Function(_FetshedSuccess value)? fetshedSuccess,
    TResult? Function(_Failure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_AddedSuccess value)? addedSuccess,
    TResult Function(_FetshedSuccess value)? fetshedSuccess,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements TransactionState {
  const factory _Loading() = _$LoadingImpl;
}

/// @nodoc
abstract class _$$AddedSuccessImplCopyWith<$Res> {
  factory _$$AddedSuccessImplCopyWith(
          _$AddedSuccessImpl value, $Res Function(_$AddedSuccessImpl) then) =
      __$$AddedSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AddedSuccessImplCopyWithImpl<$Res>
    extends _$TransactionStateCopyWithImpl<$Res, _$AddedSuccessImpl>
    implements _$$AddedSuccessImplCopyWith<$Res> {
  __$$AddedSuccessImplCopyWithImpl(
      _$AddedSuccessImpl _value, $Res Function(_$AddedSuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AddedSuccessImpl implements _AddedSuccess {
  const _$AddedSuccessImpl();

  @override
  String toString() {
    return 'TransactionState.addedSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$AddedSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() addedSuccess,
    required TResult Function(List<UserTransaction> transactions)
        fetshedSuccess,
    required TResult Function(String message) failure,
  }) {
    return addedSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? addedSuccess,
    TResult? Function(List<UserTransaction> transactions)? fetshedSuccess,
    TResult? Function(String message)? failure,
  }) {
    return addedSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? addedSuccess,
    TResult Function(List<UserTransaction> transactions)? fetshedSuccess,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (addedSuccess != null) {
      return addedSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_AddedSuccess value) addedSuccess,
    required TResult Function(_FetshedSuccess value) fetshedSuccess,
    required TResult Function(_Failure value) failure,
  }) {
    return addedSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AddedSuccess value)? addedSuccess,
    TResult? Function(_FetshedSuccess value)? fetshedSuccess,
    TResult? Function(_Failure value)? failure,
  }) {
    return addedSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_AddedSuccess value)? addedSuccess,
    TResult Function(_FetshedSuccess value)? fetshedSuccess,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (addedSuccess != null) {
      return addedSuccess(this);
    }
    return orElse();
  }
}

abstract class _AddedSuccess implements TransactionState {
  const factory _AddedSuccess() = _$AddedSuccessImpl;
}

/// @nodoc
abstract class _$$FetshedSuccessImplCopyWith<$Res> {
  factory _$$FetshedSuccessImplCopyWith(_$FetshedSuccessImpl value,
          $Res Function(_$FetshedSuccessImpl) then) =
      __$$FetshedSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<UserTransaction> transactions});
}

/// @nodoc
class __$$FetshedSuccessImplCopyWithImpl<$Res>
    extends _$TransactionStateCopyWithImpl<$Res, _$FetshedSuccessImpl>
    implements _$$FetshedSuccessImplCopyWith<$Res> {
  __$$FetshedSuccessImplCopyWithImpl(
      _$FetshedSuccessImpl _value, $Res Function(_$FetshedSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactions = null,
  }) {
    return _then(_$FetshedSuccessImpl(
      null == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<UserTransaction>,
    ));
  }
}

/// @nodoc

class _$FetshedSuccessImpl implements _FetshedSuccess {
  const _$FetshedSuccessImpl(final List<UserTransaction> transactions)
      : _transactions = transactions;

  final List<UserTransaction> _transactions;
  @override
  List<UserTransaction> get transactions {
    if (_transactions is EqualUnmodifiableListView) return _transactions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transactions);
  }

  @override
  String toString() {
    return 'TransactionState.fetshedSuccess(transactions: $transactions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetshedSuccessImpl &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_transactions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetshedSuccessImplCopyWith<_$FetshedSuccessImpl> get copyWith =>
      __$$FetshedSuccessImplCopyWithImpl<_$FetshedSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() addedSuccess,
    required TResult Function(List<UserTransaction> transactions)
        fetshedSuccess,
    required TResult Function(String message) failure,
  }) {
    return fetshedSuccess(transactions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? addedSuccess,
    TResult? Function(List<UserTransaction> transactions)? fetshedSuccess,
    TResult? Function(String message)? failure,
  }) {
    return fetshedSuccess?.call(transactions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? addedSuccess,
    TResult Function(List<UserTransaction> transactions)? fetshedSuccess,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (fetshedSuccess != null) {
      return fetshedSuccess(transactions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_AddedSuccess value) addedSuccess,
    required TResult Function(_FetshedSuccess value) fetshedSuccess,
    required TResult Function(_Failure value) failure,
  }) {
    return fetshedSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AddedSuccess value)? addedSuccess,
    TResult? Function(_FetshedSuccess value)? fetshedSuccess,
    TResult? Function(_Failure value)? failure,
  }) {
    return fetshedSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_AddedSuccess value)? addedSuccess,
    TResult Function(_FetshedSuccess value)? fetshedSuccess,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (fetshedSuccess != null) {
      return fetshedSuccess(this);
    }
    return orElse();
  }
}

abstract class _FetshedSuccess implements TransactionState {
  const factory _FetshedSuccess(final List<UserTransaction> transactions) =
      _$FetshedSuccessImpl;

  List<UserTransaction> get transactions;
  @JsonKey(ignore: true)
  _$$FetshedSuccessImplCopyWith<_$FetshedSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<$Res> {
  factory _$$FailureImplCopyWith(
          _$FailureImpl value, $Res Function(_$FailureImpl) then) =
      __$$FailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$FailureImplCopyWithImpl<$Res>
    extends _$TransactionStateCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl _value, $Res Function(_$FailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$FailureImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FailureImpl implements _Failure {
  const _$FailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'TransactionState.failure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      __$$FailureImplCopyWithImpl<_$FailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() addedSuccess,
    required TResult Function(List<UserTransaction> transactions)
        fetshedSuccess,
    required TResult Function(String message) failure,
  }) {
    return failure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? addedSuccess,
    TResult? Function(List<UserTransaction> transactions)? fetshedSuccess,
    TResult? Function(String message)? failure,
  }) {
    return failure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? addedSuccess,
    TResult Function(List<UserTransaction> transactions)? fetshedSuccess,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_AddedSuccess value) addedSuccess,
    required TResult Function(_FetshedSuccess value) fetshedSuccess,
    required TResult Function(_Failure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AddedSuccess value)? addedSuccess,
    TResult? Function(_FetshedSuccess value)? fetshedSuccess,
    TResult? Function(_Failure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_AddedSuccess value)? addedSuccess,
    TResult Function(_FetshedSuccess value)? fetshedSuccess,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements TransactionState {
  const factory _Failure(final String message) = _$FailureImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
