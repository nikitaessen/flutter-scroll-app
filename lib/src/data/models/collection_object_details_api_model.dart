import 'package:flutter_scroll_app/src/data/models/art_object.dart';
import 'package:json_annotation/json_annotation.dart';

part 'collection_object_details_api_model.g.dart';

@JsonSerializable()
class CollectionObjectDetailsApiModel {
  CollectionObjectDetailsApiModel(this.artObject);

  ArtObject artObject;

  factory CollectionObjectDetailsApiModel.fromJson(Map<String, dynamic> json) =>
      _$CollectionObjectDetailsApiModelFromJson(json);
  Map<String, dynamic> toJson() =>
      _$CollectionObjectDetailsApiModelToJson(this);
}
