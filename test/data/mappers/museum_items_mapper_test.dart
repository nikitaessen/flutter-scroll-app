import 'package:flutter_scroll_app/src/data/models/art_image.dart';
import 'package:flutter_scroll_app/src/data/models/art_object.dart';
import 'package:flutter_scroll_app/src/data/models/collection_api_model.dart';
import 'package:flutter_scroll_app/src/data/mappers/museum_items_mapper.dart';
import 'package:flutter_scroll_app/src/domain/models/museum_object.dart';
import 'package:flutter_scroll_app/src/presentation/constants/app_constants.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group(MuseumItemsMapper, () {
    late MuseumItemsMapper mapper;
    late CollectionApiModel dataModel;
    late CollectionApiModel emptyDataModel;
    late CollectionApiModel nullFieldsDataModel;

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
          ),
        ],
      );
      emptyDataModel = CollectionApiModel(null, null);
      nullFieldsDataModel = CollectionApiModel(
        2,
        [
          ArtObject(
            null,
            null,
            null,
            null,
            null,
            ArtImage('guid', null),
            ArtImage(null, ''),
          ),
          ArtObject(
            null,
            null,
            null,
            null,
            null,
            ArtImage(null, ''),
            null,
          ),
        ],
      );
    });

    test(
      'GIVEN MuseumItemsMapper '
      'WHEN map is called '
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

    test(
      'GIVEN MuseumItemsMapper and emptyDataModel '
      'WHEN map is called '
      'THEN returns expected model fields',
      () {
        final collection = mapper.map(emptyDataModel);

        expect(collection.count, 0);
        expect(collection.items.isEmpty, true);
      },
    );

    test(
      'GIVEN MuseumItemsMapper and nullFieldsDataModel '
      'WHEN map is called '
      'THEN returns expected model fields',
      () {
        final collection = mapper.map(nullFieldsDataModel);

        for( final item in collection.items) {
          expect(item.id, '');
          expect(item.objectNumber, '');
          expect(item.title, 'No title');
          expect(item.imageUrl, AppConstants.fallbackImageUrl);
          expect(item.headerImageUrl, AppConstants.fallbackImageUrl);
        }

        expect(collection.count, nullFieldsDataModel.count);
      },
    );
  });
}
