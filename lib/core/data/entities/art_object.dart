import 'package:flutter_scroll_app/core/data/entities/art_image.dart';
import 'package:json_annotation/json_annotation.dart';

part 'art_object.g.dart';

@JsonSerializable()
class ArtObject {
  ArtObject(
    this.id,
    this.objectNumber,
    this.title,
    this.description,
    this.longTitle,
    this.webImage,
    this.headerImage,
  );

  String? id;
  String? objectNumber;
  String? title;
  String? description;
  String? longTitle;
  ArtImage? webImage;
  ArtImage? headerImage;

  factory ArtObject.fromJson(Map<String, dynamic> json) =>
      _$ArtObjectFromJson(json);
  Map<String, dynamic> toJson() => _$ArtObjectToJson(this);
}
