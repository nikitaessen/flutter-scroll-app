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
        final collection = mapper.map(dataModel);
        final collectionItem = mapper.map(dataModel).items.first;

        expect(collection.count, dataModel.count);
        expect(collectionItem.id, expectedModel.id);
        expect(collectionItem.objectNumber, expectedModel.objectNumber);
        expect(collectionItem.title, expectedModel.title);
        expect(collectionItem.imageUrl, expectedModel.imageUrl);
        expect(collectionItem.headerImageUrl, expectedModel.headerImageUrl);
      },
    );
  });
}
