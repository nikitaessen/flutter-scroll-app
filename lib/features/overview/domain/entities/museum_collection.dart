import 'package:flutter_scroll_app/features/overview/domain/entities/museum_object.dart';

class MuseumCollection {
  MuseumCollection({
    required this.count,
    required this.items,
  });

  final int count;
  final List<MuseumObject> items;
}
