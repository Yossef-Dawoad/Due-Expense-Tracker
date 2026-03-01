// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'transaction.dart';

class TransactionTypeMapper extends EnumMapper<TransactionType> {
  TransactionTypeMapper._();

  static TransactionTypeMapper? _instance;
  static TransactionTypeMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TransactionTypeMapper._());
    }
    return _instance!;
  }

  static TransactionType fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  TransactionType decode(dynamic value) {
    switch (value) {
      case r'expense':
        return TransactionType.expense;
      case r'income':
        return TransactionType.income;
      case r'transfer':
        return TransactionType.transfer;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(TransactionType self) {
    switch (self) {
      case TransactionType.expense:
        return r'expense';
      case TransactionType.income:
        return r'income';
      case TransactionType.transfer:
        return r'transfer';
    }
  }
}

extension TransactionTypeMapperExtension on TransactionType {
  String toValue() {
    TransactionTypeMapper.ensureInitialized();
    return MapperContainer.globals.toValue<TransactionType>(this) as String;
  }
}

class TransactionMapper extends ClassMapperBase<Transaction> {
  TransactionMapper._();

  static TransactionMapper? _instance;
  static TransactionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TransactionMapper._());
      TransactionTypeMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Transaction';

  static String _$id(Transaction v) => v.id;
  static const Field<Transaction, String> _f$id = Field('id', _$id);
  static String _$userId(Transaction v) => v.userId;
  static const Field<Transaction, String> _f$userId = Field('userId', _$userId);
  static String _$accountId(Transaction v) => v.accountId;
  static const Field<Transaction, String> _f$accountId = Field(
    'accountId',
    _$accountId,
  );
  static double _$amount(Transaction v) => v.amount;
  static const Field<Transaction, double> _f$amount = Field('amount', _$amount);
  static TransactionType _$type(Transaction v) => v.type;
  static const Field<Transaction, TransactionType> _f$type = Field(
    'type',
    _$type,
  );
  static DateTime _$date(Transaction v) => v.date;
  static const Field<Transaction, DateTime> _f$date = Field('date', _$date);
  static String? _$categoryId(Transaction v) => v.categoryId;
  static const Field<Transaction, String> _f$categoryId = Field(
    'categoryId',
    _$categoryId,
    opt: true,
  );
  static String? _$note(Transaction v) => v.note;
  static const Field<Transaction, String> _f$note = Field(
    'note',
    _$note,
    opt: true,
  );
  static bool _$isPending(Transaction v) => v.isPending;
  static const Field<Transaction, bool> _f$isPending = Field(
    'isPending',
    _$isPending,
    opt: true,
    def: false,
  );
  static String? _$externalId(Transaction v) => v.externalId;
  static const Field<Transaction, String> _f$externalId = Field(
    'externalId',
    _$externalId,
    opt: true,
  );
  static String? _$transferGroupId(Transaction v) => v.transferGroupId;
  static const Field<Transaction, String> _f$transferGroupId = Field(
    'transferGroupId',
    _$transferGroupId,
    opt: true,
  );
  static String? _$remoteId(Transaction v) => v.remoteId;
  static const Field<Transaction, String> _f$remoteId = Field(
    'remoteId',
    _$remoteId,
    opt: true,
  );
  static bool _$isDirty(Transaction v) => v.isDirty;
  static const Field<Transaction, bool> _f$isDirty = Field(
    'isDirty',
    _$isDirty,
    opt: true,
    def: false,
  );
  static bool _$isDeleted(Transaction v) => v.isDeleted;
  static const Field<Transaction, bool> _f$isDeleted = Field(
    'isDeleted',
    _$isDeleted,
    opt: true,
    def: false,
  );
  static int _$version(Transaction v) => v.version;
  static const Field<Transaction, int> _f$version = Field(
    'version',
    _$version,
    opt: true,
    def: 0,
  );
  static int _$lastSynced(Transaction v) => v.lastSynced;
  static const Field<Transaction, int> _f$lastSynced = Field(
    'lastSynced',
    _$lastSynced,
    opt: true,
    def: 0,
  );

  @override
  final MappableFields<Transaction> fields = const {
    #id: _f$id,
    #userId: _f$userId,
    #accountId: _f$accountId,
    #amount: _f$amount,
    #type: _f$type,
    #date: _f$date,
    #categoryId: _f$categoryId,
    #note: _f$note,
    #isPending: _f$isPending,
    #externalId: _f$externalId,
    #transferGroupId: _f$transferGroupId,
    #remoteId: _f$remoteId,
    #isDirty: _f$isDirty,
    #isDeleted: _f$isDeleted,
    #version: _f$version,
    #lastSynced: _f$lastSynced,
  };

  static Transaction _instantiate(DecodingData data) {
    return Transaction(
      id: data.dec(_f$id),
      userId: data.dec(_f$userId),
      accountId: data.dec(_f$accountId),
      amount: data.dec(_f$amount),
      type: data.dec(_f$type),
      date: data.dec(_f$date),
      categoryId: data.dec(_f$categoryId),
      note: data.dec(_f$note),
      isPending: data.dec(_f$isPending),
      externalId: data.dec(_f$externalId),
      transferGroupId: data.dec(_f$transferGroupId),
      remoteId: data.dec(_f$remoteId),
      isDirty: data.dec(_f$isDirty),
      isDeleted: data.dec(_f$isDeleted),
      version: data.dec(_f$version),
      lastSynced: data.dec(_f$lastSynced),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Transaction fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Transaction>(map);
  }

  static Transaction fromJson(String json) {
    return ensureInitialized().decodeJson<Transaction>(json);
  }
}

mixin TransactionMappable {
  String toJson() {
    return TransactionMapper.ensureInitialized().encodeJson<Transaction>(
      this as Transaction,
    );
  }

  Map<String, dynamic> toMap() {
    return TransactionMapper.ensureInitialized().encodeMap<Transaction>(
      this as Transaction,
    );
  }

  TransactionCopyWith<Transaction, Transaction, Transaction> get copyWith =>
      _TransactionCopyWithImpl<Transaction, Transaction>(
        this as Transaction,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return TransactionMapper.ensureInitialized().stringifyValue(
      this as Transaction,
    );
  }

  @override
  bool operator ==(Object other) {
    return TransactionMapper.ensureInitialized().equalsValue(
      this as Transaction,
      other,
    );
  }

  @override
  int get hashCode {
    return TransactionMapper.ensureInitialized().hashValue(this as Transaction);
  }
}

extension TransactionValueCopy<$R, $Out>
    on ObjectCopyWith<$R, Transaction, $Out> {
  TransactionCopyWith<$R, Transaction, $Out> get $asTransaction =>
      $base.as((v, t, t2) => _TransactionCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TransactionCopyWith<$R, $In extends Transaction, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? id,
    String? userId,
    String? accountId,
    double? amount,
    TransactionType? type,
    DateTime? date,
    String? categoryId,
    String? note,
    bool? isPending,
    String? externalId,
    String? transferGroupId,
    String? remoteId,
    bool? isDirty,
    bool? isDeleted,
    int? version,
    int? lastSynced,
  });
  TransactionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TransactionCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Transaction, $Out>
    implements TransactionCopyWith<$R, Transaction, $Out> {
  _TransactionCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Transaction> $mapper =
      TransactionMapper.ensureInitialized();
  @override
  $R call({
    String? id,
    String? userId,
    String? accountId,
    double? amount,
    TransactionType? type,
    DateTime? date,
    Object? categoryId = $none,
    Object? note = $none,
    bool? isPending,
    Object? externalId = $none,
    Object? transferGroupId = $none,
    Object? remoteId = $none,
    bool? isDirty,
    bool? isDeleted,
    int? version,
    int? lastSynced,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (userId != null) #userId: userId,
      if (accountId != null) #accountId: accountId,
      if (amount != null) #amount: amount,
      if (type != null) #type: type,
      if (date != null) #date: date,
      if (categoryId != $none) #categoryId: categoryId,
      if (note != $none) #note: note,
      if (isPending != null) #isPending: isPending,
      if (externalId != $none) #externalId: externalId,
      if (transferGroupId != $none) #transferGroupId: transferGroupId,
      if (remoteId != $none) #remoteId: remoteId,
      if (isDirty != null) #isDirty: isDirty,
      if (isDeleted != null) #isDeleted: isDeleted,
      if (version != null) #version: version,
      if (lastSynced != null) #lastSynced: lastSynced,
    }),
  );
  @override
  Transaction $make(CopyWithData data) => Transaction(
    id: data.get(#id, or: $value.id),
    userId: data.get(#userId, or: $value.userId),
    accountId: data.get(#accountId, or: $value.accountId),
    amount: data.get(#amount, or: $value.amount),
    type: data.get(#type, or: $value.type),
    date: data.get(#date, or: $value.date),
    categoryId: data.get(#categoryId, or: $value.categoryId),
    note: data.get(#note, or: $value.note),
    isPending: data.get(#isPending, or: $value.isPending),
    externalId: data.get(#externalId, or: $value.externalId),
    transferGroupId: data.get(#transferGroupId, or: $value.transferGroupId),
    remoteId: data.get(#remoteId, or: $value.remoteId),
    isDirty: data.get(#isDirty, or: $value.isDirty),
    isDeleted: data.get(#isDeleted, or: $value.isDeleted),
    version: data.get(#version, or: $value.version),
    lastSynced: data.get(#lastSynced, or: $value.lastSynced),
  );

  @override
  TransactionCopyWith<$R2, Transaction, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _TransactionCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

