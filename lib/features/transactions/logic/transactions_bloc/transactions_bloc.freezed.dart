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
    required TResult Function(String message) addedfailure,
    required TResult Function(String message) fetchedfailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? addedSuccess,
    TResult? Function(List<UserTransaction> transactions)? fetshedSuccess,
    TResult? Function(String message)? addedfailure,
    TResult? Function(String message)? fetchedfailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? addedSuccess,
    TResult Function(List<UserTransaction> transactions)? fetshedSuccess,
    TResult Function(String message)? addedfailure,
    TResult Function(String message)? fetchedfailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(TransactionLoading value) loading,
    required TResult Function(TransactionAddedSuccess value) addedSuccess,
    required TResult Function(TransactionFetshedSuccess value) fetshedSuccess,
    required TResult Function(TransactionAddedFailure value) addedfailure,
    required TResult Function(TransactionFetchedFailure value) fetchedfailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(TransactionLoading value)? loading,
    TResult? Function(TransactionAddedSuccess value)? addedSuccess,
    TResult? Function(TransactionFetshedSuccess value)? fetshedSuccess,
    TResult? Function(TransactionAddedFailure value)? addedfailure,
    TResult? Function(TransactionFetchedFailure value)? fetchedfailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(TransactionLoading value)? loading,
    TResult Function(TransactionAddedSuccess value)? addedSuccess,
    TResult Function(TransactionFetshedSuccess value)? fetshedSuccess,
    TResult Function(TransactionAddedFailure value)? addedfailure,
    TResult Function(TransactionFetchedFailure value)? fetchedfailure,
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
    required TResult Function(String message) addedfailure,
    required TResult Function(String message) fetchedfailure,
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
    TResult? Function(String message)? addedfailure,
    TResult? Function(String message)? fetchedfailure,
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
    TResult Function(String message)? addedfailure,
    TResult Function(String message)? fetchedfailure,
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
    required TResult Function(TransactionLoading value) loading,
    required TResult Function(TransactionAddedSuccess value) addedSuccess,
    required TResult Function(TransactionFetshedSuccess value) fetshedSuccess,
    required TResult Function(TransactionAddedFailure value) addedfailure,
    required TResult Function(TransactionFetchedFailure value) fetchedfailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(TransactionLoading value)? loading,
    TResult? Function(TransactionAddedSuccess value)? addedSuccess,
    TResult? Function(TransactionFetshedSuccess value)? fetshedSuccess,
    TResult? Function(TransactionAddedFailure value)? addedfailure,
    TResult? Function(TransactionFetchedFailure value)? fetchedfailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(TransactionLoading value)? loading,
    TResult Function(TransactionAddedSuccess value)? addedSuccess,
    TResult Function(TransactionFetshedSuccess value)? fetshedSuccess,
    TResult Function(TransactionAddedFailure value)? addedfailure,
    TResult Function(TransactionFetchedFailure value)? fetchedfailure,
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
abstract class _$$TransactionLoadingImplCopyWith<$Res> {
  factory _$$TransactionLoadingImplCopyWith(_$TransactionLoadingImpl value,
          $Res Function(_$TransactionLoadingImpl) then) =
      __$$TransactionLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TransactionLoadingImplCopyWithImpl<$Res>
    extends _$TransactionStateCopyWithImpl<$Res, _$TransactionLoadingImpl>
    implements _$$TransactionLoadingImplCopyWith<$Res> {
  __$$TransactionLoadingImplCopyWithImpl(_$TransactionLoadingImpl _value,
      $Res Function(_$TransactionLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TransactionLoadingImpl implements TransactionLoading {
  const _$TransactionLoadingImpl();

  @override
  String toString() {
    return 'TransactionState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$TransactionLoadingImpl);
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
    required TResult Function(String message) addedfailure,
    required TResult Function(String message) fetchedfailure,
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
    TResult? Function(String message)? addedfailure,
    TResult? Function(String message)? fetchedfailure,
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
    TResult Function(String message)? addedfailure,
    TResult Function(String message)? fetchedfailure,
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
    required TResult Function(TransactionLoading value) loading,
    required TResult Function(TransactionAddedSuccess value) addedSuccess,
    required TResult Function(TransactionFetshedSuccess value) fetshedSuccess,
    required TResult Function(TransactionAddedFailure value) addedfailure,
    required TResult Function(TransactionFetchedFailure value) fetchedfailure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(TransactionLoading value)? loading,
    TResult? Function(TransactionAddedSuccess value)? addedSuccess,
    TResult? Function(TransactionFetshedSuccess value)? fetshedSuccess,
    TResult? Function(TransactionAddedFailure value)? addedfailure,
    TResult? Function(TransactionFetchedFailure value)? fetchedfailure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(TransactionLoading value)? loading,
    TResult Function(TransactionAddedSuccess value)? addedSuccess,
    TResult Function(TransactionFetshedSuccess value)? fetshedSuccess,
    TResult Function(TransactionAddedFailure value)? addedfailure,
    TResult Function(TransactionFetchedFailure value)? fetchedfailure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class TransactionLoading implements TransactionState {
  const factory TransactionLoading() = _$TransactionLoadingImpl;
}

/// @nodoc
abstract class _$$TransactionAddedSuccessImplCopyWith<$Res> {
  factory _$$TransactionAddedSuccessImplCopyWith(
          _$TransactionAddedSuccessImpl value,
          $Res Function(_$TransactionAddedSuccessImpl) then) =
      __$$TransactionAddedSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TransactionAddedSuccessImplCopyWithImpl<$Res>
    extends _$TransactionStateCopyWithImpl<$Res, _$TransactionAddedSuccessImpl>
    implements _$$TransactionAddedSuccessImplCopyWith<$Res> {
  __$$TransactionAddedSuccessImplCopyWithImpl(
      _$TransactionAddedSuccessImpl _value,
      $Res Function(_$TransactionAddedSuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TransactionAddedSuccessImpl implements TransactionAddedSuccess {
  const _$TransactionAddedSuccessImpl();

  @override
  String toString() {
    return 'TransactionState.addedSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionAddedSuccessImpl);
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
    required TResult Function(String message) addedfailure,
    required TResult Function(String message) fetchedfailure,
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
    TResult? Function(String message)? addedfailure,
    TResult? Function(String message)? fetchedfailure,
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
    TResult Function(String message)? addedfailure,
    TResult Function(String message)? fetchedfailure,
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
    required TResult Function(TransactionLoading value) loading,
    required TResult Function(TransactionAddedSuccess value) addedSuccess,
    required TResult Function(TransactionFetshedSuccess value) fetshedSuccess,
    required TResult Function(TransactionAddedFailure value) addedfailure,
    required TResult Function(TransactionFetchedFailure value) fetchedfailure,
  }) {
    return addedSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(TransactionLoading value)? loading,
    TResult? Function(TransactionAddedSuccess value)? addedSuccess,
    TResult? Function(TransactionFetshedSuccess value)? fetshedSuccess,
    TResult? Function(TransactionAddedFailure value)? addedfailure,
    TResult? Function(TransactionFetchedFailure value)? fetchedfailure,
  }) {
    return addedSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(TransactionLoading value)? loading,
    TResult Function(TransactionAddedSuccess value)? addedSuccess,
    TResult Function(TransactionFetshedSuccess value)? fetshedSuccess,
    TResult Function(TransactionAddedFailure value)? addedfailure,
    TResult Function(TransactionFetchedFailure value)? fetchedfailure,
    required TResult orElse(),
  }) {
    if (addedSuccess != null) {
      return addedSuccess(this);
    }
    return orElse();
  }
}

abstract class TransactionAddedSuccess implements TransactionState {
  const factory TransactionAddedSuccess() = _$TransactionAddedSuccessImpl;
}

/// @nodoc
abstract class _$$TransactionFetshedSuccessImplCopyWith<$Res> {
  factory _$$TransactionFetshedSuccessImplCopyWith(
          _$TransactionFetshedSuccessImpl value,
          $Res Function(_$TransactionFetshedSuccessImpl) then) =
      __$$TransactionFetshedSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<UserTransaction> transactions});
}

/// @nodoc
class __$$TransactionFetshedSuccessImplCopyWithImpl<$Res>
    extends _$TransactionStateCopyWithImpl<$Res,
        _$TransactionFetshedSuccessImpl>
    implements _$$TransactionFetshedSuccessImplCopyWith<$Res> {
  __$$TransactionFetshedSuccessImplCopyWithImpl(
      _$TransactionFetshedSuccessImpl _value,
      $Res Function(_$TransactionFetshedSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactions = null,
  }) {
    return _then(_$TransactionFetshedSuccessImpl(
      null == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<UserTransaction>,
    ));
  }
}

/// @nodoc

class _$TransactionFetshedSuccessImpl implements TransactionFetshedSuccess {
  const _$TransactionFetshedSuccessImpl(
      final List<UserTransaction> transactions)
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
            other is _$TransactionFetshedSuccessImpl &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_transactions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionFetshedSuccessImplCopyWith<_$TransactionFetshedSuccessImpl>
      get copyWith => __$$TransactionFetshedSuccessImplCopyWithImpl<
          _$TransactionFetshedSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() addedSuccess,
    required TResult Function(List<UserTransaction> transactions)
        fetshedSuccess,
    required TResult Function(String message) addedfailure,
    required TResult Function(String message) fetchedfailure,
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
    TResult? Function(String message)? addedfailure,
    TResult? Function(String message)? fetchedfailure,
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
    TResult Function(String message)? addedfailure,
    TResult Function(String message)? fetchedfailure,
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
    required TResult Function(TransactionLoading value) loading,
    required TResult Function(TransactionAddedSuccess value) addedSuccess,
    required TResult Function(TransactionFetshedSuccess value) fetshedSuccess,
    required TResult Function(TransactionAddedFailure value) addedfailure,
    required TResult Function(TransactionFetchedFailure value) fetchedfailure,
  }) {
    return fetshedSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(TransactionLoading value)? loading,
    TResult? Function(TransactionAddedSuccess value)? addedSuccess,
    TResult? Function(TransactionFetshedSuccess value)? fetshedSuccess,
    TResult? Function(TransactionAddedFailure value)? addedfailure,
    TResult? Function(TransactionFetchedFailure value)? fetchedfailure,
  }) {
    return fetshedSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(TransactionLoading value)? loading,
    TResult Function(TransactionAddedSuccess value)? addedSuccess,
    TResult Function(TransactionFetshedSuccess value)? fetshedSuccess,
    TResult Function(TransactionAddedFailure value)? addedfailure,
    TResult Function(TransactionFetchedFailure value)? fetchedfailure,
    required TResult orElse(),
  }) {
    if (fetshedSuccess != null) {
      return fetshedSuccess(this);
    }
    return orElse();
  }
}

abstract class TransactionFetshedSuccess implements TransactionState {
  const factory TransactionFetshedSuccess(
          final List<UserTransaction> transactions) =
      _$TransactionFetshedSuccessImpl;

