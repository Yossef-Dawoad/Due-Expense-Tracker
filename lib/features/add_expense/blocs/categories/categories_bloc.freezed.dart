// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'categories_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CategoriesEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(TransactionCategory category) categoryAdded,
    required TResult Function() cateoriesFetched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(TransactionCategory category)? categoryAdded,
    TResult? Function()? cateoriesFetched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(TransactionCategory category)? categoryAdded,
    TResult Function()? cateoriesFetched,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(CategoryAdded value) categoryAdded,
    required TResult Function(CategoriesFetched value) cateoriesFetched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(CategoryAdded value)? categoryAdded,
    TResult? Function(CategoriesFetched value)? cateoriesFetched,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(CategoryAdded value)? categoryAdded,
    TResult Function(CategoriesFetched value)? cateoriesFetched,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoriesEventCopyWith<$Res> {
  factory $CategoriesEventCopyWith(
          CategoriesEvent value, $Res Function(CategoriesEvent) then) =
      _$CategoriesEventCopyWithImpl<$Res, CategoriesEvent>;
}

/// @nodoc
class _$CategoriesEventCopyWithImpl<$Res, $Val extends CategoriesEvent>
    implements $CategoriesEventCopyWith<$Res> {
  _$CategoriesEventCopyWithImpl(this._value, this._then);

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
    extends _$CategoriesEventCopyWithImpl<$Res, _$StartedImpl>
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
    return 'CategoriesEvent.started()';
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
    required TResult Function(TransactionCategory category) categoryAdded,
    required TResult Function() cateoriesFetched,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(TransactionCategory category)? categoryAdded,
    TResult? Function()? cateoriesFetched,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(TransactionCategory category)? categoryAdded,
    TResult Function()? cateoriesFetched,
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
    required TResult Function(CategoryAdded value) categoryAdded,
    required TResult Function(CategoriesFetched value) cateoriesFetched,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(CategoryAdded value)? categoryAdded,
    TResult? Function(CategoriesFetched value)? cateoriesFetched,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(CategoryAdded value)? categoryAdded,
    TResult Function(CategoriesFetched value)? cateoriesFetched,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements CategoriesEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$CategoryAddedImplCopyWith<$Res> {
  factory _$$CategoryAddedImplCopyWith(
          _$CategoryAddedImpl value, $Res Function(_$CategoryAddedImpl) then) =
      __$$CategoryAddedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TransactionCategory category});

  $TransactionCategoryCopyWith<$Res> get category;
}

