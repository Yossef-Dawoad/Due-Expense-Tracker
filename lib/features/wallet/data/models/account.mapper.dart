// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'account.dart';

class AccountMapper extends ClassMapperBase<Account> {
  AccountMapper._();

  static AccountMapper? _instance;
  static AccountMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = AccountMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Account';

  static String _$id(Account v) => v.id;
  static const Field<Account, String> _f$id = Field('id', _$id);
  static String _$userId(Account v) => v.userId;
  static const Field<Account, String> _f$userId = Field('userId', _$userId);
  static String _$name(Account v) => v.name;
  static const Field<Account, String> _f$name = Field('name', _$name);
  static String _$type(Account v) => v.type;
  static const Field<Account, String> _f$type = Field('type', _$type);
  static String _$currency(Account v) => v.currency;
  static const Field<Account, String> _f$currency = Field(
    'currency',
    _$currency,
    opt: true,
    def: 'USD',
  );
  static double _$balance(Account v) => v.balance;
  static const Field<Account, double> _f$balance = Field(
    'balance',
    _$balance,
    opt: true,
    def: 0.0,
  );
  static bool _$isArchived(Account v) => v.isArchived;
  static const Field<Account, bool> _f$isArchived = Field(
    'isArchived',
    _$isArchived,
    opt: true,
    def: false,
  );
  static String? _$remoteId(Account v) => v.remoteId;
  static const Field<Account, String> _f$remoteId = Field(
    'remoteId',
    _$remoteId,
    opt: true,
  );
  static bool _$isDirty(Account v) => v.isDirty;
  static const Field<Account, bool> _f$isDirty = Field(
    'isDirty',
    _$isDirty,
    opt: true,
    def: false,
  );
  static bool _$isDeleted(Account v) => v.isDeleted;
  static const Field<Account, bool> _f$isDeleted = Field(
    'isDeleted',
    _$isDeleted,
    opt: true,
    def: false,
  );
  static int _$version(Account v) => v.version;
  static const Field<Account, int> _f$version = Field(
    'version',
    _$version,
    opt: true,
    def: 0,
  );
  static int _$lastSynced(Account v) => v.lastSynced;
  static const Field<Account, int> _f$lastSynced = Field(
    'lastSynced',
    _$lastSynced,
    opt: true,
    def: 0,
  );

  @override
  final MappableFields<Account> fields = const {
    #id: _f$id,
    #userId: _f$userId,
    #name: _f$name,
    #type: _f$type,
    #currency: _f$currency,
    #balance: _f$balance,
    #isArchived: _f$isArchived,
    #remoteId: _f$remoteId,
    #isDirty: _f$isDirty,
    #isDeleted: _f$isDeleted,
    #version: _f$version,
    #lastSynced: _f$lastSynced,
  };

  static Account _instantiate(DecodingData data) {
    return Account(
      id: data.dec(_f$id),
      userId: data.dec(_f$userId),
      name: data.dec(_f$name),
      type: data.dec(_f$type),
      currency: data.dec(_f$currency),
      balance: data.dec(_f$balance),
      isArchived: data.dec(_f$isArchived),
      remoteId: data.dec(_f$remoteId),
      isDirty: data.dec(_f$isDirty),
      isDeleted: data.dec(_f$isDeleted),
      version: data.dec(_f$version),
      lastSynced: data.dec(_f$lastSynced),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Account fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Account>(map);
  }

  static Account fromJson(String json) {
    return ensureInitialized().decodeJson<Account>(json);
  }
}

mixin AccountMappable {
  String toJson() {
    return AccountMapper.ensureInitialized().encodeJson<Account>(
      this as Account,
    );
  }

  Map<String, dynamic> toMap() {
    return AccountMapper.ensureInitialized().encodeMap<Account>(
      this as Account,
    );
  }

  AccountCopyWith<Account, Account, Account> get copyWith =>
      _AccountCopyWithImpl<Account, Account>(
        this as Account,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return AccountMapper.ensureInitialized().stringifyValue(this as Account);
  }

  @override
  bool operator ==(Object other) {
    return AccountMapper.ensureInitialized().equalsValue(
      this as Account,
      other,
    );
  }

  @override
  int get hashCode {
    return AccountMapper.ensureInitialized().hashValue(this as Account);
  }
}

extension AccountValueCopy<$R, $Out> on ObjectCopyWith<$R, Account, $Out> {
  AccountCopyWith<$R, Account, $Out> get $asAccount =>
      $base.as((v, t, t2) => _AccountCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class AccountCopyWith<$R, $In extends Account, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? id,
    String? userId,
    String? name,
    String? type,
    String? currency,
    double? balance,
    bool? isArchived,
    String? remoteId,
    bool? isDirty,
    bool? isDeleted,
    int? version,
    int? lastSynced,
  });
  AccountCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _AccountCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Account, $Out>
    implements AccountCopyWith<$R, Account, $Out> {
  _AccountCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Account> $mapper =
      AccountMapper.ensureInitialized();
  @override
  $R call({
    String? id,
    String? userId,
    String? name,
    String? type,
    String? currency,
    double? balance,
    bool? isArchived,
    Object? remoteId = $none,
    bool? isDirty,
    bool? isDeleted,
    int? version,
    int? lastSynced,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (userId != null) #userId: userId,
      if (name != null) #name: name,
      if (type != null) #type: type,
      if (currency != null) #currency: currency,
      if (balance != null) #balance: balance,
      if (isArchived != null) #isArchived: isArchived,
      if (remoteId != $none) #remoteId: remoteId,
      if (isDirty != null) #isDirty: isDirty,
      if (isDeleted != null) #isDeleted: isDeleted,
      if (version != null) #version: version,
      if (lastSynced != null) #lastSynced: lastSynced,
    }),
  );
  @override
  Account $make(CopyWithData data) => Account(
    id: data.get(#id, or: $value.id),
    userId: data.get(#userId, or: $value.userId),
    name: data.get(#name, or: $value.name),
    type: data.get(#type, or: $value.type),
    currency: data.get(#currency, or: $value.currency),
    balance: data.get(#balance, or: $value.balance),
    isArchived: data.get(#isArchived, or: $value.isArchived),
    remoteId: data.get(#remoteId, or: $value.remoteId),
    isDirty: data.get(#isDirty, or: $value.isDirty),
    isDeleted: data.get(#isDeleted, or: $value.isDeleted),
    version: data.get(#version, or: $value.version),
    lastSynced: data.get(#lastSynced, or: $value.lastSynced),
  );

  @override
  AccountCopyWith<$R2, Account, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _AccountCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

