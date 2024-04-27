import 'package:flutter_scroll_app/domain/models/museum_item.dart';

abstract class MuseumRepository {
  Future<List<MuseumItem>> getItems(int page);
}