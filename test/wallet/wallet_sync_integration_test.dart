import 'package:drift/native.dart';
import 'package:expancetracker/core/database/app_database.dart';
import 'package:expancetracker/features/wallet/data/datasources/wallet_local_source.dart';
import 'package:expancetracker/features/wallet/data/datasources/wallet_remote_source.dart';
import 'package:expancetracker/features/wallet/data/repositories/wallet_repository_impl.dart';
import 'package:expancetracker/features/wallet/data/models/account.dart';
import 'package:expancetracker/features/wallet/data/repositories/wallet_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pocketbase/pocketbase.dart';

class MockPocketBase extends Mock implements PocketBase {}

class MockRecordService extends Mock implements RecordService {}

class MockRecordModel extends Mock implements RecordModel {}

class FakeAccount extends Fake implements Account {}

/// Integration test for the offline-first sync flow.
///
/// These tests verify the complete data flow from local persistence
/// through sync operations with a mocked remote backend.
void main() {
  late AppDatabase database;
  late WalletLocalSource localSource;
  late MockPocketBase mockPocketBase;
  late MockRecordService mockRecordService;
  late WalletRemoteSource remoteSource;
  late WalletRepository repository;

  setUpAll(() {
    registerFallbackValue(FakeAccount());
  });

  setUp(() {
    // Create in-memory database for testing
    database = AppDatabase.forTesting(NativeDatabase.memory());
    localSource = WalletLocalSource(database: database);

    // Create mocked remote source
    mockPocketBase = MockPocketBase();
    mockRecordService = MockRecordService();
    when(
      () => mockPocketBase.collection('accounts'),
    ).thenReturn(mockRecordService);
    remoteSource = WalletRemoteSource(pocketBase: mockPocketBase);

    // Create repository with real local and mocked remote
    repository = WalletRepositoryImpl(
      localSource: localSource,
      remoteSource: remoteSource,
    );
  });

  tearDown(() async {
    await database.close();
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

  group('Offline-First Sync Integration', () {
    test('Complete offline-to-online sync flow', () async {
      // Step 1: Add account while "offline" (no remote calls)
      final newAccount = createTestAccount(id: 'offline-account');

      // Mock remote failures to simulate offline
      when(
        () => mockRecordService.update(any(), body: any(named: 'body')),
      ).thenThrow(Exception('Network error'));
      when(
        () => mockRecordService.create(body: any(named: 'body')),
      ).thenThrow(Exception('Network error'));
      when(
        () => mockRecordService.getFullList(),
      ).thenThrow(Exception('Network error'));

      // Add account - should succeed locally despite remote failure
      final added = await repository.add(newAccount);
      expect(added, isNotNull);

      // Verify account is persisted locally
      final localAccounts = await localSource.getAll();
      expect(localAccounts.length, equals(1));
      expect(localAccounts.first.id, equals('offline-account'));

      // Step 2: Simulate going "online" - mock successful remote responses
      final mockRecord = createMockRecord(id: 'offline-account');
      when(
        () => mockRecordService.update(any(), body: any(named: 'body')),
      ).thenAnswer((_) async => mockRecord);
      when(
        () => mockRecordService.create(body: any(named: 'body')),
      ).thenAnswer((_) async => mockRecord);
      when(
        () => mockRecordService.getFullList(),
      ).thenAnswer((_) async => [mockRecord]);

      // Step 3: Trigger sync
      await repository.syncWithRemote();

      // Step 4: Verify dirty records were pushed
      // The record should now be marked as synced (not dirty)
      final syncedAccounts = await localSource.getAll();
      expect(syncedAccounts.first.isDirty, isFalse);
    });

    test('Reactive stream updates when data changes', () async {
      final emissions = <List<Account>>[];
      final subscription = repository.watchAll().listen(emissions.add);

      // Allow initial emission
      await Future<void>.delayed(const Duration(milliseconds: 50));
      final initialCount = emissions.length;

      // Mock remote to avoid network calls
      final mockRecord = createMockRecord();
      when(
        () => mockRecordService.update(any(), body: any(named: 'body')),
      ).thenAnswer((_) async => mockRecord);
      when(
        () => mockRecordService.create(body: any(named: 'body')),
      ).thenAnswer((_) async => mockRecord);
      when(() => mockRecordService.getFullList()).thenAnswer((_) async => []);

      // Add account through repository
      await repository.add(createTestAccount(id: 'stream-test'));
      await Future<void>.delayed(const Duration(milliseconds: 50));

      await subscription.cancel();

      // Should have received emissions as data changed
      expect(emissions.length, greaterThan(initialCount));
      expect(emissions.last.any((a) => a.id == 'stream-test'), isTrue);
    });
  });
}
