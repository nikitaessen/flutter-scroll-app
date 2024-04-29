import 'package:flutter_scroll_app/data/models/museum_api_model.dart';
import 'package:flutter_scroll_app/domain/models/museum_item.dart';
import 'package:injectable/injectable.dart';

@injectable
class MuseumItemsMapper {
  List<MuseumItem> map(MuseumApiModel dataModel) {
    return dataModel.artObjects
        .map(
          (e) => MuseumItem(
            title: e.title,
            imageUrl: e.webImage.url,
          ),
        )
        .toList();
  }
}
