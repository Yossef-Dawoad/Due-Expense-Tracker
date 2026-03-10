import 'package:expancetracker/core/common/intrefaces/remote_base.dart';
import 'package:expancetracker/transactions/models/transaction.dart';
import 'package:pocketbase/pocketbase.dart';

/// Remote data source for transactions using PocketBase.
class TransactionRemoteSource implements RemoteDataBase<Transaction> {
  TransactionRemoteSource({PocketBase? pocketBase})
    : _pb = pocketBase ?? PocketBase('http://127.0.0.1:8090');

  final PocketBase _pb;

  @override
  String get collectionName => 'transactions';

  @override
  Future<Transaction> addNewItem(Transaction item) async {
    final record = await _pb
        .collection(collectionName)
        .create(body: _toMap(item));
    return _fromRecord(record, localId: item.id);
  }

  @override
  Future<Transaction> getItemById(String id) async {
    final record = await _pb.collection(collectionName).getOne(id);
    return _fromRecord(record);
  }

  @override
  Future<List<Transaction>> getAllItems() async {
    final records = await _pb.collection(collectionName).getFullList();
    return records.map((r) => _fromRecord(r)).toList();
  }

  @override
  Future<Transaction> updateItem(Transaction item) async {
    final remoteId = item.remoteId ?? item.id;
    final record = await _pb
        .collection(collectionName)
        .update(remoteId, body: _toMap(item));
    return _fromRecord(record, localId: item.id);
  }

  @override
  Future<void> deleteItem(Transaction item) async {
    final remoteId = item.remoteId ?? item.id;
    await _pb.collection(collectionName).delete(remoteId);
  }

  /// Converts a PocketBase record to domain model.
  Transaction _fromRecord(RecordModel record, {String? localId}) {
    final data = record.data;
    return Transaction(
      id: localId ?? record.id,
      userId: data['user'] as String? ?? '',
      accountId: data['account'] as String,
      categoryId: data['category'] as String?,
      amount: (data['amount'] as num).toDouble(),
      type: TransactionType.fromString(data['type'] as String),
      note: data['note'] as String?,
      date: DateTime.parse(data['date'] as String),
      isPending: data['is_pending'] as bool? ?? false,
      externalId: data['external_id'] as String?,
      remoteId: record.id,
      isDirty: false,
      isDeleted: false,
      version: 0,
      lastSynced: DateTime.now().millisecondsSinceEpoch,
    );
  }

  /// Converts domain model to map for PocketBase API.
  Map<String, dynamic> _toMap(Transaction item) {
    return {
      'user': item.userId,
      'account': item.accountId,
      'category': item.categoryId,
      'amount': item.amount,
      'type': item.type.name,
      'note': item.note,
      'date': item.date.toIso8601String(),
      'is_pending': item.isPending,
      'external_id': item.externalId,
    };
  }
}
