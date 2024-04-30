import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:expancetracker/core/common/domain/intrefaces/firebase_base.dart';

import '../models/transaction_category.dart';

typedef CategoriesServiceType = BaseFireBaseDB<TransactionCategory>;

class FirebaseCategoriesServiceImpl implements CategoriesServiceType {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Future<TransactionCategory> addNewItem(TransactionCategory item) async {
    await _firestore.collection(collectionName).doc(item.id).set(item.toJson());
    return item;
  }

  @override
  Future<void> deleteItem(TransactionCategory item) async {
    return await _firestore.collection(collectionName).doc(item.id).delete();
  }

  @override
  Future<List<TransactionCategory>> getAllItems() async {
    final dataSnapShot = await _firestore.collection(collectionName).get();
    final result = dataSnapShot.docs
        .map((doc) => TransactionCategory.fromJson(doc.data()))
        .toList();
    return result;
  }

  @override
  Future<TransactionCategory> getItemById(String id) async {
    final dataSnapShot =
        await _firestore.collection(collectionName).doc(id).get();
    return TransactionCategory.fromJson(dataSnapShot.data()!);
  }

  @override
  String get collectionName => 'categories';
}