/// @nodoc
class __$$CategoryAddedImplCopyWithImpl<$Res>
    extends _$CategoriesEventCopyWithImpl<$Res, _$CategoryAddedImpl>
    implements _$$CategoryAddedImplCopyWith<$Res> {
  __$$CategoryAddedImplCopyWithImpl(
      _$CategoryAddedImpl _value, $Res Function(_$CategoryAddedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
  }) {
    return _then(_$CategoryAddedImpl(
      null == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as TransactionCategory,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $TransactionCategoryCopyWith<$Res> get category {
    return $TransactionCategoryCopyWith<$Res>(_value.category, (value) {
      return _then(_value.copyWith(category: value));
    });
  }
}

/// @nodoc

class _$CategoryAddedImpl implements CategoryAdded {
  const _$CategoryAddedImpl(this.category);

  @override
  final TransactionCategory category;

  @override
  String toString() {
    return 'CategoriesEvent.categoryAdded(category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryAddedImpl &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryAddedImplCopyWith<_$CategoryAddedImpl> get copyWith =>
      __$$CategoryAddedImplCopyWithImpl<_$CategoryAddedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(TransactionCategory category) categoryAdded,
    required TResult Function() cateoriesFetched,
  }) {
    return categoryAdded(category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(TransactionCategory category)? categoryAdded,
    TResult? Function()? cateoriesFetched,
  }) {
    return categoryAdded?.call(category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(TransactionCategory category)? categoryAdded,
    TResult Function()? cateoriesFetched,
    required TResult orElse(),
  }) {
    if (categoryAdded != null) {
      return categoryAdded(category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(CategoryAdded value) categoryAdded,
    required TResult Function(CategoriesFetched value) cateoriesFetched,
  }) {
    return categoryAdded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(CategoryAdded value)? categoryAdded,
    TResult? Function(CategoriesFetched value)? cateoriesFetched,
  }) {
    return categoryAdded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(CategoryAdded value)? categoryAdded,
    TResult Function(CategoriesFetched value)? cateoriesFetched,
    required TResult orElse(),
  }) {
    if (categoryAdded != null) {
      return categoryAdded(this);
    }
    return orElse();
  }
}

abstract class CategoryAdded implements CategoriesEvent {
  const factory CategoryAdded(final TransactionCategory category) =
      _$CategoryAddedImpl;

  TransactionCategory get category;
  @JsonKey(ignore: true)
  _$$CategoryAddedImplCopyWith<_$CategoryAddedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CategoriesFetchedImplCopyWith<$Res> {
  factory _$$CategoriesFetchedImplCopyWith(_$CategoriesFetchedImpl value,
          $Res Function(_$CategoriesFetchedImpl) then) =
      __$$CategoriesFetchedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CategoriesFetchedImplCopyWithImpl<$Res>
    extends _$CategoriesEventCopyWithImpl<$Res, _$CategoriesFetchedImpl>
    implements _$$CategoriesFetchedImplCopyWith<$Res> {
  __$$CategoriesFetchedImplCopyWithImpl(_$CategoriesFetchedImpl _value,
      $Res Function(_$CategoriesFetchedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CategoriesFetchedImpl implements CategoriesFetched {
  const _$CategoriesFetchedImpl();

  @override
  String toString() {
    return 'CategoriesEvent.cateoriesFetched()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CategoriesFetchedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(TransactionCategory category) categoryAdded,
    required TResult Function() cateoriesFetched,
  }) {
    return cateoriesFetched();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(TransactionCategory category)? categoryAdded,
    TResult? Function()? cateoriesFetched,
  }) {
    return cateoriesFetched?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(TransactionCategory category)? categoryAdded,
    TResult Function()? cateoriesFetched,
    required TResult orElse(),
  }) {
    if (cateoriesFetched != null) {
      return cateoriesFetched();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(CategoryAdded value) categoryAdded,
    required TResult Function(CategoriesFetched value) cateoriesFetched,
  }) {
    return cateoriesFetched(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(CategoryAdded value)? categoryAdded,
    TResult? Function(CategoriesFetched value)? cateoriesFetched,
  }) {
    return cateoriesFetched?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(CategoryAdded value)? categoryAdded,
    TResult Function(CategoriesFetched value)? cateoriesFetched,
    required TResult orElse(),
  }) {
    if (cateoriesFetched != null) {
      return cateoriesFetched(this);
    }
    return orElse();
  }
}

abstract class CategoriesFetched implements CategoriesEvent {
  const factory CategoriesFetched() = _$CategoriesFetchedImpl;
}

/// @nodoc
mixin _$CategoriesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() addedsuccess,
    required TResult Function(List<TransactionCategory> categories)
        fetshedsuccess,
    required TResult Function(String error) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? addedsuccess,
    TResult? Function(List<TransactionCategory> categories)? fetshedsuccess,
    TResult? Function(String error)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? addedsuccess,
    TResult Function(List<TransactionCategory> categories)? fetshedsuccess,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_AddedSuccess value) addedsuccess,
    required TResult Function(_Fetshedsuccess value) fetshedsuccess,
    required TResult Function(_Failure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AddedSuccess value)? addedsuccess,
    TResult? Function(_Fetshedsuccess value)? fetshedsuccess,
    TResult? Function(_Failure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_AddedSuccess value)? addedsuccess,
    TResult Function(_Fetshedsuccess value)? fetshedsuccess,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoriesStateCopyWith<$Res> {
  factory $CategoriesStateCopyWith(
          CategoriesState value, $Res Function(CategoriesState) then) =
      _$CategoriesStateCopyWithImpl<$Res, CategoriesState>;
}

/// @nodoc
class _$CategoriesStateCopyWithImpl<$Res, $Val extends CategoriesState>
    implements $CategoriesStateCopyWith<$Res> {
  _$CategoriesStateCopyWithImpl(this._value, this._then);

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
    extends _$CategoriesStateCopyWithImpl<$Res, _$InitialImpl>
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
    return 'CategoriesState.initial()';
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
    required TResult Function() addedsuccess,
    required TResult Function(List<TransactionCategory> categories)
        fetshedsuccess,
    required TResult Function(String error) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? addedsuccess,
    TResult? Function(List<TransactionCategory> categories)? fetshedsuccess,
    TResult? Function(String error)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? addedsuccess,
    TResult Function(List<TransactionCategory> categories)? fetshedsuccess,
    TResult Function(String error)? failure,
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
    required TResult Function(_AddedSuccess value) addedsuccess,
    required TResult Function(_Fetshedsuccess value) fetshedsuccess,
    required TResult Function(_Failure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AddedSuccess value)? addedsuccess,
    TResult? Function(_Fetshedsuccess value)? fetshedsuccess,
    TResult? Function(_Failure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_AddedSuccess value)? addedsuccess,
    TResult Function(_Fetshedsuccess value)? fetshedsuccess,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements CategoriesState {
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
    extends _$CategoriesStateCopyWithImpl<$Res, _$LoadingImpl>
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
    return 'CategoriesState.loading()';
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
    required TResult Function() addedsuccess,
    required TResult Function(List<TransactionCategory> categories)
        fetshedsuccess,
    required TResult Function(String error) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? addedsuccess,
    TResult? Function(List<TransactionCategory> categories)? fetshedsuccess,
    TResult? Function(String error)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? addedsuccess,
    TResult Function(List<TransactionCategory> categories)? fetshedsuccess,
    TResult Function(String error)? failure,
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
    required TResult Function(_AddedSuccess value) addedsuccess,
    required TResult Function(_Fetshedsuccess value) fetshedsuccess,
    required TResult Function(_Failure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AddedSuccess value)? addedsuccess,
    TResult? Function(_Fetshedsuccess value)? fetshedsuccess,
    TResult? Function(_Failure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_AddedSuccess value)? addedsuccess,
    TResult Function(_Fetshedsuccess value)? fetshedsuccess,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _Loading implements CategoriesState {
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
    extends _$CategoriesStateCopyWithImpl<$Res, _$AddedSuccessImpl>
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
    return 'CategoriesState.addedsuccess()';
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
    required TResult Function() addedsuccess,
    required TResult Function(List<TransactionCategory> categories)
        fetshedsuccess,
    required TResult Function(String error) failure,
  }) {
    return addedsuccess();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? addedsuccess,
    TResult? Function(List<TransactionCategory> categories)? fetshedsuccess,
    TResult? Function(String error)? failure,
  }) {
    return addedsuccess?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? addedsuccess,
    TResult Function(List<TransactionCategory> categories)? fetshedsuccess,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (addedsuccess != null) {
      return addedsuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_AddedSuccess value) addedsuccess,
    required TResult Function(_Fetshedsuccess value) fetshedsuccess,
    required TResult Function(_Failure value) failure,
  }) {
    return addedsuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AddedSuccess value)? addedsuccess,
    TResult? Function(_Fetshedsuccess value)? fetshedsuccess,
    TResult? Function(_Failure value)? failure,
  }) {
    return addedsuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_AddedSuccess value)? addedsuccess,
    TResult Function(_Fetshedsuccess value)? fetshedsuccess,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (addedsuccess != null) {
      return addedsuccess(this);
    }
    return orElse();
  }
}

