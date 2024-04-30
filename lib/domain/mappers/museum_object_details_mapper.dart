import 'package:flutter_scroll_app/data/models/collection_api_model.dart';
import 'package:flutter_scroll_app/domain/models/museum_object_details.dart';
import 'package:injectable/injectable.dart';

@injectable
class MuseumObjectDetailsMapper {
  MuseumObjectDetails map(CollectionApiModel dataModel) {
    // TODO(Nikita): do mapping
    return MuseumObjectDetails(title: '', description: '', imageUrl: '');
  }
}
