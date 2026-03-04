// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'category.dart';

class CategoryModelMapper extends ClassMapperBase<CategoryModel> {
  CategoryModelMapper._();

  static CategoryModelMapper? _instance;
  static CategoryModelMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CategoryModelMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'CategoryModel';

  static String _$id(CategoryModel v) => v.id;
  static const Field<CategoryModel, String> _f$id = Field('id', _$id);
  static String _$userId(CategoryModel v) => v.userId;
  static const Field<CategoryModel, String> _f$userId = Field(
    'userId',
    _$userId,
  );
  static String _$name(CategoryModel v) => v.name;
  static const Field<CategoryModel, String> _f$name = Field('name', _$name);
  static String _$icon(CategoryModel v) => v.icon;
  static const Field<CategoryModel, String> _f$icon = Field('icon', _$icon);
  static String _$color(CategoryModel v) => v.color;
  static const Field<CategoryModel, String> _f$color = Field('color', _$color);
  static String? _$parentId(CategoryModel v) => v.parentId;
  static const Field<CategoryModel, String> _f$parentId = Field(
    'parentId',
    _$parentId,
    opt: true,
  );
  static String? _$remoteId(CategoryModel v) => v.remoteId;
  static const Field<CategoryModel, String> _f$remoteId = Field(
    'remoteId',
    _$remoteId,
    opt: true,
  );
  static bool _$isDirty(CategoryModel v) => v.isDirty;
  static const Field<CategoryModel, bool> _f$isDirty = Field(
    'isDirty',
    _$isDirty,
    opt: true,
    def: false,
  );
  static bool _$isDeleted(CategoryModel v) => v.isDeleted;
  static const Field<CategoryModel, bool> _f$isDeleted = Field(
    'isDeleted',
    _$isDeleted,
    opt: true,
    def: false,
  );
  static int _$version(CategoryModel v) => v.version;
  static const Field<CategoryModel, int> _f$version = Field(
    'version',
    _$version,
    opt: true,
    def: 0,
  );
  static int _$lastSynced(CategoryModel v) => v.lastSynced;
  static const Field<CategoryModel, int> _f$lastSynced = Field(
    'lastSynced',
    _$lastSynced,
    opt: true,
    def: 0,
  );

  @override
  final MappableFields<CategoryModel> fields = const {
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

  static CategoryModel _instantiate(DecodingData data) {
    return CategoryModel(
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

  static CategoryModel fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<CategoryModel>(map);
  }

  static CategoryModel fromJson(String json) {
    return ensureInitialized().decodeJson<CategoryModel>(json);
  }
}

mixin CategoryModelMappable {
  String toJson() {
    return CategoryModelMapper.ensureInitialized().encodeJson<CategoryModel>(
      this as CategoryModel,
    );
  }

  Map<String, dynamic> toMap() {
    return CategoryModelMapper.ensureInitialized().encodeMap<CategoryModel>(
      this as CategoryModel,
    );
  }

  CategoryModelCopyWith<CategoryModel, CategoryModel, CategoryModel>
  get copyWith => _CategoryModelCopyWithImpl<CategoryModel, CategoryModel>(
    this as CategoryModel,
    $identity,
    $identity,
  );
  @override
  String toString() {
    return CategoryModelMapper.ensureInitialized().stringifyValue(
      this as CategoryModel,
    );
  }

  @override
  bool operator ==(Object other) {
    return CategoryModelMapper.ensureInitialized().equalsValue(
      this as CategoryModel,
      other,
    );
  }

  @override
  int get hashCode {
    return CategoryModelMapper.ensureInitialized().hashValue(
      this as CategoryModel,
    );
  }
}

extension CategoryModelValueCopy<$R, $Out>
    on ObjectCopyWith<$R, CategoryModel, $Out> {
  CategoryModelCopyWith<$R, CategoryModel, $Out> get $asCategoryModel =>
      $base.as((v, t, t2) => _CategoryModelCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CategoryModelCopyWith<$R, $In extends CategoryModel, $Out>
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
  CategoryModelCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CategoryModelCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, CategoryModel, $Out>
    implements CategoryModelCopyWith<$R, CategoryModel, $Out> {
  _CategoryModelCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<CategoryModel> $mapper =
      CategoryModelMapper.ensureInitialized();
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
  CategoryModel $make(CopyWithData data) => CategoryModel(
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
  CategoryModelCopyWith<$R2, CategoryModel, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _CategoryModelCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

