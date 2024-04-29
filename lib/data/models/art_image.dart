import 'package:json_annotation/json_annotation.dart';

part 'art_image.g.dart';

@JsonSerializable()
class ArtImage {
  ArtImage(this.guid, this.url);

  String guid;
  String url;

  factory ArtImage.fromJson(Map<String, dynamic> json) =>
      _$ArtImageFromJson(json);
  Map<String, dynamic> toJson() => _$ArtImageToJson(this);
}
