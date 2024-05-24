import 'package:flutter_scroll_app/core/data/entities/art_image.dart';
import 'package:flutter_scroll_app/features/overview/data/entities/collection_api_model.dart';
import 'package:flutter_scroll_app/features/overview/domain/entities/museum_collection.dart';
import 'package:flutter_scroll_app/features/overview/domain/entities/museum_object.dart';
import 'package:flutter_scroll_app/core/util/constants/app_constants.dart';
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
