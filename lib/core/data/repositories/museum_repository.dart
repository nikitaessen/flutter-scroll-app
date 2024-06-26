import 'package:flutter_scroll_app/features/overview/domain/entities/museum_collection.dart';
import 'package:flutter_scroll_app/features/details/domain/entities/museum_object_details.dart';

abstract class MuseumRepository {
  Future<MuseumCollection> getObjects(int page);
  Future<MuseumObjectDetails> getObjectDetails(String objectNumber);
}