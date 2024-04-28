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
    required TResult Function(TransactionCategory category) addedsuccess,
    required TResult Function(List<TransactionCategory> categories)
        fetshedsuccess,
    required TResult Function(String error) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(TransactionCategory category)? addedsuccess,
    TResult? Function(List<TransactionCategory> categories)? fetshedsuccess,
    TResult? Function(String error)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(TransactionCategory category)? addedsuccess,
    TResult Function(List<TransactionCategory> categories)? fetshedsuccess,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(CategoryLoading value) loading,
    required TResult Function(CategoryAddSuccess value) addedsuccess,
    required TResult Function(CategoryFetchSuccess value) fetshedsuccess,
    required TResult Function(CategoryFailure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(CategoryLoading value)? loading,
    TResult? Function(CategoryAddSuccess value)? addedsuccess,
    TResult? Function(CategoryFetchSuccess value)? fetshedsuccess,
    TResult? Function(CategoryFailure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(CategoryLoading value)? loading,
    TResult Function(CategoryAddSuccess value)? addedsuccess,
    TResult Function(CategoryFetchSuccess value)? fetshedsuccess,
    TResult Function(CategoryFailure value)? failure,
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
    required TResult Function(TransactionCategory category) addedsuccess,
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
    TResult? Function(TransactionCategory category)? addedsuccess,
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
    TResult Function(TransactionCategory category)? addedsuccess,
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
    required TResult Function(CategoryLoading value) loading,
    required TResult Function(CategoryAddSuccess value) addedsuccess,
    required TResult Function(CategoryFetchSuccess value) fetshedsuccess,
    required TResult Function(CategoryFailure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(CategoryLoading value)? loading,
    TResult? Function(CategoryAddSuccess value)? addedsuccess,
    TResult? Function(CategoryFetchSuccess value)? fetshedsuccess,
    TResult? Function(CategoryFailure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(CategoryLoading value)? loading,
    TResult Function(CategoryAddSuccess value)? addedsuccess,
    TResult Function(CategoryFetchSuccess value)? fetshedsuccess,
    TResult Function(CategoryFailure value)? failure,
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
abstract class _$$CategoryLoadingImplCopyWith<$Res> {
  factory _$$CategoryLoadingImplCopyWith(_$CategoryLoadingImpl value,
          $Res Function(_$CategoryLoadingImpl) then) =
      __$$CategoryLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CategoryLoadingImplCopyWithImpl<$Res>
    extends _$CategoriesStateCopyWithImpl<$Res, _$CategoryLoadingImpl>
    implements _$$CategoryLoadingImplCopyWith<$Res> {
  __$$CategoryLoadingImplCopyWithImpl(
      _$CategoryLoadingImpl _value, $Res Function(_$CategoryLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$CategoryLoadingImpl implements CategoryLoading {
  const _$CategoryLoadingImpl();

  @override
  String toString() {
    return 'CategoriesState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$CategoryLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(TransactionCategory category) addedsuccess,
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
    TResult? Function(TransactionCategory category)? addedsuccess,
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
    TResult Function(TransactionCategory category)? addedsuccess,
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
    required TResult Function(CategoryLoading value) loading,
    required TResult Function(CategoryAddSuccess value) addedsuccess,
    required TResult Function(CategoryFetchSuccess value) fetshedsuccess,
    required TResult Function(CategoryFailure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(CategoryLoading value)? loading,
    TResult? Function(CategoryAddSuccess value)? addedsuccess,
    TResult? Function(CategoryFetchSuccess value)? fetshedsuccess,
    TResult? Function(CategoryFailure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(CategoryLoading value)? loading,
    TResult Function(CategoryAddSuccess value)? addedsuccess,
    TResult Function(CategoryFetchSuccess value)? fetshedsuccess,
    TResult Function(CategoryFailure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class CategoryLoading implements CategoriesState {
  const factory CategoryLoading() = _$CategoryLoadingImpl;
}

/// @nodoc
abstract class _$$CategoryAddSuccessImplCopyWith<$Res> {
  factory _$$CategoryAddSuccessImplCopyWith(_$CategoryAddSuccessImpl value,
          $Res Function(_$CategoryAddSuccessImpl) then) =
      __$$CategoryAddSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({TransactionCategory category});

  $TransactionCategoryCopyWith<$Res> get category;
}

/// @nodoc
class __$$CategoryAddSuccessImplCopyWithImpl<$Res>
    extends _$CategoriesStateCopyWithImpl<$Res, _$CategoryAddSuccessImpl>
    implements _$$CategoryAddSuccessImplCopyWith<$Res> {
  __$$CategoryAddSuccessImplCopyWithImpl(_$CategoryAddSuccessImpl _value,
      $Res Function(_$CategoryAddSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? category = null,
  }) {
    return _then(_$CategoryAddSuccessImpl(
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

class _$CategoryAddSuccessImpl implements CategoryAddSuccess {
  const _$CategoryAddSuccessImpl(this.category);

  @override
  final TransactionCategory category;

  @override
  String toString() {
    return 'CategoriesState.addedsuccess(category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryAddSuccessImpl &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @override
  int get hashCode => Object.hash(runtimeType, category);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryAddSuccessImplCopyWith<_$CategoryAddSuccessImpl> get copyWith =>
      __$$CategoryAddSuccessImplCopyWithImpl<_$CategoryAddSuccessImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(TransactionCategory category) addedsuccess,
    required TResult Function(List<TransactionCategory> categories)
        fetshedsuccess,
    required TResult Function(String error) failure,
  }) {
    return addedsuccess(category);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(TransactionCategory category)? addedsuccess,
    TResult? Function(List<TransactionCategory> categories)? fetshedsuccess,
    TResult? Function(String error)? failure,
  }) {
    return addedsuccess?.call(category);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(TransactionCategory category)? addedsuccess,
    TResult Function(List<TransactionCategory> categories)? fetshedsuccess,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (addedsuccess != null) {
      return addedsuccess(category);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(CategoryLoading value) loading,
    required TResult Function(CategoryAddSuccess value) addedsuccess,
    required TResult Function(CategoryFetchSuccess value) fetshedsuccess,
    required TResult Function(CategoryFailure value) failure,
  }) {
    return addedsuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(CategoryLoading value)? loading,
    TResult? Function(CategoryAddSuccess value)? addedsuccess,
    TResult? Function(CategoryFetchSuccess value)? fetshedsuccess,
    TResult? Function(CategoryFailure value)? failure,
  }) {
    return addedsuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(CategoryLoading value)? loading,
    TResult Function(CategoryAddSuccess value)? addedsuccess,
    TResult Function(CategoryFetchSuccess value)? fetshedsuccess,
    TResult Function(CategoryFailure value)? failure,
    required TResult orElse(),
  }) {
    if (addedsuccess != null) {
      return addedsuccess(this);
    }
    return orElse();
  }
}

abstract class CategoryAddSuccess implements CategoriesState {
  const factory CategoryAddSuccess(final TransactionCategory category) =
      _$CategoryAddSuccessImpl;

  TransactionCategory get category;
  @JsonKey(ignore: true)
  _$$CategoryAddSuccessImplCopyWith<_$CategoryAddSuccessImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CategoryFetchSuccessImplCopyWith<$Res> {
  factory _$$CategoryFetchSuccessImplCopyWith(_$CategoryFetchSuccessImpl value,
          $Res Function(_$CategoryFetchSuccessImpl) then) =
      __$$CategoryFetchSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<TransactionCategory> categories});
}

/// @nodoc
class __$$CategoryFetchSuccessImplCopyWithImpl<$Res>
    extends _$CategoriesStateCopyWithImpl<$Res, _$CategoryFetchSuccessImpl>
    implements _$$CategoryFetchSuccessImplCopyWith<$Res> {
  __$$CategoryFetchSuccessImplCopyWithImpl(_$CategoryFetchSuccessImpl _value,
      $Res Function(_$CategoryFetchSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categories = null,
  }) {
    return _then(_$CategoryFetchSuccessImpl(
      null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<TransactionCategory>,
    ));
  }
}

/// @nodoc

class _$CategoryFetchSuccessImpl implements CategoryFetchSuccess {
  const _$CategoryFetchSuccessImpl(final List<TransactionCategory> categories)
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
            other is _$CategoryFetchSuccessImpl &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_categories));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryFetchSuccessImplCopyWith<_$CategoryFetchSuccessImpl>
      get copyWith =>
          __$$CategoryFetchSuccessImplCopyWithImpl<_$CategoryFetchSuccessImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(TransactionCategory category) addedsuccess,
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
    TResult? Function(TransactionCategory category)? addedsuccess,
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
    TResult Function(TransactionCategory category)? addedsuccess,
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
    required TResult Function(CategoryLoading value) loading,
    required TResult Function(CategoryAddSuccess value) addedsuccess,
    required TResult Function(CategoryFetchSuccess value) fetshedsuccess,
    required TResult Function(CategoryFailure value) failure,
  }) {
    return fetshedsuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(CategoryLoading value)? loading,
    TResult? Function(CategoryAddSuccess value)? addedsuccess,
    TResult? Function(CategoryFetchSuccess value)? fetshedsuccess,
    TResult? Function(CategoryFailure value)? failure,
  }) {
    return fetshedsuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(CategoryLoading value)? loading,
    TResult Function(CategoryAddSuccess value)? addedsuccess,
    TResult Function(CategoryFetchSuccess value)? fetshedsuccess,
    TResult Function(CategoryFailure value)? failure,
    required TResult orElse(),
  }) {
    if (fetshedsuccess != null) {
      return fetshedsuccess(this);
    }
    return orElse();
  }
}

abstract class CategoryFetchSuccess implements CategoriesState {
  const factory CategoryFetchSuccess(
      final List<TransactionCategory> categories) = _$CategoryFetchSuccessImpl;

  List<TransactionCategory> get categories;
  @JsonKey(ignore: true)
  _$$CategoryFetchSuccessImplCopyWith<_$CategoryFetchSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CategoryFailureImplCopyWith<$Res> {
  factory _$$CategoryFailureImplCopyWith(_$CategoryFailureImpl value,
          $Res Function(_$CategoryFailureImpl) then) =
      __$$CategoryFailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$CategoryFailureImplCopyWithImpl<$Res>
    extends _$CategoriesStateCopyWithImpl<$Res, _$CategoryFailureImpl>
    implements _$$CategoryFailureImplCopyWith<$Res> {
  __$$CategoryFailureImplCopyWithImpl(
      _$CategoryFailureImpl _value, $Res Function(_$CategoryFailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$CategoryFailureImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$CategoryFailureImpl implements CategoryFailure {
  const _$CategoryFailureImpl(this.error);

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
            other is _$CategoryFailureImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryFailureImplCopyWith<_$CategoryFailureImpl> get copyWith =>
      __$$CategoryFailureImplCopyWithImpl<_$CategoryFailureImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(TransactionCategory category) addedsuccess,
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
    TResult? Function(TransactionCategory category)? addedsuccess,
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
    TResult Function(TransactionCategory category)? addedsuccess,
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
    required TResult Function(CategoryLoading value) loading,
    required TResult Function(CategoryAddSuccess value) addedsuccess,
    required TResult Function(CategoryFetchSuccess value) fetshedsuccess,
    required TResult Function(CategoryFailure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(CategoryLoading value)? loading,
    TResult? Function(CategoryAddSuccess value)? addedsuccess,
    TResult? Function(CategoryFetchSuccess value)? fetshedsuccess,
    TResult? Function(CategoryFailure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(CategoryLoading value)? loading,
    TResult Function(CategoryAddSuccess value)? addedsuccess,
    TResult Function(CategoryFetchSuccess value)? fetshedsuccess,
    TResult Function(CategoryFailure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class CategoryFailure implements CategoriesState {
  const factory CategoryFailure(final String error) = _$CategoryFailureImpl;

  String get error;
  @JsonKey(ignore: true)
  _$$CategoryFailureImplCopyWith<_$CategoryFailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
