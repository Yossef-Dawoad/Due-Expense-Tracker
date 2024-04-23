import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expancetracker/core/common/domain/models/transaction_category.dart';
import 'package:expancetracker/features/home/domain/models/money_transaction.dart';

import 'intrefaces/firebase_base.dart';

class FirebaseTransctionDB implements BaseFirebaseTransctionDB {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _transactionCollection = 'transactions';
  final String _categoryCollection = 'categories';

  @override
  Future<void> setNewCategoryTransction(TransactionCategory transaction) async {
    await _firestore
        .collection(_categoryCollection)
        .doc(transaction.id)
        .set(transaction.toJson());
  }

  @override
  Future<void> setNewTransction(MoneyTransaction transaction) async {
    await _firestore
        .collection(_transactionCollection)
        .doc(transaction.id)
        .set(transaction.toJson());
  }

  @override
  Future<List<TransactionCategory>> getAllCategoryTransctions() async {
    final dataSnapShot = await _firestore.collection(_categoryCollection).get();
    final result = dataSnapShot.docs
        .map((doc) => TransactionCategory.fromJson(doc.data()))
        .toList();
    return result;
  }

  @override
  Future<List<MoneyTransaction>> getAllTransctions() async {
    final dataSnapShot =
        await _firestore.collection(_transactionCollection).get();
    final result = dataSnapShot.docs
        .map((doc) => MoneyTransaction.fromJson(doc.data()))
        .toList();
    return result;
  }

  @override
  Future<TransactionCategory> getCategoryTransction(String id) async {
    final dataSnapShot =
        await _firestore.collection(_categoryCollection).doc(id).get();
    return TransactionCategory.fromJson(dataSnapShot.data()!);
  }

  @override
  Future<MoneyTransaction> getTransction(String id) async {
    final dataSnapShot =
        await _firestore.collection(_transactionCollection).doc(id).get();
    return MoneyTransaction.fromJson(dataSnapShot.data()!);
  }

  @override
  Future<void> deleteCategoryTransaction(TransactionCategory transaction) {
    return _firestore
        .collection(_categoryCollection)
        .doc(transaction.id)
        .delete();
  }

  @override
  Future<void> deleteTransaction(MoneyTransaction transaction) {
    return _firestore
        .collection(_transactionCollection)
        .doc(transaction.id)
        .delete();
  }
}
