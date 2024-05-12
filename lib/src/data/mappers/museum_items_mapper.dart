import 'package:flutter_scroll_app/src/data/models/art_image.dart';
import 'package:flutter_scroll_app/src/data/models/collection_api_model.dart';
import 'package:flutter_scroll_app/src/domain/models/museum_collection.dart';
import 'package:flutter_scroll_app/src/domain/models/museum_object.dart';
import 'package:flutter_scroll_app/src/presentation/constants/app_constants.dart';
import 'package:injectable/injectable.dart';

@injectable
class MuseumItemsMapper {
  MuseumCollection map(CollectionApiModel dataModel) {
    return MuseumCollection(
      count: dataModel.count ?? 0,
      items: dataModel.artObjects
              ?.map(
                (e) => MuseumObject(
                  id: e.id ?? '',
                  objectNumber: e.objectNumber ?? '',
                  title: e.title ?? 'No title',
                  imageUrl: _mapImageUrl(e.webImage),
                  headerImageUrl: _mapImageUrl(e.headerImage),
                ),
              )
              .toList() ??
          [],
    );
  }

  String _mapImageUrl(ArtImage? artImage) {
    final url = artImage?.url ?? '';

    if (url.isEmpty) {
      return AppConstants.fallbackImageUrl;
    }
    
    return url;
  }
}
