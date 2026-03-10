import 'package:expancetracker/core/services/connectivity_service.dart';
import 'package:expancetracker/transactions/datasources/local/tag_local_source.dart';
import 'package:expancetracker/transactions/datasources/remote/tag_remote_source.dart';
import 'package:expancetracker/transactions/models/tag.dart';
import 'package:expancetracker/transactions/repositories/tag_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockTagLocalSource extends Mock implements TagLocalSource {}

class MockTagRemoteSource extends Mock implements TagRemoteSource {}

class MockConnectivityService extends Mock implements ConnectivityService {}

class FakeTag extends Fake implements Tag {}

void main() {
  late MockTagLocalSource mockLocalSource;
  late MockTagRemoteSource mockRemoteSource;
  late MockConnectivityService mockConnectivityService;
  late ValueNotifier<bool> isConnected;
  late TagRepository repository;

  setUpAll(() {
    registerFallbackValue(FakeTag());
  });

  setUp(() {
    mockLocalSource = MockTagLocalSource();
    mockRemoteSource = MockTagRemoteSource();
    mockConnectivityService = MockConnectivityService();
    isConnected = ValueNotifier(true);
    when(() => mockConnectivityService.isConnected).thenReturn(isConnected);
    when(
      () => mockConnectivityService.checkConnectivity(),
    ).thenAnswer((_) async => isConnected.value);

    repository = TagRepository(
      localSource: mockLocalSource,
      remoteSource: mockRemoteSource,
      connectivityService: mockConnectivityService,
    );
  });

  tearDown(() {
    isConnected.dispose();
  });

  Tag createTag({String id = 'tag-1', bool isDirty = false}) {
    return Tag(id: id, userId: 'user-1', name: 'travel', isDirty: isDirty);
  }

  test('syncWithRemote should skip when offline', () async {
    isConnected.value = false;

    await repository.syncWithRemote();

    verifyNever(() => mockLocalSource.getDirtyRecords());
    verifyNever(() => mockRemoteSource.getAllItems());
  });

  test('syncWithRemote should throw when one push fails', () async {
    final dirtyOne = createTag(id: 'tag-1', isDirty: true);
    final dirtyTwo = createTag(id: 'tag-2', isDirty: true);
    when(
      () => mockLocalSource.getDirtyRecords(),
    ).thenAnswer((_) async => [dirtyOne, dirtyTwo]);
    when(() => mockLocalSource.getDeletedRecords()).thenAnswer((_) async => []);

    var callCount = 0;
    when(() => mockRemoteSource.addNewItem(any())).thenAnswer((_) async {
      callCount++;
      if (callCount == 1) {
        throw Exception('Failed first push');
      }
      return dirtyTwo.copyWith(remoteId: 'remote-2');
    });

    when(() => mockLocalSource.update(any())).thenAnswer((_) async {});
    when(() => mockRemoteSource.getAllItems()).thenAnswer((_) async => []);

    await expectLater(repository.syncWithRemote(), throwsA(isA<Exception>()));

    verify(() => mockRemoteSource.addNewItem(any())).called(2);
  });
}
