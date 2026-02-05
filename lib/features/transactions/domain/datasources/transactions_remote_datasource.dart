import 'package:expancetracker/core/common/domain/intrefaces/remote_base.dart';
import 'package:pocketbase/pocketbase.dart';

import '../models/user_transaction.dart';

typedef UserTransactionServiceType = RemoteDataBase<UserTransaction>;

class TransctionRemoteDataSource implements UserTransactionServiceType {
  final _store = PocketBase('http://127.0.0.1:8090');

  @override
  Future<UserTransaction> addNewItem(UserTransaction item) async {
    await _store.collection(collectionName).create(body: item.toMap());
    return item;
  }

  @override
  Future<void> deleteItem(UserTransaction item) {
    return _store.collection(collectionName).delete(item.id);
  }

  @override
  Future<List<UserTransaction>> getAllItems() async {
    final dataSnapShot = await _store.collection(collectionName).getFullList();
    final result = dataSnapShot
        .map((doc) => UserTransaction.fromMap(doc.data))
        .toList();
    return result;
  }

  @override
  Future<UserTransaction> getItemById(String id) async {
    final dataSnapShot = await _store.collection(collectionName).getOne(id);
    return UserTransaction.fromMap(dataSnapShot.data);
  }

  @override
  String get collectionName => 'transactions';
}
