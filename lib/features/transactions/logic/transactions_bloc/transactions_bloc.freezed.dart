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
    required TResult Function() addSuccess,
    required TResult Function(List<UserTransaction> transactions) fetchSuccess,
    required TResult Function(String message) addfailure,
    required TResult Function(String message) fetchfailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? addSuccess,
    TResult? Function(List<UserTransaction> transactions)? fetchSuccess,
    TResult? Function(String message)? addfailure,
    TResult? Function(String message)? fetchfailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? addSuccess,
    TResult Function(List<UserTransaction> transactions)? fetchSuccess,
    TResult Function(String message)? addfailure,
    TResult Function(String message)? fetchfailure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(TransactionLoading value) loading,
    required TResult Function(TransactionAddSuccess value) addSuccess,
    required TResult Function(TransactionFetchSuccess value) fetchSuccess,
    required TResult Function(TransactionAddFailure value) addfailure,
    required TResult Function(TransactionFetchFailure value) fetchfailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(TransactionLoading value)? loading,
    TResult? Function(TransactionAddSuccess value)? addSuccess,
    TResult? Function(TransactionFetchSuccess value)? fetchSuccess,
    TResult? Function(TransactionAddFailure value)? addfailure,
    TResult? Function(TransactionFetchFailure value)? fetchfailure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(TransactionLoading value)? loading,
    TResult Function(TransactionAddSuccess value)? addSuccess,
    TResult Function(TransactionFetchSuccess value)? fetchSuccess,
    TResult Function(TransactionAddFailure value)? addfailure,
    TResult Function(TransactionFetchFailure value)? fetchfailure,
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
    required TResult Function() addSuccess,
    required TResult Function(List<UserTransaction> transactions) fetchSuccess,
    required TResult Function(String message) addfailure,
    required TResult Function(String message) fetchfailure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? addSuccess,
    TResult? Function(List<UserTransaction> transactions)? fetchSuccess,
    TResult? Function(String message)? addfailure,
    TResult? Function(String message)? fetchfailure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? addSuccess,
    TResult Function(List<UserTransaction> transactions)? fetchSuccess,
    TResult Function(String message)? addfailure,
    TResult Function(String message)? fetchfailure,
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
    required TResult Function(TransactionAddSuccess value) addSuccess,
    required TResult Function(TransactionFetchSuccess value) fetchSuccess,
    required TResult Function(TransactionAddFailure value) addfailure,
    required TResult Function(TransactionFetchFailure value) fetchfailure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(TransactionLoading value)? loading,
    TResult? Function(TransactionAddSuccess value)? addSuccess,
    TResult? Function(TransactionFetchSuccess value)? fetchSuccess,
    TResult? Function(TransactionAddFailure value)? addfailure,
    TResult? Function(TransactionFetchFailure value)? fetchfailure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(TransactionLoading value)? loading,
    TResult Function(TransactionAddSuccess value)? addSuccess,
    TResult Function(TransactionFetchSuccess value)? fetchSuccess,
    TResult Function(TransactionAddFailure value)? addfailure,
    TResult Function(TransactionFetchFailure value)? fetchfailure,
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
    required TResult Function() addSuccess,
    required TResult Function(List<UserTransaction> transactions) fetchSuccess,
    required TResult Function(String message) addfailure,
    required TResult Function(String message) fetchfailure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? addSuccess,
    TResult? Function(List<UserTransaction> transactions)? fetchSuccess,
    TResult? Function(String message)? addfailure,
    TResult? Function(String message)? fetchfailure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? addSuccess,
    TResult Function(List<UserTransaction> transactions)? fetchSuccess,
    TResult Function(String message)? addfailure,
    TResult Function(String message)? fetchfailure,
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
    required TResult Function(TransactionAddSuccess value) addSuccess,
    required TResult Function(TransactionFetchSuccess value) fetchSuccess,
    required TResult Function(TransactionAddFailure value) addfailure,
    required TResult Function(TransactionFetchFailure value) fetchfailure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(TransactionLoading value)? loading,
    TResult? Function(TransactionAddSuccess value)? addSuccess,
    TResult? Function(TransactionFetchSuccess value)? fetchSuccess,
    TResult? Function(TransactionAddFailure value)? addfailure,
    TResult? Function(TransactionFetchFailure value)? fetchfailure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(TransactionLoading value)? loading,
    TResult Function(TransactionAddSuccess value)? addSuccess,
    TResult Function(TransactionFetchSuccess value)? fetchSuccess,
    TResult Function(TransactionAddFailure value)? addfailure,
    TResult Function(TransactionFetchFailure value)? fetchfailure,
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
abstract class _$$TransactionAddSuccessImplCopyWith<$Res> {
  factory _$$TransactionAddSuccessImplCopyWith(
          _$TransactionAddSuccessImpl value,
          $Res Function(_$TransactionAddSuccessImpl) then) =
      __$$TransactionAddSuccessImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$TransactionAddSuccessImplCopyWithImpl<$Res>
    extends _$TransactionStateCopyWithImpl<$Res, _$TransactionAddSuccessImpl>
    implements _$$TransactionAddSuccessImplCopyWith<$Res> {
  __$$TransactionAddSuccessImplCopyWithImpl(_$TransactionAddSuccessImpl _value,
      $Res Function(_$TransactionAddSuccessImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$TransactionAddSuccessImpl implements TransactionAddSuccess {
  const _$TransactionAddSuccessImpl();

  @override
  String toString() {
    return 'TransactionState.addSuccess()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionAddSuccessImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() addSuccess,
    required TResult Function(List<UserTransaction> transactions) fetchSuccess,
    required TResult Function(String message) addfailure,
    required TResult Function(String message) fetchfailure,
  }) {
    return addSuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? addSuccess,
    TResult? Function(List<UserTransaction> transactions)? fetchSuccess,
    TResult? Function(String message)? addfailure,
    TResult? Function(String message)? fetchfailure,
  }) {
    return addSuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? addSuccess,
    TResult Function(List<UserTransaction> transactions)? fetchSuccess,
    TResult Function(String message)? addfailure,
    TResult Function(String message)? fetchfailure,
    required TResult orElse(),
  }) {
    if (addSuccess != null) {
      return addSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(TransactionLoading value) loading,
    required TResult Function(TransactionAddSuccess value) addSuccess,
    required TResult Function(TransactionFetchSuccess value) fetchSuccess,
    required TResult Function(TransactionAddFailure value) addfailure,
    required TResult Function(TransactionFetchFailure value) fetchfailure,
  }) {
    return addSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(TransactionLoading value)? loading,
    TResult? Function(TransactionAddSuccess value)? addSuccess,
    TResult? Function(TransactionFetchSuccess value)? fetchSuccess,
    TResult? Function(TransactionAddFailure value)? addfailure,
    TResult? Function(TransactionFetchFailure value)? fetchfailure,
  }) {
    return addSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(TransactionLoading value)? loading,
    TResult Function(TransactionAddSuccess value)? addSuccess,
    TResult Function(TransactionFetchSuccess value)? fetchSuccess,
    TResult Function(TransactionAddFailure value)? addfailure,
    TResult Function(TransactionFetchFailure value)? fetchfailure,
    required TResult orElse(),
  }) {
    if (addSuccess != null) {
      return addSuccess(this);
    }
    return orElse();
  }
}

