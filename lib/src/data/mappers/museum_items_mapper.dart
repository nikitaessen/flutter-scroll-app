import 'package:flutter_scroll_app/src/data/models/collection_api_model.dart';
import 'package:flutter_scroll_app/src/domain/models/museum_object.dart';
import 'package:injectable/injectable.dart';

@injectable
class MuseumItemsMapper {
  List<MuseumObject> map(CollectionApiModel dataModel) {
    return dataModel.artObjects
        .map(
          (e) => MuseumObject(
            id: e.id,
            objectNumber: e.objectNumber,
            title: e.title,
            imageUrl: e.webImage.url,
            headerImageUrl: e.headerImage?.url ?? '',
          ),
        )
        .toList();
  }
}
