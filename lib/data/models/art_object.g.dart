// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'art_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtObject _$ArtObjectFromJson(Map<String, dynamic> json) => ArtObject(
      json['id'] as String,
      json['objectNumber'] as String,
      json['title'] as String,
      json['hasImage'] as bool,
      json['longTitle'] as String,
      ArtImage.fromJson(json['webImage'] as Map<String, dynamic>),
      ArtImage.fromJson(json['headerImage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ArtObjectToJson(ArtObject instance) => <String, dynamic>{
      'id': instance.id,
      'objectNumber': instance.objectNumber,
      'title': instance.title,
      'hasImage': instance.hasImage,
      'longTitle': instance.longTitle,
      'webImage': instance.webImage,
      'headerImage': instance.headerImage,
    };