abstract class TransactionAddSuccess implements TransactionState {
  const factory TransactionAddSuccess() = _$TransactionAddSuccessImpl;
}

/// @nodoc
abstract class _$$TransactionFetchSuccessImplCopyWith<$Res> {
  factory _$$TransactionFetchSuccessImplCopyWith(
          _$TransactionFetchSuccessImpl value,
          $Res Function(_$TransactionFetchSuccessImpl) then) =
      __$$TransactionFetchSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<UserTransaction> transactions});
}

/// @nodoc
class __$$TransactionFetchSuccessImplCopyWithImpl<$Res>
    extends _$TransactionStateCopyWithImpl<$Res, _$TransactionFetchSuccessImpl>
    implements _$$TransactionFetchSuccessImplCopyWith<$Res> {
  __$$TransactionFetchSuccessImplCopyWithImpl(
      _$TransactionFetchSuccessImpl _value,
      $Res Function(_$TransactionFetchSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transactions = null,
  }) {
    return _then(_$TransactionFetchSuccessImpl(
      null == transactions
          ? _value._transactions
          : transactions // ignore: cast_nullable_to_non_nullable
              as List<UserTransaction>,
    ));
  }
}

/// @nodoc

class _$TransactionFetchSuccessImpl implements TransactionFetchSuccess {
  const _$TransactionFetchSuccessImpl(final List<UserTransaction> transactions)
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
    return 'TransactionState.fetchSuccess(transactions: $transactions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionFetchSuccessImpl &&
            const DeepCollectionEquality()
                .equals(other._transactions, _transactions));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_transactions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionFetchSuccessImplCopyWith<_$TransactionFetchSuccessImpl>
      get copyWith => __$$TransactionFetchSuccessImplCopyWithImpl<
          _$TransactionFetchSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() addSuccess,
    required TResult Function(List<UserTransaction> transactions) fetchSuccess,
    required TResult Function(String message) addfailure,
    required TResult Function(String message) fetchfailure,
  }) {
    return fetchSuccess(transactions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? addSuccess,
    TResult? Function(List<UserTransaction> transactions)? fetchSuccess,
    TResult? Function(String message)? addfailure,
    TResult? Function(String message)? fetchfailure,
  }) {
    return fetchSuccess?.call(transactions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? addSuccess,
    TResult Function(List<UserTransaction> transactions)? fetchSuccess,
    TResult Function(String message)? addfailure,
    TResult Function(String message)? fetchfailure,
    required TResult orElse(),
  }) {
    if (fetchSuccess != null) {
      return fetchSuccess(transactions);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(TransactionLoading value) loading,
    required TResult Function(TransactionAddSuccess value) addSuccess,
    required TResult Function(TransactionFetchSuccess value) fetchSuccess,
    required TResult Function(TransactionAddFailure value) addfailure,
    required TResult Function(TransactionFetchFailure value) fetchfailure,
  }) {
    return fetchSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(TransactionLoading value)? loading,
    TResult? Function(TransactionAddSuccess value)? addSuccess,
    TResult? Function(TransactionFetchSuccess value)? fetchSuccess,
    TResult? Function(TransactionAddFailure value)? addfailure,
    TResult? Function(TransactionFetchFailure value)? fetchfailure,
  }) {
    return fetchSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(TransactionLoading value)? loading,
    TResult Function(TransactionAddSuccess value)? addSuccess,
    TResult Function(TransactionFetchSuccess value)? fetchSuccess,
    TResult Function(TransactionAddFailure value)? addfailure,
    TResult Function(TransactionFetchFailure value)? fetchfailure,
    required TResult orElse(),
  }) {
    if (fetchSuccess != null) {
      return fetchSuccess(this);
    }
    return orElse();
  }
}

