import 'package:expancetracker/core/database/app_database.dart';
import 'package:expancetracker/core/abstractions/database_abstraction.dart';
import 'package:expancetracker/wallet/data/datasources/wallet_local_source.dart';
import 'package:expancetracker/wallet/data/models/account.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:drift/native.dart';

void main() {
  late AppDatabase database;
  late WalletLocalSource localSource;

  setUp(() {
    // Use in-memory database for testing
    database = AppDatabase.forTesting(NativeDatabase.memory());
    localSource = WalletLocalSource(database: DriftDatabaseProvider(database));
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

  group('WalletLocalSource', () {
    group('insert', () {
      test('should insert an account and return it', () async {
        final account = createTestAccount();

        final result = await localSource.insert(account);

        expect(result.id, equals(account.id));
        expect(result.name, equals(account.name));
        expect(result.balance, equals(account.balance));
      });

      test('should persist account to database', () async {
        final account = createTestAccount();

        await localSource.insert(account);
        final retrieved = await localSource.getById(account.id);

        expect(retrieved, isNotNull);
        expect(retrieved!.id, equals(account.id));
      });
    });

    group('getAll', () {
      test('should return empty list when no accounts exist', () async {
        final accounts = await localSource.getAll();

        expect(accounts, isEmpty);
      });

      test('should return all inserted accounts', () async {
        await localSource.insert(
          createTestAccount(id: 'id-1', name: 'Account 1'),
        );
        await localSource.insert(
          createTestAccount(id: 'id-2', name: 'Account 2'),
        );
        await localSource.insert(
          createTestAccount(id: 'id-3', name: 'Account 3'),
        );

        final accounts = await localSource.getAll();

        expect(accounts.length, equals(3));
      });
    });

    group('getById', () {
      test('should return null for non-existent id', () async {
        final result = await localSource.getById('non-existent');

        expect(result, isNull);
      });

      test('should return account for existing id', () async {
        final account = createTestAccount(id: 'existing-id');
        await localSource.insert(account);

        final result = await localSource.getById('existing-id');

        expect(result, isNotNull);
        expect(result!.id, equals('existing-id'));
      });
    });

    group('getDirtyRecords', () {
      test('should return only dirty records', () async {
        await localSource.insert(
          createTestAccount(id: 'clean-1').copyWith(isDirty: false),
        );
        await localSource.insert(
          createTestAccount(id: 'dirty-1').copyWith(isDirty: true),
        );
        await localSource.insert(
          createTestAccount(id: 'dirty-2').copyWith(isDirty: true),
        );

        final dirtyRecords = await localSource.getDirtyRecords();

        expect(dirtyRecords.length, equals(2));
        expect(dirtyRecords.every((a) => a.isDirty), isTrue);
      });

      test('should return empty list when no dirty records exist', () async {
        await localSource.insert(createTestAccount().copyWith(isDirty: false));

        final dirtyRecords = await localSource.getDirtyRecords();

        expect(dirtyRecords, isEmpty);
      });
    });

    group('update', () {
      test('should update existing account', () async {
        final account = createTestAccount(balance: 1000.0);
        await localSource.insert(account);

        final updated = account.copyWith(balance: 2000.0);
        await localSource.update(updated);

        final retrieved = await localSource.getById(account.id);
        expect(retrieved!.balance, equals(2000.0));
      });
    });

    group('delete', () {
      test('should remove account from database', () async {
        final account = createTestAccount();
        await localSource.insert(account);

        await localSource.delete(account.id);

        final result = await localSource.getById(account.id);
        expect(result, isNull);
      });
    });

    group('insertOrReplace', () {
      test('should insert new account', () async {
        final account = createTestAccount(id: 'new-id');

        await localSource.insertOrReplace(account);

        final result = await localSource.getById('new-id');
        expect(result, isNotNull);
      });

      test('should replace existing account', () async {
        final original = createTestAccount(id: 'replace-id', balance: 100.0);
        await localSource.insert(original);

        final replacement = original.copyWith(balance: 500.0);
        await localSource.insertOrReplace(replacement);

        final result = await localSource.getById('replace-id');
        expect(result!.balance, equals(500.0));
      });
    });

    group('watchAll', () {
      test('should emit updates when accounts change', () async {
        final emissions = <List<Account>>[];
        final subscription = localSource.watchAll().listen(emissions.add);

        // Allow initial emission
        await Future<void>.delayed(const Duration(milliseconds: 50));

        await localSource.insert(createTestAccount(id: 'watch-1'));
        await Future<void>.delayed(const Duration(milliseconds: 50));

        await localSource.insert(createTestAccount(id: 'watch-2'));
        await Future<void>.delayed(const Duration(milliseconds: 50));

        await subscription.cancel();

        // Should have received multiple emissions as data changed
        expect(emissions.length, greaterThanOrEqualTo(2));
      });
    });
  });
}