  List<UserTransaction> get transactions;
  @JsonKey(ignore: true)
  _$$TransactionFetshedSuccessImplCopyWith<_$TransactionFetshedSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TransactionAddedFailureImplCopyWith<$Res> {
  factory _$$TransactionAddedFailureImplCopyWith(
          _$TransactionAddedFailureImpl value,
          $Res Function(_$TransactionAddedFailureImpl) then) =
      __$$TransactionAddedFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$TransactionAddedFailureImplCopyWithImpl<$Res>
    extends _$TransactionStateCopyWithImpl<$Res, _$TransactionAddedFailureImpl>
    implements _$$TransactionAddedFailureImplCopyWith<$Res> {
  __$$TransactionAddedFailureImplCopyWithImpl(
      _$TransactionAddedFailureImpl _value,
      $Res Function(_$TransactionAddedFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$TransactionAddedFailureImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TransactionAddedFailureImpl implements TransactionAddedFailure {
  const _$TransactionAddedFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'TransactionState.addedfailure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionAddedFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionAddedFailureImplCopyWith<_$TransactionAddedFailureImpl>
      get copyWith => __$$TransactionAddedFailureImplCopyWithImpl<
          _$TransactionAddedFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() addedSuccess,
    required TResult Function(List<UserTransaction> transactions)
        fetshedSuccess,
    required TResult Function(String message) addedfailure,
    required TResult Function(String message) fetchedfailure,
  }) {
    return addedfailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? addedSuccess,
    TResult? Function(List<UserTransaction> transactions)? fetshedSuccess,
    TResult? Function(String message)? addedfailure,
    TResult? Function(String message)? fetchedfailure,
  }) {
    return addedfailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? addedSuccess,
    TResult Function(List<UserTransaction> transactions)? fetshedSuccess,
    TResult Function(String message)? addedfailure,
    TResult Function(String message)? fetchedfailure,
    required TResult orElse(),
  }) {
    if (addedfailure != null) {
      return addedfailure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(TransactionLoading value) loading,
    required TResult Function(TransactionAddedSuccess value) addedSuccess,
    required TResult Function(TransactionFetshedSuccess value) fetshedSuccess,
    required TResult Function(TransactionAddedFailure value) addedfailure,
    required TResult Function(TransactionFetchedFailure value) fetchedfailure,
  }) {
    return addedfailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(TransactionLoading value)? loading,
    TResult? Function(TransactionAddedSuccess value)? addedSuccess,
    TResult? Function(TransactionFetshedSuccess value)? fetshedSuccess,
    TResult? Function(TransactionAddedFailure value)? addedfailure,
    TResult? Function(TransactionFetchedFailure value)? fetchedfailure,
  }) {
    return addedfailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(TransactionLoading value)? loading,
    TResult Function(TransactionAddedSuccess value)? addedSuccess,
    TResult Function(TransactionFetshedSuccess value)? fetshedSuccess,
    TResult Function(TransactionAddedFailure value)? addedfailure,
    TResult Function(TransactionFetchedFailure value)? fetchedfailure,
    required TResult orElse(),
  }) {
    if (addedfailure != null) {
      return addedfailure(this);
    }
    return orElse();
  }
}

