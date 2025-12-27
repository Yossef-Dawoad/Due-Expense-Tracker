// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'transaction_category.dart';

class TransactionStatusMapper extends EnumMapper<TransactionStatus> {
  TransactionStatusMapper._();

  static TransactionStatusMapper? _instance;
  static TransactionStatusMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TransactionStatusMapper._());
    }
    return _instance!;
  }

  static TransactionStatus fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  TransactionStatus decode(dynamic value) {
    switch (value) {
      case r'income':
        return TransactionStatus.income;
      case r'expense':
        return TransactionStatus.expense;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(TransactionStatus self) {
    switch (self) {
      case TransactionStatus.income:
        return r'income';
      case TransactionStatus.expense:
        return r'expense';
    }
  }
}

extension TransactionStatusMapperExtension on TransactionStatus {
  String toValue() {
    TransactionStatusMapper.ensureInitialized();
    return MapperContainer.globals.toValue<TransactionStatus>(this) as String;
  }
}

class TransactionCategoryMapper extends ClassMapperBase<TransactionCategory> {
  TransactionCategoryMapper._();

  static TransactionCategoryMapper? _instance;
  static TransactionCategoryMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TransactionCategoryMapper._());
      MapperContainer.globals.useAll([IconDataMapper()]);
      TransactionStatusMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TransactionCategory';

  static String _$id(TransactionCategory v) => v.id;
  static const Field<TransactionCategory, String> _f$id = Field('id', _$id);
  static String _$title(TransactionCategory v) => v.title;
  static const Field<TransactionCategory, String> _f$title = Field(
    'title',
    _$title,
  );
  static double _$totalAmount(TransactionCategory v) => v.totalAmount;
  static const Field<TransactionCategory, double> _f$totalAmount = Field(
    'totalAmount',
    _$totalAmount,
    opt: true,
    def: 0.0,
  );
  static int _$color(TransactionCategory v) => v.color;
  static const Field<TransactionCategory, int> _f$color = Field(
    'color',
    _$color,
  );
  static TransactionStatus _$status(TransactionCategory v) => v.status;
  static const Field<TransactionCategory, TransactionStatus> _f$status = Field(
    'status',
    _$status,
  );
  static IconData _$icon(TransactionCategory v) => v.icon;
  static const Field<TransactionCategory, IconData> _f$icon = Field(
    'icon',
    _$icon,
  );

  @override
  final MappableFields<TransactionCategory> fields = const {
    #id: _f$id,
    #title: _f$title,
    #totalAmount: _f$totalAmount,
    #color: _f$color,
    #status: _f$status,
    #icon: _f$icon,
  };

  static TransactionCategory _instantiate(DecodingData data) {
    return TransactionCategory(
      id: data.dec(_f$id),
      title: data.dec(_f$title),
      totalAmount: data.dec(_f$totalAmount),
      color: data.dec(_f$color),
      status: data.dec(_f$status),
      icon: data.dec(_f$icon),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static TransactionCategory fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TransactionCategory>(map);
  }

  static TransactionCategory fromJson(String json) {
    return ensureInitialized().decodeJson<TransactionCategory>(json);
  }
}

mixin TransactionCategoryMappable {
  String toJson() {
    return TransactionCategoryMapper.ensureInitialized()
        .encodeJson<TransactionCategory>(this as TransactionCategory);
  }

  Map<String, dynamic> toMap() {
    return TransactionCategoryMapper.ensureInitialized()
        .encodeMap<TransactionCategory>(this as TransactionCategory);
  }

  TransactionCategoryCopyWith<
    TransactionCategory,
    TransactionCategory,
    TransactionCategory
  >
  get copyWith =>
      _TransactionCategoryCopyWithImpl<
        TransactionCategory,
        TransactionCategory
      >(this as TransactionCategory, $identity, $identity);
  @override
  String toString() {
    return TransactionCategoryMapper.ensureInitialized().stringifyValue(
      this as TransactionCategory,
    );
  }

  @override
  bool operator ==(Object other) {
    return TransactionCategoryMapper.ensureInitialized().equalsValue(
      this as TransactionCategory,
      other,
    );
  }

  @override
  int get hashCode {
    return TransactionCategoryMapper.ensureInitialized().hashValue(
      this as TransactionCategory,
    );
  }
}

extension TransactionCategoryValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TransactionCategory, $Out> {
  TransactionCategoryCopyWith<$R, TransactionCategory, $Out>
  get $asTransactionCategory => $base.as(
    (v, t, t2) => _TransactionCategoryCopyWithImpl<$R, $Out>(v, t, t2),
  );
}

abstract class TransactionCategoryCopyWith<
  $R,
  $In extends TransactionCategory,
  $Out
>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? id,
    String? title,
    double? totalAmount,
    int? color,
    TransactionStatus? status,
    IconData? icon,
  });
  TransactionCategoryCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _TransactionCategoryCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TransactionCategory, $Out>
    implements TransactionCategoryCopyWith<$R, TransactionCategory, $Out> {
  _TransactionCategoryCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TransactionCategory> $mapper =
      TransactionCategoryMapper.ensureInitialized();
  @override
  $R call({
    String? id,
    String? title,
    double? totalAmount,
    int? color,
    TransactionStatus? status,
    IconData? icon,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (title != null) #title: title,
      if (totalAmount != null) #totalAmount: totalAmount,
      if (color != null) #color: color,
      if (status != null) #status: status,
      if (icon != null) #icon: icon,
    }),
  );
  @override
  TransactionCategory $make(CopyWithData data) => TransactionCategory(
    id: data.get(#id, or: $value.id),
    title: data.get(#title, or: $value.title),
    totalAmount: data.get(#totalAmount, or: $value.totalAmount),
    color: data.get(#color, or: $value.color),
    status: data.get(#status, or: $value.status),
    icon: data.get(#icon, or: $value.icon),
  );

  @override
  TransactionCategoryCopyWith<$R2, TransactionCategory, $Out2>
  $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _TransactionCategoryCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

