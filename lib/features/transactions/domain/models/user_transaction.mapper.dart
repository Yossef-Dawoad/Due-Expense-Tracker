// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'user_transaction.dart';

class UserTransactionMapper extends ClassMapperBase<UserTransaction> {
  UserTransactionMapper._();

  static UserTransactionMapper? _instance;
  static UserTransactionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = UserTransactionMapper._());
      TransactionCategoryMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'UserTransaction';

  static String _$id(UserTransaction v) => v.id;
  static const Field<UserTransaction, String> _f$id = Field('id', _$id);
  static double _$amount(UserTransaction v) => v.amount;
  static const Field<UserTransaction, double> _f$amount = Field(
    'amount',
    _$amount,
  );
  static DateTime _$datetime(UserTransaction v) => v.datetime;
  static const Field<UserTransaction, DateTime> _f$datetime = Field(
    'datetime',
    _$datetime,
  );
  static TransactionCategory _$category(UserTransaction v) => v.category;
  static const Field<UserTransaction, TransactionCategory> _f$category = Field(
    'category',
    _$category,
  );
  static String? _$note(UserTransaction v) => v.note;
  static const Field<UserTransaction, String> _f$note = Field(
    'note',
    _$note,
    opt: true,
  );

  @override
  final MappableFields<UserTransaction> fields = const {
    #id: _f$id,
    #amount: _f$amount,
    #datetime: _f$datetime,
    #category: _f$category,
    #note: _f$note,
  };

  static UserTransaction _instantiate(DecodingData data) {
    return UserTransaction(
      id: data.dec(_f$id),
      amount: data.dec(_f$amount),
      datetime: data.dec(_f$datetime),
      category: data.dec(_f$category),
      note: data.dec(_f$note),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static UserTransaction fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<UserTransaction>(map);
  }

  static UserTransaction fromJson(String json) {
    return ensureInitialized().decodeJson<UserTransaction>(json);
  }
}

mixin UserTransactionMappable {
  String toJson() {
    return UserTransactionMapper.ensureInitialized()
        .encodeJson<UserTransaction>(this as UserTransaction);
  }

  Map<String, dynamic> toMap() {
    return UserTransactionMapper.ensureInitialized().encodeMap<UserTransaction>(
      this as UserTransaction,
    );
  }

  UserTransactionCopyWith<UserTransaction, UserTransaction, UserTransaction>
  get copyWith =>
      _UserTransactionCopyWithImpl<UserTransaction, UserTransaction>(
        this as UserTransaction,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return UserTransactionMapper.ensureInitialized().stringifyValue(
      this as UserTransaction,
    );
  }

  @override
  bool operator ==(Object other) {
    return UserTransactionMapper.ensureInitialized().equalsValue(
      this as UserTransaction,
      other,
    );
  }

  @override
  int get hashCode {
    return UserTransactionMapper.ensureInitialized().hashValue(
      this as UserTransaction,
    );
  }
}

extension UserTransactionValueCopy<$R, $Out>
    on ObjectCopyWith<$R, UserTransaction, $Out> {
  UserTransactionCopyWith<$R, UserTransaction, $Out> get $asUserTransaction =>
      $base.as((v, t, t2) => _UserTransactionCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class UserTransactionCopyWith<$R, $In extends UserTransaction, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  TransactionCategoryCopyWith<$R, TransactionCategory, TransactionCategory>
  get category;
  $R call({
    String? id,
    double? amount,
    DateTime? datetime,
    TransactionCategory? category,
    String? note,
  });
  UserTransactionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  );
}

class _UserTransactionCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, UserTransaction, $Out>
    implements UserTransactionCopyWith<$R, UserTransaction, $Out> {
  _UserTransactionCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<UserTransaction> $mapper =
      UserTransactionMapper.ensureInitialized();
  @override
  TransactionCategoryCopyWith<$R, TransactionCategory, TransactionCategory>
  get category => $value.category.copyWith.$chain((v) => call(category: v));
  @override
  $R call({
    String? id,
    double? amount,
    DateTime? datetime,
    TransactionCategory? category,
    Object? note = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (amount != null) #amount: amount,
      if (datetime != null) #datetime: datetime,
      if (category != null) #category: category,
      if (note != $none) #note: note,
    }),
  );
  @override
  UserTransaction $make(CopyWithData data) => UserTransaction(
    id: data.get(#id, or: $value.id),
    amount: data.get(#amount, or: $value.amount),
    datetime: data.get(#datetime, or: $value.datetime),
    category: data.get(#category, or: $value.category),
    note: data.get(#note, or: $value.note),
  );

  @override
  UserTransactionCopyWith<$R2, UserTransaction, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _UserTransactionCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

