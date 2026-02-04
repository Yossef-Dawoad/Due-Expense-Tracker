import 'package:expancetracker/core/common/domain/intrefaces/remote_base.dart';

import '../models/user_transaction.dart';

typedef UserTransactionServiceType = RemoteDataBase<UserTransaction>;

class TransctionRemoteDataSource implements UserTransactionServiceType {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<UserTransaction> addNewItem(UserTransaction item) async {
    await _firestore.collection(collectionName).doc(item.id).set(item.toMap());
    return item;
  }

  @override
  Future<void> deleteItem(UserTransaction item) {
    return _firestore.collection(collectionName).doc(item.id).delete();
  }

  @override
  Future<List<UserTransaction>> getAllItems() async {
    final dataSnapShot = await _firestore.collection(collectionName).get();
    final result = dataSnapShot.docs
        .map((doc) => UserTransaction.fromMap(doc.data()))
        .toList();
    return result;
  }

  @override
  Future<UserTransaction> getItemById(String id) async {
    final dataSnapShot = await _firestore
        .collection(collectionName)
        .doc(id)
        .get();
    return UserTransaction.fromMap(dataSnapShot.data()!);
  }

  @override
  String get collectionName => 'transactions';
}
