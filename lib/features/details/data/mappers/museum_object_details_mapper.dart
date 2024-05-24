import 'package:flutter_scroll_app/core/data/entities/art_image.dart';
import 'package:flutter_scroll_app/features/details/data/entities/collection_object_details_api_model.dart';
import 'package:flutter_scroll_app/features/details/domain/entities/museum_object_details.dart';
import 'package:flutter_scroll_app/core/util/constants/app_constants.dart';
import 'package:injectable/injectable.dart';

@injectable
class MuseumObjectDetailsMapper {
  MuseumObjectDetails map(CollectionObjectDetailsApiModel dataModel) {
    return MuseumObjectDetails(
      title: dataModel.artObject?.title ?? 'No title',
      description: dataModel.artObject?.description ?? 'No description',
      imageUrl: _mapImageUrl(dataModel.artObject?.webImage),
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
