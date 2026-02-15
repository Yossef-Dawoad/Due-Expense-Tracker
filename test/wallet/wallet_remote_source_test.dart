import 'package:expancetracker/features/wallet/data/datasources/wallet_remote_source.dart';
import 'package:expancetracker/features/wallet/data/models/account.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pocketbase/pocketbase.dart';

class MockPocketBase extends Mock implements PocketBase {}

class MockRecordService extends Mock implements RecordService {}

class MockRecordModel extends Mock implements RecordModel {}

void main() {
  late MockPocketBase mockPocketBase;
  late MockRecordService mockRecordService;
  late WalletRemoteSource remoteSource;

  setUp(() {
    mockPocketBase = MockPocketBase();
    mockRecordService = MockRecordService();
    when(
      () => mockPocketBase.collection('accounts'),
    ).thenReturn(mockRecordService);
    remoteSource = WalletRemoteSource(pocketBase: mockPocketBase);
  });

  Account createTestAccount({
    String id = 'test-id-1',
    String name = 'Test Account',
    double balance = 1000.0,
  }) {
    return Account(
      id: id,
      userId: 'test-user',
      name: name,
      type: 'Checking',
      balance: balance,
      isDirty: false,
    );
  }

  RecordModel createMockRecord({
    String id = 'test-id-1',
    String name = 'Test Account',
    double balance = 1000.0,
  }) {
    final mockRecord = MockRecordModel();
    when(() => mockRecord.id).thenReturn(id);
    when(() => mockRecord.data).thenReturn({
      'user': 'test-user',
      'name': name,
      'type': 'Checking',
      'balance': balance,
      'currency': 'USD',
      'is_archived': false,
    });
    when(
      () => mockRecord.get<String>('created'),
    ).thenReturn('2026-01-01 00:00:00.000Z');
    when(
      () => mockRecord.get<String>('updated'),
    ).thenReturn('2026-01-01 00:00:00.000Z');
    return mockRecord;
  }

  group('WalletRemoteSource', () {
    test('collectionName should be accounts', () {
      expect(remoteSource.collectionName, equals('accounts'));
    });

    group('getAllItems', () {
      test('should return list of accounts from PocketBase', () async {
        final mockRecords = [
          createMockRecord(id: 'id-1', name: 'Account 1'),
          createMockRecord(id: 'id-2', name: 'Account 2'),
        ];
        when(
          () => mockRecordService.getFullList(),
        ).thenAnswer((_) async => mockRecords);

        final accounts = await remoteSource.getAllItems();

        expect(accounts.length, equals(2));
        expect(accounts[0].id, equals('id-1'));
        expect(accounts[1].id, equals('id-2'));
        verify(() => mockRecordService.getFullList()).called(1);
      });

      test('should return empty list when no records exist', () async {
        when(() => mockRecordService.getFullList()).thenAnswer((_) async => []);

        final accounts = await remoteSource.getAllItems();

        expect(accounts, isEmpty);
      });
    });

    group('getItemById', () {
      test('should return account for given id', () async {
        final mockRecord = createMockRecord(
          id: 'specific-id',
          name: 'Specific Account',
        );
        when(
          () => mockRecordService.getOne('specific-id'),
        ).thenAnswer((_) async => mockRecord);

        final account = await remoteSource.getItemById('specific-id');

        expect(account.id, equals('specific-id'));
        expect(account.name, equals('Specific Account'));
        verify(() => mockRecordService.getOne('specific-id')).called(1);
      });
    });

    group('addNewItem', () {
      test('should create record in PocketBase and return account', () async {
        final account = createTestAccount();
        final mockRecord = createMockRecord();
        when(
          () => mockRecordService.create(body: any(named: 'body')),
        ).thenAnswer((_) async => mockRecord);

        final result = await remoteSource.addNewItem(account);

        expect(result.id, equals(account.id));
        verify(
          () => mockRecordService.create(body: any(named: 'body')),
        ).called(1);
      });
    });

    group('deleteItem', () {
      test('should delete record from PocketBase', () async {
        final account = createTestAccount(id: 'delete-id');
        when(
          () => mockRecordService.delete('delete-id'),
        ).thenAnswer((_) async {});

        await remoteSource.deleteItem(account);

        verify(() => mockRecordService.delete('delete-id')).called(1);
      });
    });

    group('updateItem', () {
      test('should update record in PocketBase', () async {
        final account = createTestAccount(id: 'update-id');
        final mockRecord = createMockRecord(id: 'update-id');
        when(
          () => mockRecordService.update('update-id', body: any(named: 'body')),
        ).thenAnswer((_) async => mockRecord);

        final result = await remoteSource.updateItem(account);

        expect(result.id, equals('update-id'));
        verify(
          () => mockRecordService.update('update-id', body: any(named: 'body')),
        ).called(1);
      });
    });
  });
}
