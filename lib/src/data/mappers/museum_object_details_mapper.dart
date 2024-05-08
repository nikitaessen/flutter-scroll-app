import 'package:flutter_scroll_app/src/data/models/collection_object_details_api_model.dart';
import 'package:flutter_scroll_app/src/domain/models/museum_object_details.dart';
import 'package:injectable/injectable.dart';

@injectable
class MuseumObjectDetailsMapper {
  MuseumObjectDetails map(CollectionObjectDetailsApiModel dataModel) {
    return MuseumObjectDetails(
      title: dataModel.artObject?.title ?? 'No title',
      description: dataModel.artObject?.description ?? 'No decription',
      imageUrl: dataModel.artObject?.webImage?.url ?? '',
    );
  }
}
