// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'transaction_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

TransactionCategory _$TransactionCategoryFromJson(Map<String, dynamic> json) {
  return _TransactionCategory.fromJson(json);
}

/// @nodoc
mixin _$TransactionCategory {
  String get uid => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  double get totalAmount => throw _privateConstructorUsedError;
  int get color => throw _privateConstructorUsedError;
  @enumerated
  TransactionStatus get status => throw _privateConstructorUsedError;
  @IconDataConverter()
  @ignore
  IconData get icon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TransactionCategoryCopyWith<TransactionCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TransactionCategoryCopyWith<$Res> {
  factory $TransactionCategoryCopyWith(
          TransactionCategory value, $Res Function(TransactionCategory) then) =
      _$TransactionCategoryCopyWithImpl<$Res, TransactionCategory>;
  @useResult
  $Res call(
      {String uid,
      String title,
      double totalAmount,
      int color,
      @enumerated TransactionStatus status,
      @IconDataConverter() @ignore IconData icon});
}

/// @nodoc
class _$TransactionCategoryCopyWithImpl<$Res, $Val extends TransactionCategory>
    implements $TransactionCategoryCopyWith<$Res> {
  _$TransactionCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? title = null,
    Object? totalAmount = null,
    Object? color = null,
    Object? status = null,
    Object? icon = null,
  }) {
    return _then(_value.copyWith(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TransactionStatus,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$TransactionCategoryImplCopyWith<$Res>
    implements $TransactionCategoryCopyWith<$Res> {
  factory _$$TransactionCategoryImplCopyWith(_$TransactionCategoryImpl value,
          $Res Function(_$TransactionCategoryImpl) then) =
      __$$TransactionCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String uid,
      String title,
      double totalAmount,
      int color,
      @enumerated TransactionStatus status,
      @IconDataConverter() @ignore IconData icon});
}

/// @nodoc
class __$$TransactionCategoryImplCopyWithImpl<$Res>
    extends _$TransactionCategoryCopyWithImpl<$Res, _$TransactionCategoryImpl>
    implements _$$TransactionCategoryImplCopyWith<$Res> {
  __$$TransactionCategoryImplCopyWithImpl(_$TransactionCategoryImpl _value,
      $Res Function(_$TransactionCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uid = null,
    Object? title = null,
    Object? totalAmount = null,
    Object? color = null,
    Object? status = null,
    Object? icon = null,
  }) {
    return _then(_$TransactionCategoryImpl(
      uid: null == uid
          ? _value.uid
          : uid // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      color: null == color
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as TransactionStatus,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TransactionCategoryImpl extends _TransactionCategory
    with DiagnosticableTreeMixin {
  const _$TransactionCategoryImpl(
      {required this.uid,
      required this.title,
      this.totalAmount = 0.0,
      required this.color,
      @enumerated required this.status,
      @IconDataConverter() @ignore required this.icon})
      : super._();

  factory _$TransactionCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$TransactionCategoryImplFromJson(json);

  @override
  final String uid;
  @override
  final String title;
  @override
  @JsonKey()
  final double totalAmount;
  @override
  final int color;
  @override
  @enumerated
  final TransactionStatus status;
  @override
  @IconDataConverter()
  @ignore
  final IconData icon;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'TransactionCategory(uid: $uid, title: $title, totalAmount: $totalAmount, color: $color, status: $status, icon: $icon)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'TransactionCategory'))
      ..add(DiagnosticsProperty('uid', uid))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('totalAmount', totalAmount))
      ..add(DiagnosticsProperty('color', color))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('icon', icon));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TransactionCategoryImpl &&
            (identical(other.uid, uid) || other.uid == uid) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, uid, title, totalAmount, color, status, icon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TransactionCategoryImplCopyWith<_$TransactionCategoryImpl> get copyWith =>
      __$$TransactionCategoryImplCopyWithImpl<_$TransactionCategoryImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TransactionCategoryImplToJson(
      this,
    );
  }
}

abstract class _TransactionCategory extends TransactionCategory {
  const factory _TransactionCategory(
          {required final String uid,
          required final String title,
          final double totalAmount,
          required final int color,
          @enumerated required final TransactionStatus status,
          @IconDataConverter() @ignore required final IconData icon}) =
      _$TransactionCategoryImpl;
  const _TransactionCategory._() : super._();

  factory _TransactionCategory.fromJson(Map<String, dynamic> json) =
      _$TransactionCategoryImpl.fromJson;

  @override
  String get uid;
  @override
  String get title;
  @override
  double get totalAmount;
  @override
  int get color;
  @override
  @enumerated
  TransactionStatus get status;
  @override
  @IconDataConverter()
  @ignore
  IconData get icon;
  @override
  @JsonKey(ignore: true)
  _$$TransactionCategoryImplCopyWith<_$TransactionCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
