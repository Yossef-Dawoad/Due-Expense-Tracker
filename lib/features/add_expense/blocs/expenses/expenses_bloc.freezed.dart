// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expenses_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ExpensesEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(MoneyTransaction transaction) addedNewExpense,
    required TResult Function() fetchedExpense,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(MoneyTransaction transaction)? addedNewExpense,
    TResult? Function()? fetchedExpense,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(MoneyTransaction transaction)? addedNewExpense,
    TResult Function()? fetchedExpense,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(AddedNewExpenseEv value) addedNewExpense,
    required TResult Function(FetchedExpenseEv value) fetchedExpense,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(AddedNewExpenseEv value)? addedNewExpense,
    TResult? Function(FetchedExpenseEv value)? fetchedExpense,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(AddedNewExpenseEv value)? addedNewExpense,
    TResult Function(FetchedExpenseEv value)? fetchedExpense,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpensesEventCopyWith<$Res> {
  factory $ExpensesEventCopyWith(
          ExpensesEvent value, $Res Function(ExpensesEvent) then) =
      _$ExpensesEventCopyWithImpl<$Res, ExpensesEvent>;
}

/// @nodoc
class _$ExpensesEventCopyWithImpl<$Res, $Val extends ExpensesEvent>
    implements $ExpensesEventCopyWith<$Res> {
  _$ExpensesEventCopyWithImpl(this._value, this._then);

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
    extends _$ExpensesEventCopyWithImpl<$Res, _$StartedImpl>
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
    return 'ExpensesEvent.started()';
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
    required TResult Function(MoneyTransaction transaction) addedNewExpense,
    required TResult Function() fetchedExpense,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(MoneyTransaction transaction)? addedNewExpense,
    TResult? Function()? fetchedExpense,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(MoneyTransaction transaction)? addedNewExpense,
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
    required TResult Function(AddedNewExpenseEv value) addedNewExpense,
    required TResult Function(FetchedExpenseEv value) fetchedExpense,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(AddedNewExpenseEv value)? addedNewExpense,
    TResult? Function(FetchedExpenseEv value)? fetchedExpense,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(AddedNewExpenseEv value)? addedNewExpense,
    TResult Function(FetchedExpenseEv value)? fetchedExpense,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements ExpensesEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$AddedNewExpenseEvImplCopyWith<$Res> {
  factory _$$AddedNewExpenseEvImplCopyWith(_$AddedNewExpenseEvImpl value,
          $Res Function(_$AddedNewExpenseEvImpl) then) =
      __$$AddedNewExpenseEvImplCopyWithImpl<$Res>;
  @useResult
  $Res call({MoneyTransaction transaction});

  $MoneyTransactionCopyWith<$Res> get transaction;
}

/// @nodoc
class __$$AddedNewExpenseEvImplCopyWithImpl<$Res>
    extends _$ExpensesEventCopyWithImpl<$Res, _$AddedNewExpenseEvImpl>
    implements _$$AddedNewExpenseEvImplCopyWith<$Res> {
  __$$AddedNewExpenseEvImplCopyWithImpl(_$AddedNewExpenseEvImpl _value,
      $Res Function(_$AddedNewExpenseEvImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transaction = null,
  }) {
    return _then(_$AddedNewExpenseEvImpl(
      null == transaction
          ? _value.transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as MoneyTransaction,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $MoneyTransactionCopyWith<$Res> get transaction {
    return $MoneyTransactionCopyWith<$Res>(_value.transaction, (value) {
      return _then(_value.copyWith(transaction: value));
    });
  }
}

/// @nodoc

class _$AddedNewExpenseEvImpl implements AddedNewExpenseEv {
  const _$AddedNewExpenseEvImpl(this.transaction);

  @override
  final MoneyTransaction transaction;

  @override
  String toString() {
    return 'ExpensesEvent.addedNewExpense(transaction: $transaction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddedNewExpenseEvImpl &&
            (identical(other.transaction, transaction) ||
                other.transaction == transaction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, transaction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddedNewExpenseEvImplCopyWith<_$AddedNewExpenseEvImpl> get copyWith =>
      __$$AddedNewExpenseEvImplCopyWithImpl<_$AddedNewExpenseEvImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(MoneyTransaction transaction) addedNewExpense,
    required TResult Function() fetchedExpense,
  }) {
    return addedNewExpense(transaction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(MoneyTransaction transaction)? addedNewExpense,
    TResult? Function()? fetchedExpense,
  }) {
    return addedNewExpense?.call(transaction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(MoneyTransaction transaction)? addedNewExpense,
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
    required TResult Function(AddedNewExpenseEv value) addedNewExpense,
    required TResult Function(FetchedExpenseEv value) fetchedExpense,
  }) {
    return addedNewExpense(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(AddedNewExpenseEv value)? addedNewExpense,
    TResult? Function(FetchedExpenseEv value)? fetchedExpense,
  }) {
    return addedNewExpense?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(AddedNewExpenseEv value)? addedNewExpense,
    TResult Function(FetchedExpenseEv value)? fetchedExpense,
    required TResult orElse(),
  }) {
    if (addedNewExpense != null) {
      return addedNewExpense(this);
    }
    return orElse();
  }
}

abstract class AddedNewExpenseEv implements ExpensesEvent {
  const factory AddedNewExpenseEv(final MoneyTransaction transaction) =
      _$AddedNewExpenseEvImpl;

  MoneyTransaction get transaction;
  @JsonKey(ignore: true)
  _$$AddedNewExpenseEvImplCopyWith<_$AddedNewExpenseEvImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FetchedExpenseEvImplCopyWith<$Res> {
  factory _$$FetchedExpenseEvImplCopyWith(_$FetchedExpenseEvImpl value,
          $Res Function(_$FetchedExpenseEvImpl) then) =
      __$$FetchedExpenseEvImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$FetchedExpenseEvImplCopyWithImpl<$Res>
    extends _$ExpensesEventCopyWithImpl<$Res, _$FetchedExpenseEvImpl>
    implements _$$FetchedExpenseEvImplCopyWith<$Res> {
  __$$FetchedExpenseEvImplCopyWithImpl(_$FetchedExpenseEvImpl _value,
      $Res Function(_$FetchedExpenseEvImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$FetchedExpenseEvImpl implements FetchedExpenseEv {
  const _$FetchedExpenseEvImpl();

  @override
  String toString() {
    return 'ExpensesEvent.fetchedExpense()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$FetchedExpenseEvImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(MoneyTransaction transaction) addedNewExpense,
    required TResult Function() fetchedExpense,
  }) {
    return fetchedExpense();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(MoneyTransaction transaction)? addedNewExpense,
    TResult? Function()? fetchedExpense,
  }) {
    return fetchedExpense?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(MoneyTransaction transaction)? addedNewExpense,
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
    required TResult Function(AddedNewExpenseEv value) addedNewExpense,
    required TResult Function(FetchedExpenseEv value) fetchedExpense,
  }) {
    return fetchedExpense(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(AddedNewExpenseEv value)? addedNewExpense,
    TResult? Function(FetchedExpenseEv value)? fetchedExpense,
  }) {
    return fetchedExpense?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(AddedNewExpenseEv value)? addedNewExpense,
    TResult Function(FetchedExpenseEv value)? fetchedExpense,
    required TResult orElse(),
  }) {
    if (fetchedExpense != null) {
      return fetchedExpense(this);
    }
    return orElse();
  }
}

abstract class FetchedExpenseEv implements ExpensesEvent {
  const factory FetchedExpenseEv() = _$FetchedExpenseEvImpl;
}

/// @nodoc
mixin _$ExpensesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() addedSuccess,
    required TResult Function(List<MoneyTransaction> transaction)
        fetshedSuccess,
    required TResult Function(String message) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? addedSuccess,
    TResult? Function(List<MoneyTransaction> transaction)? fetshedSuccess,
    TResult? Function(String message)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? addedSuccess,
    TResult Function(List<MoneyTransaction> transaction)? fetshedSuccess,
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
abstract class $ExpensesStateCopyWith<$Res> {
  factory $ExpensesStateCopyWith(
          ExpensesState value, $Res Function(ExpensesState) then) =
      _$ExpensesStateCopyWithImpl<$Res, ExpensesState>;
}

/// @nodoc
class _$ExpensesStateCopyWithImpl<$Res, $Val extends ExpensesState>
    implements $ExpensesStateCopyWith<$Res> {
  _$ExpensesStateCopyWithImpl(this._value, this._then);

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
    extends _$ExpensesStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'ExpensesState.initial()';
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
    required TResult Function(List<MoneyTransaction> transaction)
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
    TResult? Function(List<MoneyTransaction> transaction)? fetshedSuccess,
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
    TResult Function(List<MoneyTransaction> transaction)? fetshedSuccess,
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

abstract class _Initial implements ExpensesState {
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
    extends _$ExpensesStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'ExpensesState.loading()';
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
    required TResult Function(List<MoneyTransaction> transaction)
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
    TResult? Function(List<MoneyTransaction> transaction)? fetshedSuccess,
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
    TResult Function(List<MoneyTransaction> transaction)? fetshedSuccess,
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

abstract class _Loading implements ExpensesState {
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
    extends _$ExpensesStateCopyWithImpl<$Res, _$AddedSuccessImpl>
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
    return 'ExpensesState.addedSuccess()';
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
    required TResult Function(List<MoneyTransaction> transaction)
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
    TResult? Function(List<MoneyTransaction> transaction)? fetshedSuccess,
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
    TResult Function(List<MoneyTransaction> transaction)? fetshedSuccess,
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

abstract class _AddedSuccess implements ExpensesState {
  const factory _AddedSuccess() = _$AddedSuccessImpl;
}

/// @nodoc
abstract class _$$FetshedSuccessImplCopyWith<$Res> {
  factory _$$FetshedSuccessImplCopyWith(_$FetshedSuccessImpl value,
          $Res Function(_$FetshedSuccessImpl) then) =
      __$$FetshedSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<MoneyTransaction> transaction});
}

/// @nodoc
class __$$FetshedSuccessImplCopyWithImpl<$Res>
    extends _$ExpensesStateCopyWithImpl<$Res, _$FetshedSuccessImpl>
    implements _$$FetshedSuccessImplCopyWith<$Res> {
  __$$FetshedSuccessImplCopyWithImpl(
      _$FetshedSuccessImpl _value, $Res Function(_$FetshedSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? transaction = null,
  }) {
    return _then(_$FetshedSuccessImpl(
      null == transaction
          ? _value._transaction
          : transaction // ignore: cast_nullable_to_non_nullable
              as List<MoneyTransaction>,
    ));
  }
}

/// @nodoc

class _$FetshedSuccessImpl implements _FetshedSuccess {
  const _$FetshedSuccessImpl(final List<MoneyTransaction> transaction)
      : _transaction = transaction;

  final List<MoneyTransaction> _transaction;
  @override
  List<MoneyTransaction> get transaction {
    if (_transaction is EqualUnmodifiableListView) return _transaction;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_transaction);
  }

  @override
  String toString() {
    return 'ExpensesState.fetshedSuccess(transaction: $transaction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetshedSuccessImpl &&
            const DeepCollectionEquality()
                .equals(other._transaction, _transaction));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_transaction));

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
    required TResult Function(List<MoneyTransaction> transaction)
        fetshedSuccess,
    required TResult Function(String message) failure,
  }) {
    return fetshedSuccess(transaction);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? addedSuccess,
    TResult? Function(List<MoneyTransaction> transaction)? fetshedSuccess,
    TResult? Function(String message)? failure,
  }) {
    return fetshedSuccess?.call(transaction);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? addedSuccess,
    TResult Function(List<MoneyTransaction> transaction)? fetshedSuccess,
    TResult Function(String message)? failure,
    required TResult orElse(),
  }) {
    if (fetshedSuccess != null) {
      return fetshedSuccess(transaction);
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

abstract class _FetshedSuccess implements ExpensesState {
  const factory _FetshedSuccess(final List<MoneyTransaction> transaction) =
      _$FetshedSuccessImpl;

  List<MoneyTransaction> get transaction;
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
    extends _$ExpensesStateCopyWithImpl<$Res, _$FailureImpl>
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
    return 'ExpensesState.failure(message: $message)';
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
    required TResult Function(List<MoneyTransaction> transaction)
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
    TResult? Function(List<MoneyTransaction> transaction)? fetshedSuccess,
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
    TResult Function(List<MoneyTransaction> transaction)? fetshedSuccess,
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

abstract class _Failure implements ExpensesState {
  const factory _Failure(final String message) = _$FailureImpl;

  String get message;
  @JsonKey(ignore: true)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
