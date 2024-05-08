import 'package:flutter_scroll_app/src/domain/models/museum_object.dart';
import 'package:flutter_scroll_app/src/domain/models/museum_object_details.dart';

abstract class MuseumRepository {
  Future<List<MuseumObject>> getObjects(int page);
  Future<MuseumObjectDetails> getObjectDetails(String objectNumber);
}