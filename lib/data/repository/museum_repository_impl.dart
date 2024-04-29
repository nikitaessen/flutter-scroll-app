import 'package:flutter_scroll_app/data/api/museum_api_service.dart';
import 'package:flutter_scroll_app/data/models/museum_api_model.dart';
import 'package:flutter_scroll_app/data/repository/repository_base.dart';
import 'package:flutter_scroll_app/domain/mappers/museum_items_mapper.dart';
import 'package:flutter_scroll_app/domain/models/museum_item.dart';
import 'package:flutter_scroll_app/domain/repository/museum_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: MuseumRepository)
class MuseumRepositoryImpl extends RepositoryBase implements MuseumRepository {
  MuseumRepositoryImpl({
    required this.museumApiService,
    required this.museumItemsMapper,
  });

  final MuseumApiService museumApiService;
  final MuseumItemsMapper museumItemsMapper;

  @override
  Future<List<MuseumItem>> getItems(int page) {
    return executeApiCall<List<MuseumItem>, Object>(
      invoker: () => museumApiService.getData(page),
      mapper: (body) => museumItemsMapper.map(
        MuseumApiModel.fromJson(body as Map<String, dynamic>),
      ),
    );
  }
}
