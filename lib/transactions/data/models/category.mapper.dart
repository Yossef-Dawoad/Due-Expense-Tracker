// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'category.dart';

class CategoryMapper extends ClassMapperBase<Category> {
  CategoryMapper._();

  static CategoryMapper? _instance;
  static CategoryMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CategoryMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Category';

  static String _$id(Category v) => v.id;
  static const Field<Category, String> _f$id = Field('id', _$id);
  static String _$userId(Category v) => v.userId;
  static const Field<Category, String> _f$userId = Field('userId', _$userId);
  static String _$name(Category v) => v.name;
  static const Field<Category, String> _f$name = Field('name', _$name);
  static String _$icon(Category v) => v.icon;
  static const Field<Category, String> _f$icon = Field('icon', _$icon);
  static String _$color(Category v) => v.color;
  static const Field<Category, String> _f$color = Field('color', _$color);
  static String? _$parentId(Category v) => v.parentId;
  static const Field<Category, String> _f$parentId = Field(
    'parentId',
    _$parentId,
    opt: true,
  );
  static String? _$remoteId(Category v) => v.remoteId;
  static const Field<Category, String> _f$remoteId = Field(
    'remoteId',
    _$remoteId,
    opt: true,
  );
  static bool _$isDirty(Category v) => v.isDirty;
  static const Field<Category, bool> _f$isDirty = Field(
    'isDirty',
    _$isDirty,
    opt: true,
    def: false,
  );
  static bool _$isDeleted(Category v) => v.isDeleted;
  static const Field<Category, bool> _f$isDeleted = Field(
    'isDeleted',
    _$isDeleted,
    opt: true,
    def: false,
  );
  static int _$version(Category v) => v.version;
  static const Field<Category, int> _f$version = Field(
    'version',
    _$version,
    opt: true,
    def: 0,
  );
  static int _$lastSynced(Category v) => v.lastSynced;
  static const Field<Category, int> _f$lastSynced = Field(
    'lastSynced',
    _$lastSynced,
    opt: true,
    def: 0,
  );

  @override
  final MappableFields<Category> fields = const {
    #id: _f$id,
    #userId: _f$userId,
    #name: _f$name,
    #icon: _f$icon,
    #color: _f$color,
    #parentId: _f$parentId,
    #remoteId: _f$remoteId,
    #isDirty: _f$isDirty,
    #isDeleted: _f$isDeleted,
    #version: _f$version,
    #lastSynced: _f$lastSynced,
  };

  static Category _instantiate(DecodingData data) {
    return Category(
      id: data.dec(_f$id),
      userId: data.dec(_f$userId),
      name: data.dec(_f$name),
      icon: data.dec(_f$icon),
      color: data.dec(_f$color),
      parentId: data.dec(_f$parentId),
      remoteId: data.dec(_f$remoteId),
      isDirty: data.dec(_f$isDirty),
      isDeleted: data.dec(_f$isDeleted),
      version: data.dec(_f$version),
      lastSynced: data.dec(_f$lastSynced),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Category fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Category>(map);
  }

  static Category fromJson(String json) {
    return ensureInitialized().decodeJson<Category>(json);
  }
}

mixin CategoryMappable {
  String toJson() {
    return CategoryMapper.ensureInitialized().encodeJson<Category>(
      this as Category,
    );
  }

  Map<String, dynamic> toMap() {
    return CategoryMapper.ensureInitialized().encodeMap<Category>(
      this as Category,
    );
  }

  CategoryCopyWith<Category, Category, Category> get copyWith =>
      _CategoryCopyWithImpl<Category, Category>(
        this as Category,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return CategoryMapper.ensureInitialized().stringifyValue(this as Category);
  }

  @override
  bool operator ==(Object other) {
    return CategoryMapper.ensureInitialized().equalsValue(
      this as Category,
      other,
    );
  }

  @override
  int get hashCode {
    return CategoryMapper.ensureInitialized().hashValue(this as Category);
  }
}

extension CategoryValueCopy<$R, $Out> on ObjectCopyWith<$R, Category, $Out> {
  CategoryCopyWith<$R, Category, $Out> get $asCategory =>
      $base.as((v, t, t2) => _CategoryCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CategoryCopyWith<$R, $In extends Category, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({
    String? id,
    String? userId,
    String? name,
    String? icon,
    String? color,
    String? parentId,
    String? remoteId,
    bool? isDirty,
    bool? isDeleted,
    int? version,
    int? lastSynced,
  });
  CategoryCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CategoryCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Category, $Out>
    implements CategoryCopyWith<$R, Category, $Out> {
  _CategoryCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Category> $mapper =
      CategoryMapper.ensureInitialized();
  @override
  $R call({
    String? id,
    String? userId,
    String? name,
    String? icon,
    String? color,
    Object? parentId = $none,
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
      if (icon != null) #icon: icon,
      if (color != null) #color: color,
      if (parentId != $none) #parentId: parentId,
      if (remoteId != $none) #remoteId: remoteId,
      if (isDirty != null) #isDirty: isDirty,
      if (isDeleted != null) #isDeleted: isDeleted,
      if (version != null) #version: version,
      if (lastSynced != null) #lastSynced: lastSynced,
    }),
  );
  @override
  Category $make(CopyWithData data) => Category(
    id: data.get(#id, or: $value.id),
    userId: data.get(#userId, or: $value.userId),
    name: data.get(#name, or: $value.name),
    icon: data.get(#icon, or: $value.icon),
    color: data.get(#color, or: $value.color),
    parentId: data.get(#parentId, or: $value.parentId),
    remoteId: data.get(#remoteId, or: $value.remoteId),
    isDirty: data.get(#isDirty, or: $value.isDirty),
    isDeleted: data.get(#isDeleted, or: $value.isDeleted),
    version: data.get(#version, or: $value.version),
    lastSynced: data.get(#lastSynced, or: $value.lastSynced),
  );

  @override
  CategoryCopyWith<$R2, Category, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _CategoryCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

