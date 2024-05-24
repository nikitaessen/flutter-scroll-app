import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_scroll_app/core/util/exceptions/repository_exception.dart';
import 'package:flutter_scroll_app/features/overview/domain/entities/museum_collection.dart';
import 'package:flutter_scroll_app/features/overview/domain/entities/museum_object.dart';
import 'package:flutter_scroll_app/features/overview/domain/use_cases/museum_collection_use_case.dart';
import 'package:flutter_scroll_app/features/overview/presentation/bloc/overview_cubit.dart';
import 'package:flutter_scroll_app/features/overview/presentation/bloc/overview_status.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMuseumCollectionUseCase extends Mock
    implements MuseumCollectionUseCase {}

void main() {
  group(OverviewCubit, () {
    late List<MuseumObject> museumObjects;
    late MuseumCollection museumCollection;

    late MuseumCollectionUseCase museumCollectionUseCase;
    late OverviewCubit overviewCubit;

    setUp(() {
      museumCollectionUseCase = MockMuseumCollectionUseCase();
      overviewCubit = OverviewCubit(museumUseCase: museumCollectionUseCase);
      museumObjects = List<MuseumObject>.empty();
      museumCollection = MuseumCollection(count: 100, items: museumObjects);

      when(() => museumCollectionUseCase.execute())
          .thenAnswer((_) async => museumCollection);
    });

    test(
      'GIVEN OverviewCubit'
      'WHEN initialized'
      'THEN status initial',
      () {
        expect(overviewCubit.state.status, OverviewStatus.initial);
      },
    );

    blocTest(
      'GIVEN OverviewCubit'
      'WHEN getCollectionObjects() is called'
      'THEN status loaded',
      build: () => overviewCubit,
      act: (cubit) => cubit.getCollectionObjects(),
      expect: () => [
        OverviewState(
          status: OverviewStatus.loaded,
          museumItems: museumObjects,
        ),
      ],
    );

    blocTest(
      'GIVEN OverviewCubit'
      'WHEN getCollectionObjects() is called and limit reached'
      'THEN status loaded with hasReachedLimit = true',
      build: () => overviewCubit,
      act: (cubit) {
        when(() => museumCollectionUseCase.execute()).thenAnswer((_) async =>
            MuseumCollection(
                count: museumObjects.length, items: museumObjects));
        cubit.getCollectionObjects();
      },
      expect: () => [
        OverviewState(
          status: OverviewStatus.loaded,
          museumItems: museumObjects,
          hasReachedLimit: true,
        ),
      ],
    );

    blocTest(
      'GIVEN OverviewCubit'
      'WHEN getCollectionObjects() is called, exception occured'
      'THEN status loaded',
      build: () => overviewCubit,
      act: (cubit) {
        when(() => museumCollectionUseCase.execute()).thenThrow(Exception());

        cubit.getCollectionObjects();
      },
      expect: () => [
        const OverviewState(
          status: OverviewStatus.error,
        ),
      ],
    );

    blocTest(
      'GIVEN OverviewCubit'
      'WHEN getCollectionObjects() is called, RepositoryException occured'
      'THEN status loaded',
      build: () => overviewCubit,
      act: (cubit) {
        when(() => museumCollectionUseCase.execute())
            .thenThrow(RepositoryException(message: 'Test error message'));

        cubit.getCollectionObjects();
      },
      expect: () => [
        const OverviewState(
          status: OverviewStatus.error,
        ),
      ],
    );
  });
}
