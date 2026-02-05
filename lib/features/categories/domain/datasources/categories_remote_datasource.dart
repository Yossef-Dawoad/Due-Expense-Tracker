import 'package:expancetracker/core/common/domain/intrefaces/remote_base.dart';
import 'package:pocketbase/pocketbase.dart';

import '../models/transaction_category.dart';

typedef CategoriesRemoteService = RemoteDataBase<TransactionCategory>;

class CategoriesRemoteDataSource implements CategoriesRemoteService {
  final _store = PocketBase('http://127.0.0.1:8090');

  @override
  Future<TransactionCategory> addNewItem(TransactionCategory item) async {
    await _store.collection(collectionName).create(body: item.toMap());
    return item;
  }

  @override
  Future<void> deleteItem(TransactionCategory item) async {
    return await _store.collection(collectionName).delete(item.id);
  }

  @override
  Future<List<TransactionCategory>> getAllItems() async {
    final dataSnapShot = await _store.collection(collectionName).getFullList();
    final result = dataSnapShot
        .map((doc) => TransactionCategory.fromMap(doc.data))
        .toList();
    return result;
  }

  @override
  Future<TransactionCategory> getItemById(String id) async {
    final dataSnapShot = await _store.collection(collectionName).getOne(id);
    return TransactionCategory.fromMap(dataSnapShot.data);
  }

  @override
  String get collectionName => 'categories';
}
