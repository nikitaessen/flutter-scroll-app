import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_scroll_app/features/details/domain/entities/museum_object_details.dart';
import 'package:flutter_scroll_app/features/details/domain/use_cases/museum_object_details_use_case.dart';
import 'package:flutter_scroll_app/features/details/presentation/bloc/details_cubit.dart';
import 'package:flutter_scroll_app/features/details/presentation/bloc/details_status.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMuseumCollectionUseCase extends Mock
    implements MuseumObjectDetailsUseCase {}

void main() {
  group(DetailsCubit, () {
    const String objectNumber = 'number-one1';
    final MuseumObjectDetails objectDetails = MuseumObjectDetails(
      title: 'title',
      description: 'description',
      imageUrl: 'imageUrl',
    );

    late MuseumObjectDetailsUseCase museumCollectionUseCase;
    late DetailsCubit detailsCubit;

    setUp(() {
      museumCollectionUseCase = MockMuseumCollectionUseCase();
      detailsCubit = DetailsCubit(museumUseCase: museumCollectionUseCase);

      when(() => museumCollectionUseCase.execute(objectNumber: objectNumber))
          .thenAnswer((_) async => objectDetails);
    });

    test(
      'GIVEN OverviewCubit'
      'WHEN initialized'
      'THEN status initial',
      () {
        expect(detailsCubit.state.status, DetailsStatus.initial);
      },
    );

    blocTest(
      'GIVEN OverviewCubit'
      'WHEN getCollectionObjects() is called'
      'THEN status loaded',
      build: () => detailsCubit,
      act: (cubit) => cubit.getObjectDetails(objectNumber),
      expect: () => [
        const DetailsState(
          status: DetailsStatus.loading,
        ),
        DetailsState(
          status: DetailsStatus.loaded,
          title: objectDetails.title,
          description: objectDetails.description,
          imageUrl: objectDetails.imageUrl,
        ),
      ],
    );

    blocTest(
      'GIVEN OverviewCubit'
      'WHEN getCollectionObjects() is called, exception occured'
      'THEN status loaded',
      build: () => detailsCubit,
      act: (cubit) {
        when(() => museumCollectionUseCase.execute(objectNumber: objectNumber))
            .thenThrow(Exception());

        cubit.getObjectDetails(objectNumber);
      },
      expect: () => [
        const DetailsState(
          status: DetailsStatus.loading,
        ),
        const DetailsState(
          status: DetailsStatus.error,
        ),
      ],
    );
  });
}