abstract class TransactionFetchSuccess implements TransactionState {
  const factory TransactionFetchSuccess(
      final List<UserTransaction> transactions) = _$TransactionFetchSuccessImpl;

  List<UserTransaction> get transactions;
  @JsonKey(ignore: true)
  _$$TransactionFetchSuccessImplCopyWith<_$TransactionFetchSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TransactionAddFailureImplCopyWith<$Res> {
  factory _$$TransactionAddFailureImplCopyWith(
          _$TransactionAddFailureImpl value,
          $Res Function(_$TransactionAddFailureImpl) then) =
      __$$TransactionAddFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$TransactionAddFailureImplCopyWithImpl<$Res>
    extends _$TransactionStateCopyWithImpl<$Res, _$TransactionAddFailureImpl>
    implements _$$TransactionAddFailureImplCopyWith<$Res> {
  __$$TransactionAddFailureImplCopyWithImpl(_$TransactionAddFailureImpl _value,
      $Res Function(_$TransactionAddFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$TransactionAddFailureImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TransactionAddFailureImpl implements TransactionAddFailure {
  const _$TransactionAddFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'TransactionState.addfailure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionAddFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionAddFailureImplCopyWith<_$TransactionAddFailureImpl>
      get copyWith => __$$TransactionAddFailureImplCopyWithImpl<
          _$TransactionAddFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() addSuccess,
    required TResult Function(List<UserTransaction> transactions) fetchSuccess,
    required TResult Function(String message) addfailure,
    required TResult Function(String message) fetchfailure,
  }) {
    return addfailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? addSuccess,
    TResult? Function(List<UserTransaction> transactions)? fetchSuccess,
    TResult? Function(String message)? addfailure,
    TResult? Function(String message)? fetchfailure,
  }) {
    return addfailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? addSuccess,
    TResult Function(List<UserTransaction> transactions)? fetchSuccess,
    TResult Function(String message)? addfailure,
    TResult Function(String message)? fetchfailure,
    required TResult orElse(),
  }) {
    if (addfailure != null) {
      return addfailure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(TransactionLoading value) loading,
    required TResult Function(TransactionAddSuccess value) addSuccess,
    required TResult Function(TransactionFetchSuccess value) fetchSuccess,
    required TResult Function(TransactionAddFailure value) addfailure,
    required TResult Function(TransactionFetchFailure value) fetchfailure,
  }) {
    return addfailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(TransactionLoading value)? loading,
    TResult? Function(TransactionAddSuccess value)? addSuccess,
    TResult? Function(TransactionFetchSuccess value)? fetchSuccess,
    TResult? Function(TransactionAddFailure value)? addfailure,
    TResult? Function(TransactionFetchFailure value)? fetchfailure,
  }) {
    return addfailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(TransactionLoading value)? loading,
    TResult Function(TransactionAddSuccess value)? addSuccess,
    TResult Function(TransactionFetchSuccess value)? fetchSuccess,
    TResult Function(TransactionAddFailure value)? addfailure,
    TResult Function(TransactionFetchFailure value)? fetchfailure,
    required TResult orElse(),
  }) {
    if (addfailure != null) {
      return addfailure(this);
    }
    return orElse();
  }
}

