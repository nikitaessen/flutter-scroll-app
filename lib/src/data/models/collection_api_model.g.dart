// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CollectionApiModel _$CollectionApiModelFromJson(Map<String, dynamic> json) =>
    CollectionApiModel(
      (json['count'] as num?)?.toInt(),
      (json['artObjects'] as List<dynamic>?)
          ?.map((e) => ArtObject.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CollectionApiModelToJson(CollectionApiModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'artObjects': instance.artObjects,
    };
