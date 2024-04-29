// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'museum_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MuseumApiModel _$MuseumApiModelFromJson(Map<String, dynamic> json) =>
    MuseumApiModel(
      (json['count'] as num).toInt(),
      (json['artObjects'] as List<dynamic>)
          .map((e) => ArtObject.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MuseumApiModelToJson(MuseumApiModel instance) =>
    <String, dynamic>{
      'count': instance.count,
      'artObjects': instance.artObjects,
    };