abstract class TransactionAddedFailure implements TransactionState {
  const factory TransactionAddedFailure(final String message) =
      _$TransactionAddedFailureImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$TransactionAddedFailureImplCopyWith<_$TransactionAddedFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TransactionFetchedFailureImplCopyWith<$Res> {
  factory _$$TransactionFetchedFailureImplCopyWith(
          _$TransactionFetchedFailureImpl value,
          $Res Function(_$TransactionFetchedFailureImpl) then) =
      __$$TransactionFetchedFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$TransactionFetchedFailureImplCopyWithImpl<$Res>
    extends _$TransactionStateCopyWithImpl<$Res,
        _$TransactionFetchedFailureImpl>
    implements _$$TransactionFetchedFailureImplCopyWith<$Res> {
  __$$TransactionFetchedFailureImplCopyWithImpl(
      _$TransactionFetchedFailureImpl _value,
      $Res Function(_$TransactionFetchedFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$TransactionFetchedFailureImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TransactionFetchedFailureImpl implements TransactionFetchedFailure {
  const _$TransactionFetchedFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'TransactionState.fetchedfailure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionFetchedFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionFetchedFailureImplCopyWith<_$TransactionFetchedFailureImpl>
      get copyWith => __$$TransactionFetchedFailureImplCopyWithImpl<
          _$TransactionFetchedFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() addedSuccess,
    required TResult Function(List<UserTransaction> transactions)
        fetshedSuccess,
    required TResult Function(String message) addedfailure,
    required TResult Function(String message) fetchedfailure,
  }) {
    return fetchedfailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? addedSuccess,
    TResult? Function(List<UserTransaction> transactions)? fetshedSuccess,
    TResult? Function(String message)? addedfailure,
    TResult? Function(String message)? fetchedfailure,
  }) {
    return fetchedfailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? addedSuccess,
    TResult Function(List<UserTransaction> transactions)? fetshedSuccess,
    TResult Function(String message)? addedfailure,
    TResult Function(String message)? fetchedfailure,
    required TResult orElse(),
  }) {
    if (fetchedfailure != null) {
      return fetchedfailure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(TransactionLoading value) loading,
    required TResult Function(TransactionAddedSuccess value) addedSuccess,
    required TResult Function(TransactionFetshedSuccess value) fetshedSuccess,
    required TResult Function(TransactionAddedFailure value) addedfailure,
    required TResult Function(TransactionFetchedFailure value) fetchedfailure,
  }) {
    return fetchedfailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(TransactionLoading value)? loading,
    TResult? Function(TransactionAddedSuccess value)? addedSuccess,
    TResult? Function(TransactionFetshedSuccess value)? fetshedSuccess,
    TResult? Function(TransactionAddedFailure value)? addedfailure,
    TResult? Function(TransactionFetchedFailure value)? fetchedfailure,
  }) {
    return fetchedfailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(TransactionLoading value)? loading,
    TResult Function(TransactionAddedSuccess value)? addedSuccess,
    TResult Function(TransactionFetshedSuccess value)? fetshedSuccess,
    TResult Function(TransactionAddedFailure value)? addedfailure,
    TResult Function(TransactionFetchedFailure value)? fetchedfailure,
    required TResult orElse(),
  }) {
    if (fetchedfailure != null) {
      return fetchedfailure(this);
    }
    return orElse();
  }
}

abstract class TransactionFetchedFailure implements TransactionState {
  const factory TransactionFetchedFailure(final String message) =
      _$TransactionFetchedFailureImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$TransactionFetchedFailureImplCopyWith<_$TransactionFetchedFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}
