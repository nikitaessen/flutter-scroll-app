// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'art_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtObject _$ArtObjectFromJson(Map<String, dynamic> json) => ArtObject(
      json['id'] as String?,
      json['objectNumber'] as String?,
      json['title'] as String?,
      json['description'] as String?,
      json['longTitle'] as String?,
      json['webImage'] == null
          ? null
          : ArtImage.fromJson(json['webImage'] as Map<String, dynamic>),
      json['headerImage'] == null
          ? null
          : ArtImage.fromJson(json['headerImage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ArtObjectToJson(ArtObject instance) => <String, dynamic>{
      'id': instance.id,
      'objectNumber': instance.objectNumber,
      'title': instance.title,
      'description': instance.description,
      'longTitle': instance.longTitle,
      'webImage': instance.webImage,
      'headerImage': instance.headerImage,
    };
