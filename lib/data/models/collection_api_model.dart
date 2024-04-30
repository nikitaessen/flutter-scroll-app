import 'package:flutter_scroll_app/data/models/art_object.dart';
import 'package:json_annotation/json_annotation.dart';

part 'collection_api_model.g.dart';

@JsonSerializable()
class CollectionApiModel {
  CollectionApiModel(
    this.count,
    this.artObjects,
  );

  int count;
  List<ArtObject> artObjects;

    factory CollectionApiModel.fromJson(Map<String, dynamic> json) =>
      _$CollectionApiModelFromJson(json);
  Map<String, dynamic> toJson() => _$CollectionApiModelToJson(this);
}
