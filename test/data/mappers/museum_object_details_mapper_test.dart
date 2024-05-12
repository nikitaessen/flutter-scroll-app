import 'package:flutter_scroll_app/src/data/models/art_image.dart';
import 'package:flutter_scroll_app/src/data/models/art_object.dart';
import 'package:flutter_scroll_app/src/data/models/collection_object_details_api_model.dart';
import 'package:flutter_scroll_app/src/data/mappers/museum_object_details_mapper.dart';
import 'package:flutter_scroll_app/src/domain/models/museum_object_details.dart';
import 'package:flutter_scroll_app/src/presentation/constants/app_constants.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(MuseumObjectDetailsMapper, () {
    late MuseumObjectDetailsMapper mapper;
    late CollectionObjectDetailsApiModel dataModel;
    late CollectionObjectDetailsApiModel emptyDataModel;
    late CollectionObjectDetailsApiModel nullFieldsDataModel;

    final expectedModel = MuseumObjectDetails(
      title: 'title',
      description: 'description',
      imageUrl: 'url',
    );

    setUp(() {
      mapper = MuseumObjectDetailsMapper();
      dataModel = CollectionObjectDetailsApiModel(
        ArtObject(
          'id',
          'objectNumber',
          'title',
          'description',
          'longTitle',
          ArtImage('guid', expectedModel.imageUrl),
          ArtImage('guid', 'url'),
        ),
      );
      emptyDataModel = CollectionObjectDetailsApiModel(null);
      nullFieldsDataModel = CollectionObjectDetailsApiModel(
        ArtObject(
          null,
          null,
          null,
          null,
          null,
          ArtImage('guid', null),
          null,
        ),
      );
    });

    test(
      'GIVEN MuseumItemsMapper '
      'WHEN map is called '
      'THEN returns expected model fields',
      () {
        final actual = mapper.map(dataModel);

        expect(actual.title, expectedModel.title);
        expect(actual.description, expectedModel.description);
        expect(actual.imageUrl, expectedModel.imageUrl);
      },
    );

    test(
      'GIVEN MuseumItemsMapper with emptyDataModel '
      'WHEN map is called '
      'THEN returns expected model fields',
      () {
        final actual = mapper.map(emptyDataModel);

        expect(actual.title, 'No title');
        expect(actual.description, 'No description');
        expect(actual.imageUrl, AppConstants.fallbackImageUrl);
      },
    );

    test(
      'GIVEN MuseumItemsMapper with nullFieldsDataModel '
      'WHEN map is called '
      'THEN returns expected model fields',
      () {
        final actual = mapper.map(nullFieldsDataModel);

        expect(actual.title, 'No title');
        expect(actual.description, 'No description');
        expect(actual.imageUrl, AppConstants.fallbackImageUrl);
      },
    );
  });
}
