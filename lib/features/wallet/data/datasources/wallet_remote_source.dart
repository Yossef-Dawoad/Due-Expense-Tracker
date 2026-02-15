import 'package:pocketbase/pocketbase.dart';

import '../../../../core/common/domain/intrefaces/remote_base.dart';
import 'package:expancetracker/features/wallet/data/models/account.dart';

/// Remote data source for accounts using PocketBase.
class WalletRemoteSource implements RemoteDataBase<Account> {
  WalletRemoteSource({PocketBase? pocketBase})
    : _pb = pocketBase ?? PocketBase('http://127.0.0.1:8090');

  final PocketBase _pb;

  @override
  String get collectionName => 'accounts';

  @override
  Future<Account> addNewItem(Account item) async {
    final record = await _pb
        .collection(collectionName)
        .create(body: _toMap(item));
    return _fromRecord(record, localId: item.id);
  }

  @override
  Future<Account> getItemById(String id) async {
    final record = await _pb.collection(collectionName).getOne(id);
    return _fromRecord(record);
  }

  @override
  Future<List<Account>> getAllItems() async {
    final records = await _pb.collection(collectionName).getFullList();
    return records.map((r) => _fromRecord(r)).toList();
  }

  @override
  Future<Account> updateItem(Account item) async {
    final remoteId = item.remoteId ?? item.id;
    final record = await _pb
        .collection(collectionName)
        .update(remoteId, body: _toMap(item));
    return _fromRecord(record, localId: item.id);
  }

  @override
  Future<void> deleteItem(Account item) async {
    final remoteId = item.remoteId ?? item.id;
    await _pb.collection(collectionName).delete(remoteId);
  }

  /// Converts a PocketBase record to domain model.
  /// [localId] preserves the local UUID when we already know it.
  Account _fromRecord(RecordModel record, {String? localId}) {
    final data = record.data;
    return Account(
      id: localId ?? record.id,
      userId: data['user'] as String? ?? '',
      name: data['name'] as String,
      type: data['type'] as String,
      currency: data['currency'] as String? ?? 'USD',
      balance: (data['balance'] as num?)?.toDouble() ?? 0.0,
      isArchived: data['is_archived'] as bool? ?? false,
      remoteId: record.id,
      isDirty: false,
      isDeleted: false,
      version: 0,
      lastSynced: DateTime.now().millisecondsSinceEpoch,
    );
  }

  /// Converts domain model to map for PocketBase API.
  Map<String, dynamic> _toMap(Account account) {
    return {
      'user': account.userId,
      'name': account.name,
      'type': account.type,
      'currency': account.currency,
      'balance': account.balance,
      'is_archived': account.isArchived,
    };
  }
}
