import 'package:flutter_scroll_app/src/data/models/art_image.dart';
import 'package:flutter_scroll_app/src/data/models/art_object.dart';
import 'package:flutter_scroll_app/src/data/models/collection_api_model.dart';
import 'package:flutter_scroll_app/src/data/mappers/museum_items_mapper.dart';
import 'package:flutter_scroll_app/src/domain/models/museum_object.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(MuseumItemsMapper, () {
    late MuseumItemsMapper mapper;
    late CollectionApiModel dataModel;

    final expectedModel = MuseumObject(
      id: 'id',
      objectNumber: 'objectNumber',
      title: 'title',
      imageUrl: 'url',
      headerImageUrl: 'url1',
    );

    setUp(() {
      mapper = MuseumItemsMapper();
      dataModel = CollectionApiModel(
        1,
        [
          ArtObject(
            expectedModel.id,
            expectedModel.objectNumber,
            expectedModel.title,
            'description',
            'longTitle',
            ArtImage('guid', expectedModel.imageUrl),
            ArtImage('guid', expectedModel.headerImageUrl),
          )
        ],
      );
    });

    test(
      'GIVEN MuseumItemsMapper'
      'WHEN map is called'
      'THEN returns expected model fields',
      () {
        final actual = mapper.map(dataModel).first;

        expect(actual.id, expectedModel.id);
        expect(actual.objectNumber, expectedModel.objectNumber);
        expect(actual.title, expectedModel.title);
        expect(actual.imageUrl, expectedModel.imageUrl);
        expect(actual.headerImageUrl, expectedModel.headerImageUrl);
      },
    );
  });
}
