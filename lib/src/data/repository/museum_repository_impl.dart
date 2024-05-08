import 'package:flutter_scroll_app/src/data/api/museum_api_service.dart';
import 'package:flutter_scroll_app/src/data/models/collection_api_model.dart';
import 'package:flutter_scroll_app/src/data/models/collection_object_details_api_model.dart';
import 'package:flutter_scroll_app/src/data/repository/repository_base.dart';
import 'package:flutter_scroll_app/src/data/mappers/museum_items_mapper.dart';
import 'package:flutter_scroll_app/src/data/mappers/museum_object_details_mapper.dart';
import 'package:flutter_scroll_app/src/domain/models/museum_collection.dart';
import 'package:flutter_scroll_app/src/domain/models/museum_object.dart';
import 'package:flutter_scroll_app/src/domain/models/museum_object_details.dart';
import 'package:flutter_scroll_app/src/domain/repositories/museum_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: MuseumRepository)
class MuseumRepositoryImpl extends RepositoryBase implements MuseumRepository {
  MuseumRepositoryImpl({
    required this.museumApiService,
    required this.museumItemsMapper,
    required this.museumObjectDetailsMapper,
  });

  final MuseumApiService museumApiService;
  final MuseumItemsMapper museumItemsMapper;
  final MuseumObjectDetailsMapper museumObjectDetailsMapper;

  @override
  Future<MuseumCollection> getObjects(int page) {
    return executeApiCall<MuseumCollection, Object>(
      invoker: () => museumApiService.fetchCollectionData(page),
      mapper: (body) => museumItemsMapper.map(
        CollectionApiModel.fromJson(body as Map<String, dynamic>),
      ),
    );
  }

  @override
  Future<MuseumObjectDetails> getObjectDetails(String objectNumber) {
    return executeApiCall<MuseumObjectDetails, Object>(
      invoker: () => museumApiService.fetchItemDetails(objectNumber),
      mapper: (body) => museumObjectDetailsMapper.map(
        CollectionObjectDetailsApiModel.fromJson(body as Map<String, dynamic>),
      ),
    );
  }
}