abstract class _AddedSuccess implements CategoriesState {
  const factory _AddedSuccess() = _$AddedSuccessImpl;
}

/// @nodoc
abstract class _$$FetshedsuccessImplCopyWith<$Res> {
  factory _$$FetshedsuccessImplCopyWith(_$FetshedsuccessImpl value,
          $Res Function(_$FetshedsuccessImpl) then) =
      __$$FetshedsuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<TransactionCategory> categories});
}

/// @nodoc
class __$$FetshedsuccessImplCopyWithImpl<$Res>
    extends _$CategoriesStateCopyWithImpl<$Res, _$FetshedsuccessImpl>
    implements _$$FetshedsuccessImplCopyWith<$Res> {
  __$$FetshedsuccessImplCopyWithImpl(
      _$FetshedsuccessImpl _value, $Res Function(_$FetshedsuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
  }) {
    return _then(_$FetshedsuccessImpl(
      null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<TransactionCategory>,
    ));
  }
}

/// @nodoc

class _$FetshedsuccessImpl implements _Fetshedsuccess {
  const _$FetshedsuccessImpl(final List<TransactionCategory> categories)
      : _categories = categories;

  final List<TransactionCategory> _categories;
  @override
  List<TransactionCategory> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  @override
  String toString() {
    return 'CategoriesState.fetshedsuccess(categories: $categories)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FetshedsuccessImpl &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FetshedsuccessImplCopyWith<_$FetshedsuccessImpl> get copyWith =>
      __$$FetshedsuccessImplCopyWithImpl<_$FetshedsuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function() addedsuccess,
    required TResult Function(List<TransactionCategory> categories)
        fetshedsuccess,
    required TResult Function(String error) failure,
  }) {
    return fetshedsuccess(categories);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? addedsuccess,
    TResult? Function(List<TransactionCategory> categories)? fetshedsuccess,
    TResult? Function(String error)? failure,
  }) {
    return fetshedsuccess?.call(categories);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? addedsuccess,
    TResult Function(List<TransactionCategory> categories)? fetshedsuccess,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (fetshedsuccess != null) {
      return fetshedsuccess(categories);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_AddedSuccess value) addedsuccess,
    required TResult Function(_Fetshedsuccess value) fetshedsuccess,
    required TResult Function(_Failure value) failure,
  }) {
    return fetshedsuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AddedSuccess value)? addedsuccess,
    TResult? Function(_Fetshedsuccess value)? fetshedsuccess,
    TResult? Function(_Failure value)? failure,
  }) {
    return fetshedsuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_AddedSuccess value)? addedsuccess,
    TResult Function(_Fetshedsuccess value)? fetshedsuccess,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (fetshedsuccess != null) {
      return fetshedsuccess(this);
    }
    return orElse();
  }
}

