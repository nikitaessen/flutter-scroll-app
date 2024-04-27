import 'package:flutter_scroll_app/data/api/museum_api_service.dart';
import 'package:flutter_scroll_app/data/repository/repository_base.dart';
import 'package:flutter_scroll_app/domain/models/museum_item.dart';
import 'package:flutter_scroll_app/domain/repository/museum_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: MuseumRepository)
class MuseumRepositoryImpl extends RepositoryBase implements MuseumRepository {
  MuseumRepositoryImpl({
    required this.museumApiService,
  });

  final MuseumApiService museumApiService;

  @override
  Future<List<MuseumItem>> getItems(int page) {
    return executeApiCall<List<MuseumItem>, Object>(
      invoker: () => museumApiService.getData(page),
      mapper: (body) {
        // TODO(Nikita): do an actual mapping
        return List<MuseumItem>.empty();
      },
    );
  }
}
