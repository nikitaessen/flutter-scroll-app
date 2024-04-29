import 'package:flutter_scroll_app/data/models/art_object.dart';
import 'package:json_annotation/json_annotation.dart';

part 'museum_api_model.g.dart';

@JsonSerializable()
class MuseumApiModel {
  MuseumApiModel(
    this.count,
    this.artObjects,
  );

  int count;
  List<ArtObject> artObjects;

    factory MuseumApiModel.fromJson(Map<String, dynamic> json) =>
      _$MuseumApiModelFromJson(json);
  Map<String, dynamic> toJson() => _$MuseumApiModelToJson(this);
}
