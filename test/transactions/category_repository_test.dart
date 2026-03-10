import 'package:expancetracker/core/services/connectivity_service.dart';
import 'package:expancetracker/transactions/datasources/local/categories_local_source.dart';
import 'package:expancetracker/transactions/datasources/remote/categories_remote_datasource.dart';
import 'package:expancetracker/transactions/models/category.dart';
import 'package:expancetracker/transactions/repositories/category_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCategoriesLocalSource extends Mock implements CategoriesLocalSource {}

class MockCategoriesRemoteDataSource extends Mock
    implements CategoriesRemoteDataSource {}

class MockConnectivityService extends Mock implements ConnectivityService {}

class FakeCategory extends Fake implements CategoryModel {}

void main() {
  late MockCategoriesLocalSource mockLocalSource;
  late MockCategoriesRemoteDataSource mockRemoteSource;
  late MockConnectivityService mockConnectivityService;
  late ValueNotifier<bool> isConnected;
  late CategoryRepository repository;

  setUpAll(() {
    registerFallbackValue(FakeCategory());
  });

  setUp(() {
    mockLocalSource = MockCategoriesLocalSource();
    mockRemoteSource = MockCategoriesRemoteDataSource();
    mockConnectivityService = MockConnectivityService();
    isConnected = ValueNotifier(true);
    when(() => mockConnectivityService.isConnected).thenReturn(isConnected);
    when(
      () => mockConnectivityService.checkConnectivity(),
    ).thenAnswer((_) async => isConnected.value);

    repository = CategoryRepository(
      localSource: mockLocalSource,
      remoteSource: mockRemoteSource,
      connectivityService: mockConnectivityService,
    );
  });

  tearDown(() {
    isConnected.dispose();
  });

  CategoryModel createCategory({String id = 'cat-1', bool isDirty = false}) {
    return CategoryModel(
      id: id,
      userId: 'user-1',
      name: 'Food',
      icon: '123',
      color: 'ffffff',
      isDirty: isDirty,
    );
  }

  test('syncWithRemote should skip when offline', () async {
    isConnected.value = false;

    await repository.syncWithRemote();

    verifyNever(() => mockLocalSource.getDirtyRecords());
    verifyNever(() => mockRemoteSource.getAllItems());
  });

  test('syncWithRemote should throw when one push fails', () async {
    final dirtyOne = createCategory(id: 'cat-1', isDirty: true);
    final dirtyTwo = createCategory(id: 'cat-2', isDirty: true);
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