abstract class TransactionAddFailure implements TransactionState {
  const factory TransactionAddFailure(final String message) =
      _$TransactionAddFailureImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$TransactionAddFailureImplCopyWith<_$TransactionAddFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$TransactionFetchFailureImplCopyWith<$Res> {
  factory _$$TransactionFetchFailureImplCopyWith(
          _$TransactionFetchFailureImpl value,
          $Res Function(_$TransactionFetchFailureImpl) then) =
      __$$TransactionFetchFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$TransactionFetchFailureImplCopyWithImpl<$Res>
    extends _$TransactionStateCopyWithImpl<$Res, _$TransactionFetchFailureImpl>
    implements _$$TransactionFetchFailureImplCopyWith<$Res> {
  __$$TransactionFetchFailureImplCopyWithImpl(
      _$TransactionFetchFailureImpl _value,
      $Res Function(_$TransactionFetchFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_$TransactionFetchFailureImpl(
      null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$TransactionFetchFailureImpl implements TransactionFetchFailure {
  const _$TransactionFetchFailureImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'TransactionState.fetchfailure(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionFetchFailureImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionFetchFailureImplCopyWith<_$TransactionFetchFailureImpl>
      get copyWith => __$$TransactionFetchFailureImplCopyWithImpl<
          _$TransactionFetchFailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() addSuccess,
    required TResult Function(List<UserTransaction> transactions) fetchSuccess,
    required TResult Function(String message) addfailure,
    required TResult Function(String message) fetchfailure,
  }) {
    return fetchfailure(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? addSuccess,
    TResult? Function(List<UserTransaction> transactions)? fetchSuccess,
    TResult? Function(String message)? addfailure,
    TResult? Function(String message)? fetchfailure,
  }) {
    return fetchfailure?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? addSuccess,
    TResult Function(List<UserTransaction> transactions)? fetchSuccess,
    TResult Function(String message)? addfailure,
    TResult Function(String message)? fetchfailure,
    required TResult orElse(),
  }) {
    if (fetchfailure != null) {
      return fetchfailure(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(TransactionLoading value) loading,
    required TResult Function(TransactionAddSuccess value) addSuccess,
    required TResult Function(TransactionFetchSuccess value) fetchSuccess,
    required TResult Function(TransactionAddFailure value) addfailure,
    required TResult Function(TransactionFetchFailure value) fetchfailure,
  }) {
    return fetchfailure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(TransactionLoading value)? loading,
    TResult? Function(TransactionAddSuccess value)? addSuccess,
    TResult? Function(TransactionFetchSuccess value)? fetchSuccess,
    TResult? Function(TransactionAddFailure value)? addfailure,
    TResult? Function(TransactionFetchFailure value)? fetchfailure,
  }) {
    return fetchfailure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(TransactionLoading value)? loading,
    TResult Function(TransactionAddSuccess value)? addSuccess,
    TResult Function(TransactionFetchSuccess value)? fetchSuccess,
    TResult Function(TransactionAddFailure value)? addfailure,
    TResult Function(TransactionFetchFailure value)? fetchfailure,
    required TResult orElse(),
  }) {
    if (fetchfailure != null) {
      return fetchfailure(this);
    }
    return orElse();
  }
}

abstract class TransactionFetchFailure implements TransactionState {
  const factory TransactionFetchFailure(final String message) =
      _$TransactionFetchFailureImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$TransactionFetchFailureImplCopyWith<_$TransactionFetchFailureImpl>
      get copyWith => throw _privateConstructorUsedError;
}
