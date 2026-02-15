import 'package:expancetracker/features/wallet/data/datasources/wallet_local_source.dart';
import 'package:expancetracker/features/wallet/data/datasources/wallet_remote_source.dart';
import 'package:expancetracker/features/wallet/data/repositories/wallet_repository_impl.dart';
import 'package:expancetracker/features/wallet/data/models/account.dart';
import 'package:expancetracker/features/wallet/data/repositories/wallet_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockWalletLocalSource extends Mock implements WalletLocalSource {}

class MockWalletRemoteSource extends Mock implements WalletRemoteSource {}

class FakeAccount extends Fake implements Account {}

void main() {
  late MockWalletLocalSource mockLocalSource;
  late MockWalletRemoteSource mockRemoteSource;
  late WalletRepository repository;

  setUpAll(() {
    registerFallbackValue(FakeAccount());
  });

  setUp(() {
    mockLocalSource = MockWalletLocalSource();
    mockRemoteSource = MockWalletRemoteSource();
    repository = WalletRepositoryImpl(
      localSource: mockLocalSource,
      remoteSource: mockRemoteSource,
    );
  });

  Account createTestAccount({
    String id = 'test-id-1',
    String name = 'Test Account',
    double balance = 1000.0,
    bool isDirty = false,
    int version = 0,
  }) {
    return Account(
      id: id,
      userId: 'test-user',
      name: name,
      type: 'Checking',
      balance: balance,
      isDirty: isDirty,
      version: version,
    );
  }

  group('WalletRepository', () {
    group('getAll', () {
      test('should return accounts from local source', () async {
        final accounts = [
          createTestAccount(id: 'id-1'),
          createTestAccount(id: 'id-2'),
        ];
        when(() => mockLocalSource.getAll()).thenAnswer((_) async => accounts);

        final result = await repository.getAll();

        expect(result.length, equals(2));
        verify(() => mockLocalSource.getAll()).called(1);
        verifyNever(() => mockRemoteSource.getAllItems());
      });

      test('should sync with remote when forceRefresh is true', () async {
        when(() => mockLocalSource.getAll()).thenAnswer((_) async => []);
        when(
          () => mockLocalSource.getDirtyRecords(),
        ).thenAnswer((_) async => []);
        when(
          () => mockLocalSource.getDeletedRecords(),
        ).thenAnswer((_) async => []);
        when(() => mockRemoteSource.getAllItems()).thenAnswer((_) async => []);

        await repository.getAll(forceRefresh: true);

        verify(() => mockRemoteSource.getAllItems()).called(1);
      });
    });

    group('getById', () {
      test('should return account from local source', () async {
        final account = createTestAccount(id: 'specific-id');
        when(
          () => mockLocalSource.getById('specific-id'),
        ).thenAnswer((_) async => account);

        final result = await repository.getById('specific-id');

        expect(result, isNotNull);
        expect(result!.id, equals('specific-id'));
      });

      test('should return null for non-existent id', () async {
        when(
          () => mockLocalSource.getById('non-existent'),
        ).thenAnswer((_) async => null);

        final result = await repository.getById('non-existent');

        expect(result, isNull);
      });
    });

    group('watchAll', () {
      test('should return stream from local source', () {
        final accountsStream = Stream.value(<Account>[createTestAccount()]);
        when(
          () => mockLocalSource.watchAll(),
        ).thenAnswer((_) => accountsStream);

        final result = repository.watchAll();

        expect(result, isA<Stream<List<Account>>>());
        verify(() => mockLocalSource.watchAll()).called(1);
      });
    });

    group('add', () {
      test('should insert account with isDirty=true to local source', () async {
        final account = createTestAccount();
        when(() => mockLocalSource.insert(any())).thenAnswer((
          invocation,
        ) async {
          return invocation.positionalArguments[0] as Account;
        });
        when(
          () => mockLocalSource.getDirtyRecords(),
        ).thenAnswer((_) async => []);
        when(
          () => mockLocalSource.getDeletedRecords(),
        ).thenAnswer((_) async => []);
        when(
          () => mockRemoteSource.updateItem(any()),
        ).thenAnswer((_) async => account);
        when(
          () => mockRemoteSource.addNewItem(any()),
        ).thenAnswer((_) async => account);
        when(() => mockLocalSource.update(any())).thenAnswer((_) async {});
        when(() => mockRemoteSource.getAllItems()).thenAnswer((_) async => []);

        final result = await repository.add(account);

        expect(result, isNotNull);
        verify(() => mockLocalSource.insert(any())).called(1);
      });
    });

    group('update', () {
      test('should update account with isDirty=true in local source', () async {
        final account = createTestAccount();
        when(() => mockLocalSource.update(any())).thenAnswer((_) async {});
        when(
          () => mockLocalSource.getDirtyRecords(),
        ).thenAnswer((_) async => []);
        when(
          () => mockLocalSource.getDeletedRecords(),
        ).thenAnswer((_) async => []);
        when(
          () => mockRemoteSource.updateItem(any()),
        ).thenAnswer((_) async => account);
        when(
          () => mockRemoteSource.addNewItem(any()),
        ).thenAnswer((_) async => account);
        when(() => mockRemoteSource.getAllItems()).thenAnswer((_) async => []);

        await repository.update(account);

        verify(() => mockLocalSource.update(any())).called(1);
      });
    });

    group('delete', () {
      test('should soft-delete account in local source', () async {
        when(
          () => mockLocalSource.softDelete('delete-id'),
        ).thenAnswer((_) async {});
        when(
          () => mockLocalSource.getDirtyRecords(),
        ).thenAnswer((_) async => []);

        await repository.delete('delete-id');

        verify(() => mockLocalSource.softDelete('delete-id')).called(1);
      });
    });

    group('syncWithRemote', () {
      test('should push dirty records to remote', () async {
        final dirtyAccount = createTestAccount(id: 'dirty-1', isDirty: true);
        when(
          () => mockLocalSource.getDirtyRecords(),
        ).thenAnswer((_) async => [dirtyAccount]);
        when(
          () => mockLocalSource.getDeletedRecords(),
        ).thenAnswer((_) async => []);
        when(
          () => mockRemoteSource.addNewItem(any()),
        ).thenAnswer((_) async => dirtyAccount);
        when(() => mockLocalSource.update(any())).thenAnswer((_) async {});
        when(() => mockRemoteSource.getAllItems()).thenAnswer((_) async => []);

        await repository.syncWithRemote();

        verify(() => mockLocalSource.update(any())).called(1);
      });

      test('should handle offline gracefully', () async {
        when(
          () => mockLocalSource.getDirtyRecords(),
        ).thenThrow(Exception('Network error'));

        // Should not throw
        await expectLater(repository.syncWithRemote(), completes);
      });
    });
  });
}
