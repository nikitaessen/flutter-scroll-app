import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_scroll_app/domain/exceptions/repository_exception.dart';
import 'package:flutter_scroll_app/domain/models/museum_object.dart';
import 'package:flutter_scroll_app/domain/use_case/museum_collection_use_case.dart';
import 'package:flutter_scroll_app/presentation/bloc/overview/overview_cubit.dart';
import 'package:flutter_scroll_app/presentation/bloc/overview/overview_status.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMuseumCollectionUseCase extends Mock
    implements MuseumCollectionUseCase {}

void main() {
  group(OverviewCubit, () {
    late List<MuseumObject> museumObjects;

    late MuseumCollectionUseCase museumCollectionUseCase;
    late OverviewCubit overviewCubit;

    setUp(() {
      museumCollectionUseCase = MockMuseumCollectionUseCase();
      overviewCubit = OverviewCubit(museumUseCase: museumCollectionUseCase);
      museumObjects = List<MuseumObject>.empty();

      when(() => museumCollectionUseCase.execute())
          .thenAnswer((_) async => museumObjects);
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
