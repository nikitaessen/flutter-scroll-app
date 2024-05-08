import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scroll_app/src/assets/fonts.gen.dart';
import 'package:flutter_scroll_app/src/presentation/bloc/details/details_cubit.dart';
import 'package:flutter_scroll_app/src/presentation/bloc/details/details_status.dart';
import 'package:flutter_scroll_app/src/presentation/widget/details/details_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../bloc_provider_wrapper_extension.dart';

class MockDetailsCubit extends MockCubit<DetailsState>
    implements DetailsCubit {}

void main() {
  group(DetailsPage, () {
    late MockDetailsCubit cubit;

    const objectId = 'objectId';

    setUp(() {
      cubit = MockDetailsCubit();
      when(() => cubit.getObjectDetails(objectId))
          .thenAnswer((_) => Future.value());

      when(() => cubit.state).thenReturn(
        const DetailsState(
          status: DetailsStatus.loaded,
          title: 'Frans Hals',
          description:
              'Uitzonderlijk vernieuwend, vermakelijk en vol lef: Frans Hals was een van de meest bepalende schilders van de 17de eeuw. Zijn eigenzinnige, losse schilderstijl werd zo invloedrijk dat je bijna zou vergeten dat hij hier de grondlegger van was. Ontdek de streken van Frans Hals.',
          imageUrl: 'imageUrl',
        ),
      );
    });

    testGoldens('DetailsPage loaded', (tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      debugDisableShadows = false;

      await mockNetworkImagesFor(
        () async => await tester.pumpWidget(
          MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                useMaterial3: true,
                fontFamily: FontFamily.archivoBlack,
                textTheme: const TextTheme()
                  ..apply(
                    fontFamily: FontFamily.archivoBlack,
                  ),
              ),
              home: const DetailsPage(objectNumber: objectId)
                  .createWithProvider<DetailsCubit>((_) => cubit)),
        ),
      );

      expect(find.byType(DetailsPage),
          matchesGoldenFile('goldens/details_page.png'));

      debugDefaultTargetPlatformOverride = null;
      debugDisableShadows = true;
    });

    testGoldens('OverviewPage error', (tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      debugDisableShadows = false;

      when(() => cubit.state).thenReturn(
        const DetailsState(
          status: DetailsStatus.error,
        ),
      );

      await mockNetworkImagesFor(
        () async => await tester.pumpWidget(
          MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                useMaterial3: true,
                fontFamily: FontFamily.archivoBlack,
                textTheme: const TextTheme()
                  ..apply(
                    fontFamily: FontFamily.archivoBlack,
                  ),
              ),
              home: const DetailsPage(objectNumber: objectId)
                  .createWithProvider<DetailsCubit>((_) => cubit)),
        ),
      );

      expect(find.byType(DetailsPage),
          matchesGoldenFile('goldens/details_page_error.png'));

      debugDefaultTargetPlatformOverride = null;
      debugDisableShadows = true;
    });
  });
}
