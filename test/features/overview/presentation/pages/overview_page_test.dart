import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_scroll_app/assets/fonts.gen.dart';
import 'package:flutter_scroll_app/features/overview/domain/entities/museum_object.dart';
import 'package:flutter_scroll_app/features/overview/presentation/bloc/overview_cubit.dart';
import 'package:flutter_scroll_app/features/overview/presentation/bloc/overview_status.dart';
import 'package:flutter_scroll_app/features/overview/presentation/pages/overview_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:network_image_mock/network_image_mock.dart';

import '../../../../bloc_provider_wrapper_extension.dart';

class MockOverviewCubit extends MockCubit<OverviewState>
    implements OverviewCubit {}

void main() {
  group(OverviewPage, () {
    late OverviewCubit cubit;

    setUp(() {
      cubit = MockOverviewCubit();
      when(() => cubit.getCollectionObjects())
          .thenAnswer((_) => Future.value());

      when(() => cubit.state).thenReturn(
        OverviewState(
          status: OverviewStatus.loaded,
          museumItems: List.generate(
            10,
            (index) => MuseumObject(
                id: '',
                objectNumber: '',
                title: '',
                imageUrl: '',
                headerImageUrl: ''),
          ),
        ),
      );
    });

    testGoldens('OverviewPage with items', (tester) async {
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
              home: const OverviewPage()
                  .createWithProvider<OverviewCubit>((_) => cubit)),
        ),
      );

      expect(find.byType(OverviewPage),
          matchesGoldenFile('goldens/overview_page_list.png'));

      debugDefaultTargetPlatformOverride = null;
      debugDisableShadows = true;
    });

    testGoldens('OverviewPage no items', (tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      debugDisableShadows = false;

      when(() => cubit.state).thenReturn(
        OverviewState(status: OverviewStatus.loaded, museumItems: List.empty()),
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
              home: const OverviewPage()
                  .createWithProvider<OverviewCubit>((_) => cubit)),
        ),
      );

      expect(find.byType(OverviewPage),
          matchesGoldenFile('goldens/overview_page_empty.png'));

      debugDefaultTargetPlatformOverride = null;
      debugDisableShadows = true;
    });

    testGoldens('OverviewPage no items', (tester) async {
      debugDefaultTargetPlatformOverride = TargetPlatform.iOS;
      debugDisableShadows = false;

      when(() => cubit.state).thenReturn(
        const OverviewState(status: OverviewStatus.error),
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
              home: const OverviewPage()
                  .createWithProvider<OverviewCubit>((_) => cubit)),
        ),
      );

      expect(find.byType(OverviewPage),
          matchesGoldenFile('goldens/overview_page_error.png'));

      debugDefaultTargetPlatformOverride = null;
      debugDisableShadows = true;
    });
  });
}
