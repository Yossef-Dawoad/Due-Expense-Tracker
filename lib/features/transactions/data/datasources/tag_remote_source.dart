import 'package:expancetracker/core/common/domain/intrefaces/remote_base.dart';
import 'package:expancetracker/features/transactions/data/models/tag.dart';

/// Remote data source for tags (PocketBase).
class TagRemoteSource implements RemoteDataBase<Tag> {
  @override
  String get collectionName => 'tags';

  @override
  Future<Tag> addNewItem(Tag item) async {
    // TODO: Implement PocketBase create
    throw UnimplementedError();
  }

  @override
  Future<void> deleteItem(Tag item) async {
    // TODO: Implement PocketBase delete
    throw UnimplementedError();
  }

  @override
  Future<List<Tag>> getAllItems() async {
    // TODO: Implement PocketBase list
    return [];
  }

  @override
  Future<Tag> getItemById(String id) async {
    // TODO: Implement PocketBase get
    throw UnimplementedError();
  }

  @override
  Future<Tag> updateItem(Tag item) async {
    // TODO: Implement PocketBase update
    throw UnimplementedError();
  }
}
