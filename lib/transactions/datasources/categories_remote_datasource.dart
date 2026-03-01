import 'package:expancetracker/core/common/intrefaces/remote_base.dart';
import '../models/category.dart';
import 'package:pocketbase/pocketbase.dart';

/// Remote data source for categories using PocketBase.
class CategoriesRemoteDataSource implements RemoteDataBase<Category> {
  CategoriesRemoteDataSource({PocketBase? pocketBase})
    : _pb = pocketBase ?? PocketBase('http://127.0.0.1:8090');

  final PocketBase _pb;

  @override
  String get collectionName => 'categories';

  @override
  Future<Category> addNewItem(Category item) async {
    final record = await _pb
        .collection(collectionName)
        .create(body: _toMap(item));
    return _fromRecord(record, localId: item.id);
  }

  @override
  Future<Category> getItemById(String id) async {
    final record = await _pb.collection(collectionName).getOne(id);
    return _fromRecord(record);
  }

  @override
  Future<List<Category>> getAllItems() async {
    final records = await _pb.collection(collectionName).getFullList();
    return records.map((r) => _fromRecord(r)).toList();
  }

  @override
  Future<Category> updateItem(Category item) async {
    final remoteId = item.remoteId ?? item.id;
    final record = await _pb
        .collection(collectionName)
        .update(remoteId, body: _toMap(item));
    return _fromRecord(record, localId: item.id);
  }

  @override
  Future<void> deleteItem(Category item) async {
    final remoteId = item.remoteId ?? item.id;
    await _pb.collection(collectionName).delete(remoteId);
  }

  /// Converts a PocketBase record to domain model.
  Category _fromRecord(RecordModel record, {String? localId}) {
    final data = record.data;
    return Category(
      id: localId ?? record.id,
      userId: data['user'] as String? ?? '',
      name: data['name'] as String,
      icon: data['icon'] as String,
      color: data['color'] as String,
      parentId: data['parent'] as String?,
      remoteId: record.id,
      isDirty: false,
      isDeleted: false,
      version: 0,
      lastSynced: DateTime.now().millisecondsSinceEpoch,
    );
  }

  /// Converts domain model to map for PocketBase API.
  Map<String, dynamic> _toMap(Category item) {
    return {
      'user': item.userId,
      'name': item.name,
      'icon': item.icon,
      'color': item.color,
      'parent': item.parentId,
    };
  }
}
