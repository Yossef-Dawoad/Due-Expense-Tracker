import 'package:expancetracker/core/services/connectivity_service.dart';
import 'package:expancetracker/transactions/datasources/local/transaction_local_source.dart';
import 'package:expancetracker/transactions/datasources/remote/transaction_remote_source.dart';
import 'package:expancetracker/transactions/models/transaction.dart';
import 'package:expancetracker/transactions/repositories/transaction_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTransactionLocalSource extends Mock
    implements TransactionLocalSource {}

class MockTransactionRemoteSource extends Mock
    implements TransactionRemoteSource {}

class MockConnectivityService extends Mock implements ConnectivityService {}

class FakeTransaction extends Fake implements Transaction {}

void main() {
  late MockTransactionLocalSource mockLocalSource;
  late MockTransactionRemoteSource mockRemoteSource;
  late MockConnectivityService mockConnectivityService;
  late ValueNotifier<bool> isConnected;
  late TransactionRepository repository;

  setUpAll(() {
    registerFallbackValue(FakeTransaction());
  });

  setUp(() {
    mockLocalSource = MockTransactionLocalSource();
    mockRemoteSource = MockTransactionRemoteSource();
    mockConnectivityService = MockConnectivityService();
    isConnected = ValueNotifier(true);
    when(() => mockConnectivityService.isConnected).thenReturn(isConnected);
    when(
      () => mockConnectivityService.checkConnectivity(),
    ).thenAnswer((_) async => isConnected.value);

    repository = TransactionRepository(
      localSource: mockLocalSource,
      remoteSource: mockRemoteSource,
      connectivityService: mockConnectivityService,
    );
  });

  tearDown(() {
    isConnected.dispose();
  });

  Transaction createTransaction({
    String id = 'tx-1',
    bool isDirty = false,
    bool isDeleted = false,
    String? remoteId,
  }) {
    return Transaction(
      id: id,
      userId: 'user-1',
      accountId: 'account-1',
      amount: 42,
      type: TransactionType.expense,
      date: DateTime(2026, 1, 1),
      isDirty: isDirty,
      isDeleted: isDeleted,
      remoteId: remoteId,
    );
  }

  group('TransactionRepository connectivity-aware sync', () {
    test('syncWithRemote should skip when offline', () async {
      isConnected.value = false;

      await repository.syncWithRemote();

      verifyNever(() => mockLocalSource.getDirtyRecords());
      verifyNever(() => mockRemoteSource.getAllItems());
    });

    test('add should not trigger remote calls when offline', () async {
      isConnected.value = false;
      final transaction = createTransaction();
      when(() => mockLocalSource.insert(any())).thenAnswer((invocation) async {
        return invocation.positionalArguments[0] as Transaction;
      });

      await repository.add(transaction);
      await Future<void>.delayed(const Duration(milliseconds: 10));

      verifyNever(() => mockRemoteSource.addNewItem(any()));
      verifyNever(() => mockRemoteSource.updateItem(any()));
    });

    test(
      'syncWithRemote should continue items and throw aggregate error',
      () async {
        final dirtyOne = createTransaction(id: 'tx-1', isDirty: true);
        final dirtyTwo = createTransaction(id: 'tx-2', isDirty: true);
        when(
          () => mockLocalSource.getDirtyRecords(),
        ).thenAnswer((_) async => [dirtyOne, dirtyTwo]);
        when(
          () => mockLocalSource.getDeletedRecords(),
        ).thenAnswer((_) async => []);

        var callCount = 0;
        when(() => mockRemoteSource.addNewItem(any())).thenAnswer((_) async {
          callCount++;
          if (callCount == 1) {
            throw Exception('Server error');
          }
          return dirtyTwo.copyWith(remoteId: 'remote-2');
        });

        when(() => mockLocalSource.update(any())).thenAnswer((_) async {});
        when(() => mockRemoteSource.getAllItems()).thenAnswer((_) async => []);

        await expectLater(
          repository.syncWithRemote(),
          throwsA(isA<Exception>()),
        );

        verify(() => mockRemoteSource.addNewItem(any())).called(2);
        verify(() => mockLocalSource.update(any())).called(1);
      },
    );

    test('delete should trigger full sync path when online', () async {
      when(
        () => mockLocalSource.softDelete('tx-delete'),
      ).thenAnswer((_) async {});
      when(() => mockLocalSource.getDirtyRecords()).thenAnswer((_) async => []);
      when(
        () => mockLocalSource.getDeletedRecords(),
      ).thenAnswer((_) async => []);
      when(() => mockRemoteSource.getAllItems()).thenAnswer((_) async => []);

      await repository.delete('tx-delete');
      await Future<void>.delayed(const Duration(milliseconds: 10));

      verify(() => mockLocalSource.getDeletedRecords()).called(1);
    });
  });
}
