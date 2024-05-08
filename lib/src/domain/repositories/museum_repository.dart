import 'package:flutter_scroll_app/src/domain/models/museum_collection.dart';
import 'package:flutter_scroll_app/src/domain/models/museum_object_details.dart';

abstract class MuseumRepository {
  Future<MuseumCollection> getObjects(int page);
  Future<MuseumObjectDetails> getObjectDetails(String objectNumber);
}