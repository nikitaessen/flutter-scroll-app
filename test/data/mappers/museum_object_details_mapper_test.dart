import 'package:flutter_scroll_app/src/data/models/art_image.dart';
import 'package:flutter_scroll_app/src/data/models/art_object.dart';
import 'package:flutter_scroll_app/src/data/models/collection_object_details_api_model.dart';
import 'package:flutter_scroll_app/src/data/mappers/museum_object_details_mapper.dart';
import 'package:flutter_scroll_app/src/domain/models/museum_object_details.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(MuseumObjectDetailsMapper, () {
    late MuseumObjectDetailsMapper mapper;
    late CollectionObjectDetailsApiModel dataModel;

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
    });

    test(
      'GIVEN MuseumItemsMapper'
      'WHEN map is called'
      'THEN returns expected model fields',
      () {
        final actual = mapper.map(dataModel);

        expect(actual.title, expectedModel.title);
        expect(actual.description, expectedModel.description);
        expect(actual.imageUrl, expectedModel.imageUrl);
      },
    );
  });
}
