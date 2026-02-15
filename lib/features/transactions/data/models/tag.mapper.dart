// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'tag.dart';

class TagMapper extends ClassMapperBase<Tag> {
  TagMapper._();

  static TagMapper? _instance;
  static TagMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TagMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Tag';

  static String _$id(Tag v) => v.id;
  static const Field<Tag, String> _f$id = Field('id', _$id);
  static String _$userId(Tag v) => v.userId;
  static const Field<Tag, String> _f$userId = Field('userId', _$userId);
  static String _$name(Tag v) => v.name;
  static const Field<Tag, String> _f$name = Field('name', _$name);
  static String? _$remoteId(Tag v) => v.remoteId;
  static const Field<Tag, String> _f$remoteId = Field(
    'remoteId',
    _$remoteId,
    opt: true,
  );
  static bool _$isDirty(Tag v) => v.isDirty;
  static const Field<Tag, bool> _f$isDirty = Field(
    'isDirty',
    _$isDirty,
    opt: true,
    def: false,
  );
  static bool _$isDeleted(Tag v) => v.isDeleted;
  static const Field<Tag, bool> _f$isDeleted = Field(
    'isDeleted',
    _$isDeleted,
    opt: true,
    def: false,
  );
  static int _$version(Tag v) => v.version;
  static const Field<Tag, int> _f$version = Field(
    'version',
    _$version,
    opt: true,
    def: 0,
  );
  static int _$lastSynced(Tag v) => v.lastSynced;
  static const Field<Tag, int> _f$lastSynced = Field(
    'lastSynced',
    _$lastSynced,
    opt: true,
    def: 0,
  );

  @override
  final MappableFields<Tag> fields = const {
    #id: _f$id,
    #userId: _f$userId,
    #name: _f$name,
    #remoteId: _f$remoteId,
    #isDirty: _f$isDirty,
    #isDeleted: _f$isDeleted,
    #version: _f$version,
    #lastSynced: _f$lastSynced,
  };

  static Tag _instantiate(DecodingData data) {
    return Tag(
      id: data.dec(_f$id),
      userId: data.dec(_f$userId),
      name: data.dec(_f$name),
      remoteId: data.dec(_f$remoteId),
      isDirty: data.dec(_f$isDirty),
      isDeleted: data.dec(_f$isDeleted),
      version: data.dec(_f$version),
      lastSynced: data.dec(_f$lastSynced),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Tag fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Tag>(map);
  }

  static Tag fromJson(String json) {
    return ensureInitialized().decodeJson<Tag>(json);
  }
}

mixin TagMappable {
  String toJson() {
    return TagMapper.ensureInitialized().encodeJson<Tag>(this as Tag);
  }

  Map<String, dynamic> toMap() {
    return TagMapper.ensureInitialized().encodeMap<Tag>(this as Tag);
  }

  TagCopyWith<Tag, Tag, Tag> get copyWith =>
      _TagCopyWithImpl<Tag, Tag>(this as Tag, $identity, $identity);
  @override
  String toString() {
    return TagMapper.ensureInitialized().stringifyValue(this as Tag);
  }

  @override
  bool operator ==(Object other) {
    return TagMapper.ensureInitialized().equalsValue(this as Tag, other);
  }

  @override
  int get hashCode {
    return TagMapper.ensureInitialized().hashValue(this as Tag);
  }
}

extension TagValueCopy<$R, $Out> on ObjectCopyWith<$R, Tag, $Out> {
  TagCopyWith<$R, Tag, $Out> get $asTag =>
      $base.as((v, t, t2) => _TagCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TagCopyWith<$R, $In extends Tag, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? id,
    String? userId,
    String? name,
    String? remoteId,
    bool? isDirty,
    bool? isDeleted,
    int? version,
    int? lastSynced,
  });
  TagCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TagCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Tag, $Out>
    implements TagCopyWith<$R, Tag, $Out> {
  _TagCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Tag> $mapper = TagMapper.ensureInitialized();
  @override
  $R call({
    String? id,
    String? userId,
    String? name,
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
      if (remoteId != $none) #remoteId: remoteId,
      if (isDirty != null) #isDirty: isDirty,
      if (isDeleted != null) #isDeleted: isDeleted,
      if (version != null) #version: version,
      if (lastSynced != null) #lastSynced: lastSynced,
    }),
  );
  @override
  Tag $make(CopyWithData data) => Tag(
    id: data.get(#id, or: $value.id),
    userId: data.get(#userId, or: $value.userId),
    name: data.get(#name, or: $value.name),
    remoteId: data.get(#remoteId, or: $value.remoteId),
    isDirty: data.get(#isDirty, or: $value.isDirty),
    isDeleted: data.get(#isDeleted, or: $value.isDeleted),
    version: data.get(#version, or: $value.version),
    lastSynced: data.get(#lastSynced, or: $value.lastSynced),
  );

  @override
  TagCopyWith<$R2, Tag, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _TagCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

