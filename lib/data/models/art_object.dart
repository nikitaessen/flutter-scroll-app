import 'package:flutter_scroll_app/data/models/art_image.dart';
import 'package:json_annotation/json_annotation.dart';

part 'art_object.g.dart';

@JsonSerializable()
class ArtObject {
  ArtObject(
    this.id,
    this.objectNumber,
    this.title,
    this.hasImage,
    this.longTitle,
    this.webImage,
    this.headerImage,
  );

  String id;
  String objectNumber;
  String title;
  bool hasImage;
  String longTitle;
  ArtImage webImage;
  ArtImage headerImage;

  factory ArtObject.fromJson(Map<String, dynamic> json) =>
      _$ArtObjectFromJson(json);
  Map<String, dynamic> toJson() => _$ArtObjectToJson(this);
}