abstract class _Fetshedsuccess implements CategoriesState {
  const factory _Fetshedsuccess(final List<TransactionCategory> categories) =
      _$FetshedsuccessImpl;

  List<TransactionCategory> get categories;
  @JsonKey(ignore: true)
  _$$FetshedsuccessImplCopyWith<_$FetshedsuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<$Res> {
  factory _$$FailureImplCopyWith(
          _$FailureImpl value, $Res Function(_$FailureImpl) then) =
      __$$FailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$FailureImplCopyWithImpl<$Res>
    extends _$CategoriesStateCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl _value, $Res Function(_$FailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$FailureImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FailureImpl implements _Failure {
  const _$FailureImpl(this.error);

  @override
  final String error;

  @override
  String toString() {
    return 'CategoriesState.failure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

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
    required TResult Function() addedsuccess,
    required TResult Function(List<TransactionCategory> categories)
        fetshedsuccess,
    required TResult Function(String error) failure,
  }) {
    return failure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function()? addedsuccess,
    TResult? Function(List<TransactionCategory> categories)? fetshedsuccess,
    TResult? Function(String error)? failure,
  }) {
    return failure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function()? addedsuccess,
    TResult Function(List<TransactionCategory> categories)? fetshedsuccess,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_AddedSuccess value) addedsuccess,
    required TResult Function(_Fetshedsuccess value) fetshedsuccess,
    required TResult Function(_Failure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_AddedSuccess value)? addedsuccess,
    TResult? Function(_Fetshedsuccess value)? fetshedsuccess,
    TResult? Function(_Failure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_AddedSuccess value)? addedsuccess,
    TResult Function(_Fetshedsuccess value)? fetshedsuccess,
    TResult Function(_Failure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class _Failure implements CategoriesState {
  const factory _Failure(final String error) = _$FailureImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
